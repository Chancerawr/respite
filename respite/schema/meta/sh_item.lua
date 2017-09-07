local ITEM = nut.meta.item or {}
ITEM.__index = ITEM
ITEM.name = "Undefined"
ITEM.desc = ITEM.desc or "An item that is undefined."
ITEM.id = ITEM.id or 0
ITEM.uniqueID = "undefined"

function ITEM:getData(key, default)
	self.data = self.data or {}

	if (self.data) then
		if (key == true) then
			return self.data
		end

		local value = self.data[key]

		if (value != nil) then
			return value
		elseif (IsValid(self.entity)) then
			local data = self.entity:getNetVar("data", {})
			local value = data[key]

			if (value != nil) then
				return value
			end
		end
	else
		self.data = {}
	end

	if (default != nil) then
		return default
	end
	
	local itemTable = nut.item.list[self.uniqueID]

	if (itemTable and itemTable.data) then
		return itemTable.data[key]
	end
	
end

function ITEM:getOwner()
	local inventory = nut.item.inventories[self.invID]

	if (inventory) then
		return (inventory.getReceiver and inventory:getReceiver())
	end

	local id = self:getID()

	for k, v in ipairs(player.GetAll()) do
		local character = v:getChar()

		if (character and character:getInv() and character:getInv():getItemByID(id)) then
			return v
		end
	end
end

nut.meta.item = ITEM
