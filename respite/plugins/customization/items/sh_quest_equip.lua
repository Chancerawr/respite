ITEM.name = "Quest Equipment"
ITEM.model = "models/props_junk/gnome.mdl"
ITEM.desc = "A customizable piece of equipment."
ITEM.uniqueID = "quest_equip"
ITEM.buffCategory = "Accessory"

-- Inventory drawing
if (CLIENT) then
	function ITEM:paintOver(item, w, h)
		if (item:getData("equip")) then
			surface.SetDrawColor(255, 110, 110, 100)
			surface.DrawRect(w - 14, h - 14, 8, 8)
		end
	end
end

ITEM.buffRefresh = function(item, player)
	local client = player
	if(item.player) then
		client = item.player
	end
	
	local char = client:getChar()

	local boosts = item:getData("attrib")
	--buffs the specified attributes.
	if (boosts) then
		for k, v in pairs(boosts) do
			char:addBoost(item.id, k, v)
		end
	end
end

-- On player eqipped the item, Gives a weapon to player and load the ammo data from the item.
ITEM.functions.Equip = {
	name = "Equip",
	tip = "equipTip",
	icon = "icon16/tick.png",
	sound = "items/ammo_pickup.wav",
	onRun = function(item)
		local client = item.player
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
		
		item:buffRefresh(item)
		
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
				char:removeBoost(item.id, k)
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

ITEM.functions.Inspect = {
	name = "Inspect",
	tip = "Inspect this item",
	icon = "icon16/picture.png",
	onClick = function(item)
		local customData = item:getData("custom", {})

		local frame = vgui.Create("DFrame")
		frame:SetSize(540, 680)
		frame:SetTitle(item.name)
		frame:MakePopup()
		frame:Center()

		frame.html = frame:Add("DHTML")
		frame.html:Dock(FILL)
		
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

ITEM.functions.CustomAtr = {
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
			local data = item.data
			data.x = nil
			data.y = nil
			data.equip = nil

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

-- On item is dropped, Remove a weapon from the player and keep the ammo in the item.
ITEM:hook("drop", function(item)
	if (item:getData("equip")) then
		item:setData("equip", nil)
		
		local boosts = item:getData("attrib")
		
		if (boosts) then
			for k, v in pairs(boosts) do
				item.player:getChar():removeBoost(item.id, k)
			end
		end
	end
end)

function ITEM:onCanBeTransfered(oldInventory, newInventory)
	if (newInventory and self:getData("equip")) then
		return false
	end
	
	local client = self.player
	if(client and IsValid(client.nutRagdoll)) then
		return false
	end

	return true
end

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
		if(self:getData("customSlot", self.buffCategory)) then
			local category = self:getData("customSlot", self.buffCategory)
			category = string.upper(string.sub(category, 0, 1))..string.sub(category, 2)
		
			desc = desc .. "\nSlot: " ..category.. "."
		end
		
		if(customData.quality) then
			desc = desc .. "\nQuality: " ..customData.quality
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
	
	local customData = self:getData("custom", {})
	if(customData.model) then
		model = customData.model
	end
	
	return Format(model)
end