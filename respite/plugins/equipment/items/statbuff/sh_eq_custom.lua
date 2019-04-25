ITEM.name = "Quest Equipment"
ITEM.model = "models/props_junk/gnome.mdl"
ITEM.desc = "A customizable piece of equipment."
ITEM.uniqueID = "quest_equip"
ITEM.buffCategory = "accessory"

ITEM.data = {
	--[[
	attrib = { --these are just there for reference
		["str"] = 0,
		["stm"] = 0,
		["end"] = 0,
		["accuracy"] = 0,
		["luck"] = 0,
		["perception"] = 0,
		["fortitude"] = 0,
		["medical"] = 0,
	}
	--]]
}

-- On player eqipped the item, Gives a weapon to player and load the ammo data from the item.
ITEM.functions.Equip = {
	name = "Equip",
	tip = "equipTip",
	icon = "icon16/tick.png",
	sound = "items/ammo_pickup.wav",
	onRun = function(item)
		local client = item.player
		local char = client:getChar()
		
		local items = client:getChar():getInv():getItems()
		
		for k, v in pairs(items) do --checks if they have that slot filled already
			if (v.id != item.id) then
				local itemTable = nut.item.instances[v.id]
				
				if (!itemTable) then
					--client:notifyLocalized("tellAdmin", "wid!xt")

					return false
				else
					if ((itemTable:getData("equip") and itemTable.buffCategory) and (string.lower(itemTable:getData("customSlot", itemTable.buffCategory)) == string.lower(item:getData("customSlot", item.buffCategory)))) then
						client:notify("Your " ..item:getData("customSlot", item.buffCategory).. " slot is already filled.")

						return false
					end
				end
			end
		end
		
		item:setData("equip", true)
		
		local boosts = item:getData("attrib")
		--buffs the specified attributes.
		if (boosts) then
			for k, v in pairs(boosts) do
				char:addBoost(item.uniqueID, k, v)
			end
		end
		
		return false
	end,
	onCanRun = function(item)
		return (!IsValid(item.entity) and item:getData("equip") != true)
	end
}

ITEM.functions.EquipUn = { -- sorry, for name order.
	name = "Unequip",
	tip = "equipTip",
	icon = "icon16/cross.png",
	sound = "items/ammo_pickup.wav",
	onRun = function(item)
		local client = item.player
		local char = client:getChar()
	
		local boosts = item:getData("attrib")
	
		item:setData("equip", false)
		--buffs the specified attributes.
		if (boosts) then
			for k, v in pairs(boosts) do
				char:removeBoost(item.uniqueID, k)
			end
		end

		return false
	end,
	onCanRun = function(item)
		return (!IsValid(item.entity) and item:getData("equip") == true)
	end
}

local function recLoop(client, attribs, cur, key, item)
	if(cur > 0) then
		client:requestString("Input Attribute", nut.attribs.list[key[cur]].name, function(text)
			attribs[key[cur]] = tonumber(text)
			item:setData("attrib", attribs)
			recLoop(client, attribs, cur - 1, key, item)
		end, attribs[key[cur]])
	end
end

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
		end, color.r .. ", " .. color.g .. ", " .. color.b)
		
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

ITEM.functions.CustomSlot = {
	name = "Customize Slot",
	tip = "Customize this item",
	icon = "icon16/wrench.png",
	onRun = function(item)
		local client = item.player

		local slot = item:getData("customSlot", "accessory")
		client:requestString("Change Slot", "Input the slot name, two items of the same slot cannot be equipped at once.", function(text) --start of model
			local newSlot = text
		
			item:setData("customSlot", newSlot)
		end, slot)
		
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

-- On item is dropped, Remove a weapon from the player and keep the ammo in the item.
ITEM:hook("drop", function(item)
	if (item:getData("equip")) then
		item:setData("equip", nil)
		
		local boosts = item:getData("attrib")
		
		if (boosts) then
			for k, v in pairs(boosts) do
				item.player:getChar():removeBoost(item.uniqueID, k)
			end
		end
	end
end)

function ITEM:getName()
	local name = self.name
	
	if(self:getData("customName") != nil) then
		name = self:getData("customName")
	end
	
	return Format(name)
end

function ITEM:getDesc(partial)
	local desc = self.desc
	
	if(self:getData("customDesc") != nil) then
		desc = self:getData("customDesc")
	end	
	
	if(!partial) then
		if(self:getData("customSlot", self.buffCategory)) then
			desc = desc .. "\nSlot: " .. self:getData("customSlot", self.buffCategory) .. "."
		end
		
		local boosts = self:getData("attrib")
		if(boosts and boosts != {}) then --no bonuses means no need for bonuses in the desc
			desc = desc .. "\n\n<color=50,200,50>Bonuses</color>"
			for k, v in pairs(boosts) do
				if(v != 0) then --dont want to display 0 values.
					desc = desc .. "\n " .. nut.attribs.list[k].name .. ": " .. v
				end
			end
		end
	end
	
	return Format(desc)
end


function ITEM:onGetDropModel()
	local model = self.model
	
	if(self:getData("customMdl") != nil) then
		model = self:getData("customMdl")
	end
	
	return Format(model)
end