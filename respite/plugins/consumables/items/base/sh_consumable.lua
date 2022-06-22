ITEM.name = "Food Base"
ITEM.desc = "This is test food."
ITEM.category = "Consumable"
ITEM.model = "models/props_junk/garbage_takeoutcarton001a.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.isFood = true
ITEM.cookable = false --can be cooked
ITEM.mustCooked = false --must be cooked to eat
ITEM.quantity2 = 1
ITEM.flag = "v"
ITEM.color = Color(50, 150, 50)
ITEM.sound = "npc/barnacle/barnacle_crunch2.wav" --sound it makes when you use it

ITEM.durationB = 7200 --attribute buff duration
ITEM.stomach = true --whether to use the stomach system or not

--[[
ITEM.onlySelf --disables using forward
--]]

--[[
--organic converter, scraps to this many organic things if enabled
ITEM.organicScrap = 0
--]]

--[[
--adds diseases
ITEM.disease = "" --disease to add
ITEM.disChance = 0 --chance of catching it
--]]

--[[
--cures diseases
ITEM.cures = {
	["fort_pani"] = true, 
}
--]]

--[[
--healing
ITEM.hp = 10 --amount to heal
ITEM.hpTime = 2 --time it takes in seconds
--]]

--[[
ITEM.modelColor = Color(0,0,0) --applies a color to the item entity on drop
ITEM.modelScale = 1 --scales the model size of the item entity on drop
--]]

--[[
ITEM.notify --nutscript notification when item is used.
--]]

--[[
ITEM.extraFunc = function(item, client)
	print("this is a thing")
end
--]]

--[[
ITEM.confirm = {
	name = "",
	query = "",
}
--]]

--[[
--a screen effect
--if you don't want a certain one, just delete its variable from the table
ITEM.effect = {
	colorMod = {
	
	},
	
	bloom = {
		darken = 0.65,
		mult = 0.2,
		sizeX = 9,
		sizeY = 9,
		passes = 1,
		colorMult = 1,
		r = 1,
		g = 1,
		b = 1
	},
	
	texturize = "", --requires a texture
	
	sobel = 0.5,
	
	sharpen = {
		contrast = 1,
		dist = 1
	},

	motionblur = {
		addAlpha = 1,
		drawAlpha = 1,
		delay = 1,
	},
}
--]]

--stomach checker and updater, handles if people can keep eating
local function stomachCheck(item, client, char)
	if(nut.config.get("cookfood_stomach", true)) then
		local stomachOverwrite = hook.Run("stomachOverwrite", item, client, char)
		if(!stomachOverwrite) then
			if(char:getData("stomach", 0) < 4) then
				char:setData("stomach", char:getData("stomach", 0) + 1)
				timer.Simple(item.durationB, function() --needs to be independent of attribute since those don't stack for the same item.
					char:setData("stomach", char:getData("stomach", 0) - 1)
				end)
			else
				client:notify("You are too full!")
				return true
			end
		else
			--this is stupid
			--1 to allow eating food
			--0 to stop eating food
			if(stomachOverwrite == 0) then
				return true
			else
				return false
			end
		end
	end
end

--function that removes all the buffs that the item provides
local function buffRemoval(item, client, charID)
	if (IsValid(client)) then
		local curChar = client:getChar()
		if (curChar and curChar:getID() == charID) then
			client:notify(Format("%s has worn off.", name))

			-- attribute boost removal
			local attribs = item:getData("attrib", item.attrib)
			if (attribs) then
				for k, v in pairs(attribs) do
					char:removeBoost(item:getName(), k)
				end
			end
			
			-- buff removal
			local buff = item:getData("buffTbl", item.buffTbl)
			if(buff) then
				client:removeBuff(nil, item.uniqueID)
			end		
		end
		
		
	end
end

local function consume(client, item)
	local char = client:getChar()

	--stomach checker
	if(item.stomach) then
		if(stomachCheck(item, client, char)) then
			return false
		end
	end
	
	if(item.faction and !item.faction[char:getFaction()]) then
		client:notify("Your faction cannot use this.")
		return false
	end
	
	local charID = char:getID()
	local name = item:getName()
	
	if (char and client:Alive()) then
		--buff duration modification
		local durationB = item.durationB
		
		--trait bonuses
		if(TRAITS and hasTrait(client, "survival")) then
			durationB = durationB * 1.2
		end

		--attribs
		local attribs = item:getData("attrib", item.attrib)
		if(attribs) then
			--adds attribs
			for buffAttrib, buffValue in pairs(attribs) do
				char:addBoost(name, buffAttrib, buffValue)
			end

			--timer for buff removal
			if(timer.Exists("DrugEffect_" ..name.. "_" ..client:EntIndex())) then --refreshes existing buffs if they exist
				timer.Adjust("DrugEffect_" ..name.. "_" ..client:EntIndex(), durationB, 1, function()
					buffRemoval(item, client, charID)
				end)
			else				
				timer.Create("DrugEffect_" ..name.. "_" ..client:EntIndex(), durationB, 1, function()
					buffRemoval(item, client, charID)
				end)
			end
		end
		
		--buffs
		local buff = item:getData("buffTbl", item.buffTbl)
		if(buff) then		
			--this duration is for turn based combat
			if(!buff.duration) then
				--[[
				if(potion) then
					buff.duration = 3 --for turn based
				else
					buff.duration = 6 --for turn based
				end
				--]]
			end
			
			if(!buff.uid) then
				buff.uid = item.uniqueID
			end
			
			if(!buff.name) then
				buff.name = name
			end
		
			client:addBuff(buff)

			--timer for buff removal
			if(timer.Exists("DrugEffect_" ..name.. "_" ..client:EntIndex())) then --refreshes existing buffs if they exist
				timer.Adjust("DrugEffect_" ..name.. "_" ..client:EntIndex(), durationB, 1, function()
					buffRemoval(item, client, charID)
				end)
			else				
				timer.Create("DrugEffect_" ..name.. "_" ..client:EntIndex(), durationB, 1, function()
					buffRemoval(item, client, charID)
				end)
			end
		end
	end
	
	--disease support
	if(DISEASES) then
		--gives diseases
		if(item.disease) then
			local roll = math.random(1,100)
			
			if(roll <= (item.disChance or 100)) then
				client:giveDisease(item.disease)
			end
		end
		
		--cures diseases
		if(item.cures) then
			for k, v in pairs(item.cures) do
				if(client:hasDisease(k)) then
					client:removeDisease(k)
				end
			end
		end
	end
	
	--hp healing
	if(item.hp) then
		local id = "nutHeal_"..FrameTime()
		local hpTime = item.hpTime or 1
		
		timer.Create(id, 1, hpTime, function()
			if (!IsValid(client) or !client:Alive()) then
				timer.Destroy(id)	
			end

			local newHP = math.Clamp(client:Health() + (item.hp/hpTime), 0, client:GetMaxHealth())

			client:SetHealth(newHP) -- actual health
			client:setHP(newHP) -- for combat system
		end)
	end
	
	--mp healing
	if(item.mp) then
		local id = "nutHealMP_"..FrameTime()
		timer.Create(id, 1, item.mpTime or 0, function()
			if (!IsValid(client) or !client:Alive()) then
				timer.Destroy(id)
			end

			client:setMP(math.Clamp(client:getMP() + (item.mp/(item.mpTime or 1)), 0, client:getMaxMP()))
		end)
	end
	
	--notifies the player in the top right with a message
	if(item.notify) then
		client:notify(item.notify)
	end
	
	if(item.extraFunc) then
		item.extraFunc(item, client)
	end
	
	--custom screen effects
	if(item.effect) then
		client:nutEffectAdd(item.id, item.effect)
	end
	
	--emits sound from player
	if(item.sound) then
		client:EmitSound(item.sound, 75, item.soundPitch or 100)
	end
	
	--this is garbage and should be redone properly.
	if(item.soundURL) then 
		local stupidlua = "sound.PlayURL('" ..item.soundURL.. "', '', function() end)"
		
		client:SendLua(stupidlua)
	end
	
	--reduce quantity by 1
	local quantity2 = item:getData("quantity2", item.quantity2)
	quantity2 = quantity2 - 1
	if (quantity2 >= 1) then
		item:setData("quantity2", quantity2)
		return false
	else
		--whether or not to drop a container
		if(item.container) then
			local position = client:getItemDropPos()
			local inventory = char:getInv()
			
			local newCustom = {}
			
			--whether or not to save the model
			if(item.containerMdl) then
				local customData = item:getData("custom", {})				
				newCustom.model = customData.model
				newCustom.material = customData.material
			end
			
			inventory:addSmart(item.container, 1, position, {custom = newCustom})
		end
	end
	
	return true
end

ITEM.functions.use = {
	name = "Use",
	tip = "useTip",
	icon = "icon16/cup.png",
	onRun = function(item)
		local client = item.player
		
		local consumed
		if(item.confirm) then --confirmation prompt for using the thing
			client:requestQuery(item.confirm.query, item.confirm.name, function(text)
				consumed = consume(client, item)
				
				if(consumed) then --if this returns true, that means item is gone
					item:remove()
				end
			end)
		else
			consumed = consume(client, item)
			
			if(consumed) then --if this returns true, that means item is gone
				item:remove()
			end
		end
		
		return false
	end,
	onCanRun = function(item)
		if (item.mustCooked and item:getData("cooked", 1) == 1) then
			return false
		end
		
		return (!IsValid(item.entity))
	end
}

// On player uneqipped the item, Removes a weapon from the player and keep the ammo in the item.
ITEM.functions.usef = { -- sorry, for name order.
	name = "Use Forward",
	tip = "useTip",
	icon = "icon16/cup_go.png",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local trace = client:GetEyeTraceNoCursor()
		local target = trace.Entity

		if (IsValid(target) and target:IsPlayer() and target:Alive()) then
			if(!target.pendingEat or target.pendingEat < CurTime()) then --so you can't spam people
				target.pendingEat = CurTime() + 10
				target:requestQuery(client:Name().. " wants to use " ..item:getName().. " on you." , "Consumable Request", function()
					target.pendingEat = nil
					
					local consumed
					if(item.confirm) then --confirmation prompt for using the thing
						target:requestQuery(item.confirm.query, item.confirm.name, function(text)
							consumed = consume(target, item)
							
							if(consumed) then --if this returns true, that means item is gone
								item:remove()
							end
						end)
					else
						consumed = consume(target, item)
						
						if(consumed) then --if this returns true, that means item is gone
							item:remove()
						end
					end
				end)
			else
				return false
			end
		else
			client:notify("Invalid target.")
		end

		return false
	end,
	onCanRun = function(item)
		if(IsValid(item.entity)) then
			return false
		end
		
		if(item.onlySelf) then
			return false
		end
		
		return true
	end
}

ITEM.functions.Inspect = {
	name = "Inspect",
	tip = "Inspect this item",
	icon = "icon16/picture.png",
	onClick = function(item)
		local frame = vgui.Create("DFrame")
		frame:SetSize(540, 680)
		frame:SetTitle(item.name)
		frame:MakePopup()
		frame:Center()

		frame.html = frame:Add("DHTML")
		frame.html:Dock(FILL)
		
		local customData = item:getData("custom", {})
		
		local imageCode = [[<img src = "]]..customData.img..[["/>]]
		
		frame.html:SetHTML([[<html><body style="background-color: #000000; color: #282B2D; font-family: 'Book Antiqua', Palatino, 'Palatino Linotype', 'Palatino LT STD', Georgia, serif; font-size 16px; text-align: justify;">]]..imageCode..[[</body></html>]])
	end,
	onRun = function(item)
		return false
	end,
	onCanRun = function(item)
		local customData = item:getData("custom", {})
	
		if(!customData.img) then
			return false
		end
		
		return true
	end
}

ITEM.functions.Custom = {
	name = "Customize",
	tip = "Customize this item",
	icon = "icon16/wrench.png",
	onRun = function(item)		
		nut.plugin.list["customization"]:startCustom(item.player, item)
		
		return false
	end,
	
	onCanRun = function(item)
		local client = item.player
		return client:getChar():hasFlags("1")
	end
}

ITEM.functions.CustomAttr = {
	name = "Customize Attributes",
	tip = "Customize this item",
	icon = "icon16/wrench.png",
	onRun = function(item, data)
		nut.plugin.list["customization"]:startCustomA(item.player, item)
		
		return false
	end,
	onCanRun = function(item)
		local client = item.player
		return client:getChar():hasFlags("1")
	end
}

ITEM.functions.CustomQuan = {
	name = "Customize Quantity",
	tip = "Customize this item",
	icon = "icon16/wrench.png",
	onRun = function(item)
		local client = item.player

		client:requestString("Change Quantity", "", function(text)	
			local amount = tonumber(text)
			if(amount) then
				item:setData("quantity2", amount)
			end
		end, item:getData("quantity2", 1))
		
		return false
	end,
	onCanRun = function(item)
		local client = item.player
		return client:getChar():hasFlags("1")
	end
}

ITEM.functions.Clone = {
	name = "Clone",
	tip = "Clone this item",
	icon = "icon16/wrench.png",
	onRun = function(item)
		local client = item.player	
	
		client:requestQuery("Are you sure you want to clone this item?", "Clone", function(text)
			local inventory = client:getChar():getInv()
			
			if(!inventory:add(item.uniqueID, 1, item.data)) then
				client:notify("Inventory is full")
			end
		end)
		return false
	end,
	onCanRun = function(item)
		local client = item.player
		return client:getChar():hasFlags("1")
	end
}

ITEM.functions.Convert = {
	tip = "Convert this item",
	icon = "icon16/cross.png",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()	
	
		inventory:addSmart("j_scrap_organic", 1, position, {Amount = item.organicScrap})
		
		client:EmitSound("physics/flesh/flesh_squishy_impact_hard" ..math.random(1,4).. ".wav", 65, math.random(80,110))
	end,
	onCanRun = function(item)
		local client = item.player
		
		if(!item.organicScrap) then
			return false
		end
		
		return client:getChar():hasFlags("q") or client:getChar():getInv():getFirstItemOfType("converter_meat")
	end
}

function ITEM:onEntityCreated(entity)
	if(self.modelColor) then
		entity:SetColor(self.modelColor)
	end

	if(self.modelScale) then
		entity:SetModelScale(self.modelScale, 0.0001)
		entity:Activate()
	end

	if(self.entMass) then
		local physObj = entity:GetPhysicsObject()
		if(IsValid(physObj)) then
			physObj:SetMass(self.entMass)
		end
	end
end

function ITEM:getDesc(partial)
	local desc = self.desc

	local customData = self:getData("custom", {})
	if(customData.desc) then
		desc = customData.desc
	end
	
	if(!partial) then
		if (self.mustCooked != false) then
			desc = desc .. "\nThis food must be cooked."
		end
		
		if(customData.quality) then
			desc = desc.. "\nQuality: " ..customData.quality
		end

		if(self.quantity2) then
			desc = desc.. "\nRemaining Uses: " ..self:getData("quantity2", self.quantity2)
		end
		
		local hp = self:getData("hp", self.hp)
		if(hp) then
			desc = desc.. "\nHP Restore: " ..hp
			
			if(self.hpTime) then
				desc = desc.. " HP over " ..self.hpTime.. " seconds."
			end
		end
		
		local mp = self:getData("mp", self.mp)
		if(mp) then
			desc = desc.. "\nMP Restore: " ..mp
			
			if(self.mpTime) then
				desc = desc.. " MP over " ..self.mpTime.. " seconds."
			end
		end
		
		local attribs = self:getData("attrib", self.attrib)
		if(attribs) then
			desc = desc.. "\n\n<color=50,200,50>Bonuses</color>"
			
			for buffAttrib, buffValue in pairs(attribs) do
				if(buffValue != 0) then
					desc = desc .. "\n " ..((nut.attribs.list[buffAttrib] and nut.attribs.list[buffAttrib].name) or "Unknown Attribute").. ": " ..buffValue
				end
			end
		end
		
		local buffTbl = self:getData("buffTbl", self.buff)
		if(buffTbl) then
			desc = desc.. "\n\n<color=50,200,50>Buffs</color>"
			
			local attribs = buffTbl.attrib or {}
			for buffAttrib, buffValue in pairs(attribs) do
				if(buffValue != 0) then
					desc = desc .. "\n " ..((nut.attribs.list[buffAttrib] and nut.attribs.list[buffAttrib].name) or "Unknown Attribute").. ": " ..buffValue
				end
			end
			
			local accuracy = buffTbl.accuracy
			if(accuracy) then
				desc = desc .. "\n Accuracy: " ..accuracy
			end
			
			local evasion = buffTbl.evasion
			if(evasion) then
				desc = desc .. "\n Evasion: " ..evasion
			end
			
			local armor = buffTbl.armor
			if(armor) then
				desc = desc .. "\n Armor: " ..armor
			end
			
			local res = buffTbl.res
			if(res) then
				desc = desc .. "\n\n Resistances: "
				
				for k, v in pairs(res) do
					desc = desc.. "\n   " ..k..": " ..v.. "%"
				end
			end
			
			local amp = buffTbl.amp
			if(amp) then
				desc = desc .. "\n\n Amplifications: "
				
				for k, v in pairs(amp) do
					desc = desc.. "\n   " ..k..": " ..v
				end
			end
		end
	end
	
	-- Only show these things in the crafting menu
	if(CLIENT and IsValid(nut.gui.craftingDynamic)) then
		desc = desc.. "\n\n<color=50,200,50>Ingredient Tags</color>"
		
		for tag, _ in pairs(self.loot) do
			desc = desc .. "\n ["..tag.. "]"
		end
	end
		
	return desc
end

function ITEM:getName()
	local name = self.name
	
	local customData = self:getData("custom", {})
	if(customData.name) then
		name = customData.name
	end
	
	return name
end

function ITEM:onGetDropModel()
	local model = self.model
	
	local customData = self:getData("custom", {})
	if(customData.model) then
		model = customData.model
	end
	
	return Format(model)
end

if (CLIENT) then --draws a square on the food item for how well cooked it is.
	function ITEM:paintOver(item, w, h)
		local cooked = item:getData("cooked", 1)
		
		local quantity2 = tonumber(item:getData("quantity2", item.quantity2))
		if (quantity2) then
			draw.SimpleText(quantity2.. "/" ..item.quantity2, "DermaDefault", 6, h - 16, Color(50,200,50), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, color_black)
		end

		if (cooked > 1) then
			local col = COOKLEVEL[cooked][3]

			surface.SetDrawColor(col.r, col.g, col.b, 100)
			surface.DrawRect(w - 14, h - 14, 8, 8)
		end
	end
end