ITEM.name = "Quest Consumable"
ITEM.desc = "Quest consumable."
ITEM.model = "models/props_junk/garbage_takeoutcarton001a.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.isFood = true
ITEM.cookable = true
ITEM.category = "Consumable"
ITEM.mustCooked = false
ITEM.quantity2 = 3
ITEM.container = ""
ITEM.flag = "v"
ITEM.duration = 7200
ITEM.color = Color(50, 150, 50)

ITEM.functions.use = {
	name = "Consume",
	tip = "useTip",
	icon = "icon16/cup.png",
	onRun = function(item)
		local client = item.player
		local char = client:getChar()
		--stomach checker
		--stomach unnecessary for custom
		--[[
		if(char:getData("stomach", 0) < 4) then
			char:setData("stomach", char:getData("stomach", 0) + 1)
			timer.Simple(item.duration, function() --needs to be independent of attribute since those don't stack for the same item.
				char:setData("stomach", char:getData("stomach", 0) - 1)
			end)
		else
			client:notify("You are too full!")
			return false
		end	
		--]]
	
		local cooked = item:getData("cooked", 1)
		local quantity2 = item:getData("quantity2", item.quantity2)
		local mul = COOKLEVEL[cooked][2]
		local position = item.player:getItemDropPos()
		
		quantity2 = quantity2 - 1
		
		local buffAmt --amount of stats the thing gives you
		local dur --duration of effect
		
		if (char and client:Alive()) then
			if (item:getData("attrib")) then
				for k, v in pairs(item:getData("attrib", {})) do
					buffAmt = v
					if(hasTrait(client, "glutton")) then
						buffAmt = buffAmt * 1.2
					end
					char:addBoost(item.id, k, buffAmt)
				end
			end
			
			local charID = char:getID()
			local name = item.name
			
			dur = item.duration
			local cookBonus = COOKLEVEL[cooked][2]
			
			if(cooked > 1) then
				dur = dur * (cookBonus * 0.6)
			end
			
			if(TRAITS and hasTrait(client, "survival")) then
				dur = dur * 1.2
			end

			--if we already have a thing for that buff, refresh it.
			if(timer.Exists("DrugEffect_" .. item.id .. "_" .. client:EntIndex())) then 
				timer.Adjust("DrugEffect_" .. item.id .. "_" .. client:EntIndex(), dur, 1, function()

					if (client and IsValid(client)) then
						local curChar = client:getChar()
						if (curChar and curChar:getID() == charID) then
							client:notify(Format("%s has worn off.", name))

							if (item:getData("attrib")) then
								for k, v in pairs(item:getData("attrib", {})) do
									char:removeBoost(item.id, k)
								end
							end
						end
					end
				end)
			else				
				timer.Create("DrugEffect_" .. item.id .. "_" .. client:EntIndex(), dur, 1, function()
					if (client and IsValid(client)) then
						local curChar = client:getChar()
						if (curChar and curChar:getID() == charID) then
							client:notify(Format("%s has worn off.", name))

							if (item:getData("attrib")) then
								for k, v in pairs(item:getData("attrib", {})) do
									char:removeBoost(item.id, k)
								end
							end
						end
					end
				end)
			end
		end
		
		--item.player:EmitSound(item.sound)
		
		if (quantity2 >= 1) then
			item:setData("quantity2", quantity2)
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

ITEM.functions.Custom = {
	name = "Customize",
	tip = "Customize this item",
	icon = "icon16/wrench.png",
	onRun = function(item)
		local client = item.player
		client:requestString("Change Name", "What name do you want this item to have?", function(text)
			item:setData("customName", text)
			client:requestString("Change Description", "What Description do you want this item to have?", function(text)
				item:setData("customDesc", text)
				client:requestString("Change Model", "What Model do you want this item to have?\nBe sure it is a valid model.", function(text) --start of model
					item:setData("customMdl", text)
				end, item:getData("customMdl", item.model)) --end of model
			end, item:getDesc(true)) --end of desc
		end, item:getName()) --end of name
		
		--hopefully resets the player's icons
		client:ConCommand("nut_flushicon")
		
		return false
	end,
	onCanRun = function(item)
		local client = item.player or item:getOwner()
		return client:getChar():hasFlags("1")
	end
}

ITEM.functions.CustomCol = {
	name = "Customize Color",
	tip = "Customize this item",
	icon = "icon16/wrench.png",
	onRun = function(item)
		local client = item.player

		local color = item:getData("customCol", Color(255,255,255))
		client:requestString("Change Color", "Enter ', ' separated RGB values.", function(text) --start of model
			local colorTbl = string.Split(text, ", ")
			if(table.Count(colorTbl) == 3) then
				red = tonumber(colorTbl[1])
				green = tonumber(colorTbl[2])
				blue = tonumber(colorTbl[3])
				if(red and green and blue) then --i put in a lot of extra shit here to idiot proof it.
					color.r = red
					color.g = green
					color.b = blue
				end
			end
		
			item:setData("customCol", color)
		end, color.r .. ", " .. color.b .. ", " .. color.g) --end of color
		
		--hopefully resets the player's icons
		client:ConCommand("nut_flushicon")
		
		return false
	end,
	onCanRun = function(item)
		local client = item.player or item:getOwner()
		return client:getChar():hasFlags("1")
	end
}

ITEM.functions.CustomMat = {
	name = "Customize Material",
	tip = "Customize this item",
	icon = "icon16/wrench.png",
	onRun = function(item)
		local client = item.player

		local material = item:getData("mat") or item.material or ""
		client:requestString("Change Material", "Enter material path.", function(text) --start of model
			item:setData("mat", text)
		end, material)
	
		--hopefully resets the player's icons
		client:ConCommand("nut_flushicon")
	
		return false
	end,
	onCanRun = function(item)
		local client = item.player or item:getOwner()
		return client:getChar():hasFlags("1")
	end
}

ITEM.functions.CustomQuan = {
	name = "Customize Quantity",
	tip = "Customize this item",
	icon = "icon16/wrench.png",
	onRun = function(item)
		local client = item.player

		client:requestString("Change Quantity", "Enter ', ' separated RGB values.", function(text) --start of model		
			local amount = tonumber(text)
			if(amount) then
				item:setData("quantity2", text)
			end
		end, item:getData("quantity2", 1))
		
		--hopefully resets the player's icons
		client:ConCommand("nut_flushicon")
		
		return false
	end,
	onCanRun = function(item)
		local client = item.player or item:getOwner()
		return client:getChar():hasFlags("1")
	end
}

ITEM.functions.CustomAtr = {
	name = "Customize Attributes",
	tip = "Customize this item",
	icon = "icon16/wrench.png",
	isMulti = true,
	multiOptions = function(item, client)
        local targets = {
            {name = "accuracy", data = "accuracy"},
            {name = "agility", data = "stm"},
            {name = "craftiness", data = "medical"},
            {name = "endurance", data = "end"},
            {name = "fortitude", data = "fortitude"},
            {name = "luck", data = "luck"},
            {name = "perception", data = "perception"},
            {name = "strength", data = "str"},
        }
       
        return targets
    end,
	onRun = function(item, data)
		local client = item.player
		local attribs = item:getData("attrib", {})
		
		client:requestString("Input Attribute", nut.attribs.list[data].name, function(text)
			attribs[data] = tonumber(text)
			item:setData("attrib", attribs)
		end, attribs[data] or 0)
	
		return false
	end,
	onCanRun = function(item)
		local client = item.player or item:getOwner()
		if(!IsValid(item.entity) and client:getChar():hasFlags("1")) then
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
			
			if(!inventory:add(item.uniqueID, 1, item.data)) then
				client:notify("Inventory is full")
			end
		end)
		return false
	end,
	onCanRun = function(item)
		local client = item.player or item:getOwner()
		return client:getChar():hasFlags("1")
	end
}

function ITEM:getDesc()
	local desc = self.desc

	if(self:getData("customDesc") != nil) then
		desc = self:getData("customDesc")
	end
	
	if(!partial) then
		if (self.mustCooked != false) then
			desc = desc .. "\nThis food must be cooked."
		end

		if (self.cookable != false) then
			desc = desc .. "\nFood Status: %s."
		end

		if(self.quantity2) then
			desc = desc .. "\nPortions remaining: " .. self:getData("quantity2", self.quantity2)
		end
		
		if(self:getData("attrib")) then
			desc = desc .. "\n\n<color=50,200,50>Bonuses</color>"
			
			for k, v in pairs(self:getData("attrib", {})) do
				if(v != 0) then
					desc = desc .. "\n " .. nut.attribs.list[k].name .. ": " .. v
				end
			end
		end	
	end
		
	return Format(desc, COOKLEVEL[(self:getData("cooked") or 1)][1])
end

function ITEM:getName()
	local name = self.name
	
	if(self:getData("customName") != nil) then
		name = self:getData("customName")
	end
	
	return Format(name)
end

if (CLIENT) then --draws a square on the food item for how well cooked it is.
	function ITEM:paintOver(item, w, h)
		local cooked = item:getData("cooked", 1)
		local quantity2 = item:getData("quantity2", item.quantity2)

		if (tonumber(quantity2) > 1) then
			draw.SimpleText(quantity2, "DermaDefault", 6, h - 16, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, color_black)
		end

		if (cooked > 1) then
			local col = COOKLEVEL[cooked][3]

			surface.SetDrawColor(col.r, col.g, col.b, 100)
			surface.DrawRect(w - 14, h - 14, 8, 8)
		end
	end
end

function ITEM:onGetDropModel()
	local model = self.model
	
	if(self:getData("customMdl") != nil) then
		model = self:getData("customMdl")
	end
	
	return Format(model)
end