ITEM.name = "Consumable Base"
ITEM.desc = "This is test consumable."
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

ITEM.customizable = {
	["name"] = true,
	["desc"] = true,
	["model"] = true,
	["modelScale"] = true,
	["modelColor"] = true,
	["material"] = true,
	["color"] = true,
	["img"] = true,
	
	["res"] = true,
	["resEffect"] = true,
	["amp"] = true,
	["attrib"] = true,
	
	["duration"] = true,
	["armor"] = true,
	["accuracy"] = true,
	["evasion"] = true,
	["hp"] = true,
	["hpMax"] = true,
	["quantity2"] = true,
	
	["critC"] = true,
	["critF"] = true,
	["critM"] = true,
}

function ITEM:getCustomFields()
	local item = self

	if(!item.customizable) then return end
	local customizable = item.customizable

	local saveData = item:getData("custom", {})	
	local buffTbl = item:getData("buffTbl", {})

	local config = {
		{
			["name"] = {
				weight = 1, 
				name = "Name", 
				category = "Basic",
				value = saveData.name or item.name,
				updateType = "Custom",
			},
			["desc"] = {
				weight = 2, 
				name = "Description", 
				category = "Basic",
				value = saveData.desc or item.desc,
				updateType = "Custom",
			},	
			["model"] = {
				weight = 13, 
				name = "Model", 
				category = "Basic",
				value = saveData.model or item.model,
				updateType = "Custom",
				onUpdate = function(item, data)
					local entity = item:getEntity()
					if(entity and IsValid(entity)) then
						entity:SetModel(data)
						entity:PhysicsInit(SOLID_VPHYSICS)
						entity:SetSolid(SOLID_VPHYSICS)
					end
				end,
			},
			["modelScale"] = {
				weight = 14, 
				name = "Model Scale", 
				category = "Basic",
				value = saveData.modelScale or item.modelScale or 1,
				numeric = true,
				updateType = "Custom",
				onUpdate = function(item, data)
					local entity = item:getEntity()
					if(entity and IsValid(entity)) then
						item:onEntityCreated(entity)
					end
				end,
			},
			["material"] = {
				weight = 15, 
				name = "Material", 
				category = "Basic",
				value = saveData.material or item.material,
				updateType = "Custom",
				onUpdate = function(item, data)
					local entity = item:getEntity()
					if(entity and IsValid(entity)) then
						entity:SetModelScale(data)
					end
				end,
			},
			["quantity2"] = {
				weight = 16, 
				name = "Quantity", 
				category = "Basic",
				value = item:getData("quantity2", item.quantity2),
				numeric = true,
			},
			["color"] = {
				weight = 17, 
				name = "Inventory Color", 
				category = "Basic",
				value = saveData.color or item.color,
				updateType = "Custom",
				panelType = "DColorMixer",
			},
			["modelColor"] = {
				weight = 18, 
				name = "Model Color", 
				category = "Basic",
				value = saveData.modelColor or item.modelColor,
				updateType = "Custom",
				panelType = "DColorMixer",
				onUpdate = function(item, data)
					local entity = item:getEntity()
					if(entity and IsValid(entity)) then
						entity:SetColor(data)
					end
				end,
			},
		},
		{
			["attrib"] = {
				weight = 8, 
				name = "Attributes", 
				category = "Attributes",
				value = buffTbl.attrib or item:getData("attrib", item.attrib),
				extra = nut.attribs.list,
				numeric = true,
			},
		},
		{
			["res"] = {
				weight = 9, 
				name = "Resistances (Damage)", 
				category = "Resistances",
				value = buffTbl.res or item:getData("res", item.res),
				extra = nut.plugin.list["combat"].dmgTypes, --needs effect types too
				numeric = true,
				updateType = function(item, data, fullData)
					local res = data
				
					local resEffect = fullData["resEffect"] or {}
					for k, v in pairs(data) do
						res[k] = v
					end
					
					item:setData("res", res)
				end,
			},
			["resEffect"] = {
				weight = 10, 
				name = "Resistances (Effects)", 
				category = "Resistances",
				value = buffTbl.res or item:getData("res", item.res),
				extra = EFFS.effects, --needs effect types too
				numeric = true,
				updateType = function(item, data, fullData)
					--handled by res category
				end,
			},
		},
		{
			["amp"] = {
				weight = 10, 
				name = "Amplifications", 
				category = "Amplifications",
				value = buffTbl.amp or item:getData("amp", item.amp),
				extra = nut.plugin.list["combat"].dmgTypes,
				numeric = true,
			},
		},
		{
			["duration"] = {
				weight = 1, 
				name = "Buff Duration", 
				category = "Buff",
				value = buffTbl.duration,
				numeric = true,
				updateType = "buffTbl",
			},
			["armor"] = {
				weight = 2, 
				name = "Armor", 
				category = "Combat Stats",
				value = buffTbl.armor,
				numeric = true,
				updateType = "buffTbl",
			},
			["accuracy"] = {
				weight = 3, 
				name = "Accuracy", 
				category = "Combat Stats",
				value = buffTbl.accuracy,
				numeric = true,
				updateType = "buffTbl",
			},
			["evasion"] = {
				weight = 4, 
				name = "Evasion", 
				category = "Combat Stats",
				value = buffTbl.evasion,
				numeric = true,
				updateType = "buffTbl",
			},
			["hpMax"] = {
				weight = 5, 
				name = "Max Health", 
				category = "Combat Stats",
				value = buffTbl.hpMax,
				numeric = true,
				updateType = "buffTbl",
			},
			["hp"] = {
				weight = 6, 
				name = "Health", 
				category = "Combat Stats",
				value = buffTbl.hp,
				numeric = true,
				updateType = "buffTbl",
			},
			["critC"] = {
				weight = 7, 
				name = "Crit Chance", 
				category = "Combat Stats",
				value = buffTbl.critC,
				numeric = true,
				updateType = "buffTbl",
			},
			["critM"] = {
				weight = 8, 
				name = "Crit Mult", 
				category = "Combat Stats",
				value = buffTbl.critM,
				numeric = true,
				updateType = "buffTbl",
			},
			["critF"] = {
				weight = 9, 
				name = "Crit Fail", 
				category = "Combat Stats",
				value = buffTbl.critF,
				numeric = true,
				updateType = "buffTbl",
			},
		},
	}
	
	for k, category in pairs(config) do
		for var, _ in pairs(category) do
			if(!customizable[var]) then
				config[k][var] = nil
			end
		end
	end
	
	return config
end

function ITEM:postCustom(client, item, data)
	local buffTbl = item:getData("buffTbl", {})

	local fields = nut.plugin.list["customization"]:getCustomFields(item)
	for _, dataFields in pairs(fields) do
		for id, v in pairs(dataFields) do
			if(data[id]) then
				if(v.updateType == "buffTbl") then
					buffTbl[id] = data[id]
				end
			end
		end
	end
	
	item:setData("buffTbl", buffTbl)
end

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

ITEM.sp = 10 --amount to heal
ITEM.spTime = 2 --time it takes in seconds
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
local function buffRemoval(item, client, charID, name)
	if (IsValid(client)) then
		local curChar = client:getChar()
		if (curChar and curChar:getID() == charID) then
			client:notify(Format("%s has worn off.", name))

			local attrib = item:getData("attrib", item.attrib)
			local res = item:getData("res", item.res)
			local amp = item:getData("amp", item.amp)
			local buffTbl = item:getData("buffTbl", item.buffTbl)
			
			-- buff removal
			if(attrib or res or amp or buffTbl) then
				client:removeBuff(nil, item.uniqueID)
			end
		end
	end
end

local function consume(client, item)
	local char = client:getChar()
	local charID = char:getID()
	local name = item:getName()

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
	
	if (char and client:Alive()) then
		--buff duration modification
		local durationB = item.durationB
		
		--trait bonuses
		if(TRAITS and client:hasTrait("survival")) then
			durationB = durationB * 1.2
		end

		--attribs
		--[[
		local attribs = item:getData("attrib", item.attrib)
		if(attribs) then
			--adds attribs
			for buffAttrib, buffValue in pairs(attribs) do
				char:addBoost(name, buffAttrib, buffValue)
			end
		end
		--]]
		
		local res = item:getData("res")
		local amp = item:getData("amp")
		local attrib = item:getData("attrib", item.attrib)
		local buffTbl = table.Copy(item:getData("buffTbl", item.buffTbl)) or {}
		
		--merges base/custom amp with crafted ones
		for k, v in pairs(amp or {}) do
			if(!buffTbl.amp) then buffTbl.amp = {} end
		
			buffTbl.amp[k] = (buffTbl.amp[k] or 0) + v
		end
		
		--merges base/custom res with crafted ones
		for k, v in pairs(res or {}) do
			if(!buffTbl.res) then buffTbl.res = {} end
		
			buffTbl.res[k] = (buffTbl.res[k] or 0) + v
		end
		
		--merges base/custom attributes with crafted ones
		for k, v in pairs(attrib or {}) do
			if(!buffTbl.attrib) then buffTbl.attrib = {} end
		
			buffTbl.attrib[k] = (buffTbl.attrib[k] or 0) + v
		end

		--buffs
		if(!table.IsEmpty(buffTbl)) then
			--this duration is for turn based combat
			if(!buffTbl.duration) then
				--[[
				if(potion) then
					buff.duration = 3 --for turn based
				else
					buff.duration = 6 --for turn based
				end
				--]]
			end
			
			if(!buffTbl.uid) then
				buffTbl.uid = item.uniqueID
			end
			
			if(!buffTbl.name) then
				buffTbl.name = name
			end

			client:addBuff(buffTbl)
		end
		
		if(buff) then
			--timer for buff removal
			if(timer.Exists("DrugEffect_" ..name.. "_" ..client:EntIndex())) then --refreshes existing buffs if they exist
				timer.Adjust("DrugEffect_" ..name.. "_" ..client:EntIndex(), durationB, 1, function()
					buffRemoval(item, client, charID, name)
				end)
			else				
				timer.Create("DrugEffect_" ..name.. "_" ..client:EntIndex(), durationB, 1, function()
					buffRemoval(item, client, charID, name)
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
		
		local healRate = item.hp/hpTime --health per second
		
		local tickRate = (1/healRate) --how many seconds between heals
		local ticks = math.Round(hpTime/tickRate) --how many times we heal

		timer.Create(id, tickRate, ticks, function()
			if (!IsValid(client) or !client:Alive()) then
				timer.Destroy(id)	
			end

			--local newHP = math.Clamp(client:Health() + (item.hp/hpTime), 0, client:GetMaxHealth())
			local newHP = math.Clamp(client:Health() + 1, 0, client:GetMaxHealth())

			client:SetHealth(newHP) -- actual health
			client:setHP(newHP) -- for combat system
		end)
	end
	
	--sp healing
	if(item.sp) then
		local id = "nutHealSP_"..FrameTime()
		local spTime = item.spTime or 1
		
		local healRate = item.sp/spTime --health per second
		
		local tickRate = (1/healRate) --how many seconds between heals
		local ticks = math.Round(spTime/tickRate) --how many times we heal

		timer.Create(id, tickRate, ticks, function()
			if (!IsValid(client) or !client:Alive()) then
				timer.Destroy(id)	
			end

			client:AddSanity(1) -- sanity
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
	
	if(item.buffRemove) then
		local buffs = client:getBuffs()
		for effect, power in pairs(item.buffRemove) do
			for k, v in pairs(buffs) do
				if(v.effect == effect) then
					client:removeBuff(v)
				end
			end
		end
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
	if(item.sound and item.sound != "") then
		client:EmitSound(item.sound, 75, item.soundPitch or 100)
	end
	
	--this is bad and should be redone properly.
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
		
		return true
		--return (!IsValid(item.entity)) --makes it so you cant eat on ground
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

		if(target:GetClass() == "prop_ragdoll") then
			target = target:getNetVar("player")
		end

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


ITEM.functions.CustomRes = {
	name = "Customize Resistances",
	tip = "Customize this item",
	icon = "icon16/wrench.png",
	onRun = function(item, data)
		nut.plugin.list["customization"]:startCustomR(item.player, item)
		
		return false
	end,
	onCanRun = function(item)
		local client = item.player
		return client:getChar():hasFlags("1")
	end
}


ITEM.functions.CustomAmp = {
	name = "Customize Amplifications",
	tip = "Customize this item",
	icon = "icon16/wrench.png",
	onRun = function(item, data)
		nut.plugin.list["customization"]:startCustomAmp(item.player, item)
		
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

--for people to name their crafted items
ITEM.functions.CustomName = {
	name = "Change Name",
	tip = "Customize this item",
	icon = "icon16/wrench.png",
	onRun = function(item)
		local client = item.player

		local customData = item:getData("custom", {})

		client:requestString("Change Name", "", function(text)
			customData.name = text or " "
			item:setData("custom", customData)
		end, customData.name)

		return false
	end,
	onCanRun = function(item)
		local creator = item:getData("creator")
	
		local client = item.player
		
		if(creator and client:getChar():getID() == creator) then
			return true
		else
			return false
		end
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
			local data = table.Copy(item.data)
			data.x = nil
			data.y = nil

			if(!inventory:add(item.uniqueID, 1, data)) then
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


ITEM.functions.Scrap = {
	tip = "Scrap this item",
	icon = "icon16/wrench.png",
	--sound = "npc/manhack/grind"..math.random(1,5)..".wav",
	onRun = function(item)
		local client = item.player
		local char = client:getChar()
		local inv = char:getInv()
		local position = client:getItemDropPos()
		local scrap
		local amt
		
		local roll = math.random(1,100)
		local chance = item.multiChance or 20
		local multi = 1
		
		if(TRAITS and client:hasTrait("scrapper")) then --trait increases chance of multi result
			chance = chance + 10
		end
		
		if(roll < chance) then
			multi = 2
		end

		for i = 1, multi do
			amt, scrap = table.Random(item.salvItem)
			
			local itemTable = nut.item.list[scrap]
			if(itemTable) then
				if(itemTable.maxstack) then
					timer.Simple(i/2, function()
						inv:addSmart(scrap, 1, position, {Amount = amt})
					end)
				else
					inv:addSmart(scrap, amt, position)
				end
			end
		end
		
		--Randomized sounds don't work up there so I had to do this.
		client:EmitSound("npc/manhack/grind"..math.random(1,5)..".wav", 70, math.random(85,105))
	end,
	onCanRun = function(item)
		if(!item.salvItem) then
			return false
		end
		local client = item.player
		return client:getChar():hasFlags("q") or client:getChar():getInv():getFirstItemOfType("kit_salvager")
	end
}

--for people to name their crafted items
ITEM.functions.CustomName = {
	name = "Change Name",
	tip = "Customize this item",
	icon = "icon16/wrench.png",
	onRun = function(item)
		local client = item.player

		local customData = item:getData("custom", {})

		client:requestString("Change Name", "", function(text)
			customData.name = text or " "
			item:setData("custom", customData)
		end, customData.name)

		return false
	end,
	onCanRun = function(item)
		local creator = item:getData("creator")
	
		local client = item.player
		
		if(creator and client:getChar():getID() == creator) then
			return true
		else
			return false
		end
	end
}

function ITEM:onEntityCreated(entity)
	local customData = self:getData("custom", {})

	local modelColor = customData.modelColor or self.modelColor
	if(modelColor) then
		entity:SetColor(modelColor)
	end

	local scale = customData.modelScale or self.modelScale
	scale = tonumber(scale)
	
	if(scale) then
		--clamp this so you cant just crash the server with it
		scale = math.Clamp(scale, 0.1, 10)
		
		entity:SetModelScale(scale)

		local physobj = entity:GetPhysicsObject()
		if (!IsValid(physobj)) then return false end

		--grabbed from a collision resizer tool
		local physmesh = physobj:GetMeshConvexes()
		if (!istable(physmesh)) or (#physmesh < 1) then return false end

		for convexkey, convex in pairs(physmesh) do
			for poskey, postab in pairs(convex) do
				convex[poskey] = postab.pos * scale
			end
		end

		local asleep = physobj:IsAsleep()

		entity:PhysicsInitMultiConvex(physmesh)
		
		if(!asleep) then
			entity:GetPhysicsObject():Wake()
		end
	end

	if(self.entMass) then
		local physObj = entity:GetPhysicsObject()
		if(IsValid(physObj)) then
			physObj:SetMass(self.entMass)
		end
	end
	
	if(self.physMat) then
		local property = {
			["GravityToggle"] = true, 
			["Material"] = self.physMat,
		}
		construct.SetPhysProp(nil, entity, 0, entity:GetPhysicsObject(), property)
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
		
		local sp = self:getData("sp", self.sp)
		if(sp) then
			desc = desc.. "\nSanity Restore: " ..sp
			
			if(self.spTime) then
				desc = desc.. " SP over " ..self.spTime.. " seconds."
			end
		end
		
		local mp = self:getData("mp", self.mp)
		if(mp) then
			desc = desc.. "\nMP Restore: " ..mp
			
			if(self.mpTime) then
				desc = desc.. " MP over " ..self.mpTime.. " seconds."
			end
		end
		
		local res = self:getData("res")
		local amp = self:getData("amp")
		local attrib = self:getData("attrib", self.attrib)
		local buffTbl = table.Copy(self:getData("buffTbl", self.buffTbl)) or {}
		
		--merges base/custom amp with crafted ones
		for k, v in pairs(amp or {}) do
			if(!buffTbl.amp) then buffTbl.amp = {} end
		
			buffTbl.amp[k] = (buffTbl.amp[k] or 0) + v
		end
		
		--merges base/custom res with crafted ones
		for k, v in pairs(res or {}) do
			if(!buffTbl.res) then buffTbl.res = {} end
		
			buffTbl.res[k] = (buffTbl.res[k] or 0) + v
		end
		
		--merges base/custom attributes with crafted ones
		for k, v in pairs(attrib or {}) do
			if(!buffTbl.attrib) then buffTbl.attrib = {} end
		
			buffTbl.attrib[k] = (buffTbl.attrib[k] or 0) + v
		end
		
		if(!table.IsEmpty(buffTbl)) then
			desc = desc.. "\n\n<color=50,200,50>Buffs</color>"
			
			local hpMax = buffTbl.hpMax
			if(hpMax) then
				desc = desc .. "\n Max Health: " ..hpMax
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
			
			local critC = buffTbl.critC
			if(critC) then
				desc = desc .. "\n Crit Chance: " ..critC.. "%"
			end
			
			local critF = buffTbl.critF
			if(critF) then
				desc = desc .. "\n Crit Fail: " ..critF.. "%"
			end
			
			local critM = buffTbl.critM
			if(critM) then
				desc = desc .. "\n Crit Mult: " ..critM.. "x"
			end
			
			if(buffTbl.attrib) then
				desc = desc .. "\n Attributes: "
			
				for buffAttrib, buffValue in pairs(buffTbl.attrib) do
					if(buffValue != 0) then
						desc = desc .. "\n   " ..((nut.attribs.list[buffAttrib] and nut.attribs.list[buffAttrib].name) or "Unknown Attribute").. ": " ..buffValue
					end
				end
				
				desc = desc .. "\n"
			end
			
			if(buffTbl.res) then
				desc = desc .. "\n Resistances: "
				
				for k, v in pairs(buffTbl.res) do
					desc = desc.. "\n   " ..k..": " ..v.. "%"
				end
				
				desc = desc .. "\n"
			end
			
			if(buffTbl.amp) then
				desc = desc .. "\n Amplifications: "
				
				for k, v in pairs(buffTbl.amp) do
					desc = desc.. "\n   " ..k..": " ..v.. "%"
				end
				
				desc = desc .. "\n"
			end
		end
	end
	
	-- Only show these things in the crafting menu
	if(CLIENT) then
		if(IsValid(nut.gui.craftingDynamic)) then
			desc = desc.. "\n\n<color=50,200,50>Ingredient Tags</color>"
			
			if(self.loot) then
				for tag, _ in pairs(self.loot) do
					desc = desc .. "\n ["..tag.. "]"
				end
			end
		else
			local craftTags = self:getData("craftTags")
			if(craftTags) then
				desc = desc.. "\n\n<color=50,200,50>Food Tags</color>\n"

				for tag, _ in pairs(craftTags) do
					desc = desc .. "["..tag.. "]"
				end
			end
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
		local quantity2 = tonumber(item:getData("quantity2", item.quantity2))
		if (quantity2) then
			draw.SimpleText(quantity2.. "/" ..item.quantity2, "DermaDefault", 6, h - 16, Color(50,200,50), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, color_black)
		end
		
		--[[
		local customData = item:getData("custom", {})
		local color = customData.color or item.color or nut.config.get("color", Color(0,0,0,255))
		
		surface.SetDrawColor(color)
		surface.DrawOutlinedRect(0, 0, w, h, 1)
		--]]
	end
end