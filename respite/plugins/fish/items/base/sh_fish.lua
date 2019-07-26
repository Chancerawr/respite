ITEM.name = "Fish Base"
ITEM.model = "models/props_junk/garbage_takeoutcarton001a.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.isFood = true
ITEM.cookable = true
ITEM.foodDesc = "This is a base fish."
ITEM.category = "Consumable"
ITEM.mustCooked = false
ITEM.quantity2 = 2
ITEM.container = ""
ITEM.flag = "v"
ITEM.sound = "npc/barnacle/barnacle_crunch2.wav"
ITEM.duration = 7200
ITEM.color = Color(50, 50, 255)

ITEM.functions.use = {
	name = "Consume",
	tip = "useTip",
	icon = "icon16/cup.png",
	onRun = function(item)
		local client = item.player
		local char = client:getChar()
		--stomach checker
		if(char:getData("stomach", 0) < 4) then
			char:setData("stomach", char:getData("stomach", 0) + 1)
			timer.Simple(item.duration, function() --needs to be independent of attribute since those don't stack for the same item.
				char:setData("stomach", char:getData("stomach", 0) - 1)
			end)
		else
			client:notify("You are too full!")
			return false
		end	
	
		local cooked = item:getData("cooked", 1)
		local quantity2 = item:getData("quantity", item.quantity2)
		local mul = COOKLEVEL[cooked][2]
		local position = item.player:getItemDropPos()
		
		quantity2 = quantity2 - 1
		
		local buffAmt --amount of stats the thing gives you
		local dur --duration of effect
		
		if (char and client:Alive()) then
			if (item.attribBoosts) then
				for k, v in pairs(item.attribBoosts) do
					buffAmt = v
					if(hasTrait(client, "glutton")) then
						buffAmt = buffAmt * 1.2
					end
					char:addBoost(item.uniqueID, k, buffAmt)
				end
			end
			
			local charID = char:getID()
			local name = item.name
			
			--if we already have a thing for that buff, refresh it.
			if(timer.Exists("DrugEffect_" .. item.uniqueID .. "_" .. client:EntIndex())) then 
				dur = item.duration
				if(TRAITS and hasTrait(client, "survival")) then
					dur = dur * 1.2
				end
			
				timer.Adjust("DrugEffect_" .. item.uniqueID .. "_" .. client:EntIndex(), dur, 1, function()

					if (client and IsValid(client)) then
						local curChar = client:getChar()
						if (curChar and curChar:getID() == charID) then
							client:notify(Format("%s has worn off.", name))

							if (item.attribBoosts) then
								for k, v in pairs(item.attribBoosts) do
									char:removeBoost(item.uniqueID, k)
								end
							end
						end
					end
				end)
			else
			
				dur = item.duration
				if(TRAITS and hasTrait(client, "survival")) then
					dur = dur * 1.2
				end
				
				timer.Create("DrugEffect_" .. item.uniqueID .. "_" .. client:EntIndex(), dur, 1, function()
					if (client and IsValid(client)) then
						local curChar = client:getChar()
						if (curChar and curChar:getID() == charID) then
							client:notify(Format("%s has worn off.", name))

							if (item.attribBoosts) then
								for k, v in pairs(item.attribBoosts) do
									char:removeBoost(item.uniqueID, k)
								end
							end
						end
					end
				end)
			end
		end
		
		item.player:EmitSound(item.sound)
		
		if (quantity2 >= 1) then
			item:setData("quantity", quantity2)
			return false
		else
			if(item.container != "") then
				nut.item.spawn(item.container, position)
			end
		end
		
		return true
	end,
	onCanRun = function(item)
		if (item.mustCooked and item:getData("cooked", 1) == 1) then
			return false
		end
		
		return (!IsValid(item.entity))
	end
}

ITEM.functions.Name = {
	tip = "Name this item",
	icon = "icon16/add.png",
	onRun = function(item)
		local client = item.player
		
		local customData = item:getData("custom", {})
		
		client:requestString("Change Name", "What do you want to name your sentry? (This is final)", function(text)
			customData.name = text
			item:setData("custom", customData)
			nut.log.addRaw(client:Name().. " has set name of " ..item.name.. " to " ..text.. ".")
		end, customData.name or item.name)
		
		return false
	end,
	onCanRun = function(item)
		local customData = item:getData("custom", {})
		
		if (customData.name) then
			return false
		else
			return true
		end
		
		return true
	end
}

ITEM.functions.Convert = {
	tip = "Convert this item",
	icon = "icon16/cross.png",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()	
	
		inventory:addSmart("j_scrap_organic", 1, position, {Amount = 8})
		
		client:EmitSound("physics/flesh/flesh_squishy_impact_hard" ..math.random(1,4).. ".wav", 65, math.random(80,110))
	end,
	onCanRun = function(item)
		local client = item.player
		
		if(item.plastic) then
			return false
		end
	
		return client:getChar():hasFlags("q") or client:getChar():getInv():getFirstItemOfType("converter_meat")
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

ITEM.functions.CustomQuan = {
	name = "Customize Quantity",
	tip = "Customize this item",
	icon = "icon16/wrench.png",
	onRun = function(item)
		local client = item.player

		client:requestString("Change Quantity", "", function(text)	
			local amount = tonumber(text)
			if(amount) then
				item:setData("quantity2", text)
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

function ITEM:getName()
	local name = self.name
	
	local customData = self:getData("custom", {})
	if(customData.name) then
		name = customData.name
	end
	
	return Format(name)
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

		if (self.cookable != false) then
			desc = desc .. "\nFood Status: %s."
		end
		
		if(customData.quality) then
			desc = desc .. "\nQuality: " ..customData.quality
		end		

		if(self.quantity2) then
			desc = desc .. "\nPortions remaining: " .. self:getData("quantity2", self.quantity2)
		end
		
		if(self.attribBoosts) then
			desc = desc .. "\n\n<color=50,200,50>Bonuses</color>"
			
			for k, v in pairs(self.attribBoosts) do
				if(v != 0 and nut.attribs.list[k]) then
					desc = desc .. "\n " .. nut.attribs.list[k].name .. ": " .. v
				end
			end
		end	
	end
		
	return Format(desc, COOKLEVEL[(self:getData("cooked") or 1)][1])
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
		local quantity2 = item:getData("quantity", item.quantity2)

		if (quantity2 > 1) then
			draw.SimpleText(quantity2, "DermaDefault", 6, h - 16, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, color_black)
		end

		if (cooked > 1) then
			local col = COOKLEVEL[cooked][3]

			surface.SetDrawColor(col.r, col.g, col.b, 100)
			surface.DrawRect(w - 14, h - 14, 8, 8)
		end
	end
end


