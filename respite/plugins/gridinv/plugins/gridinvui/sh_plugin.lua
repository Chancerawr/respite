PLUGIN.name = "GridInv UI"
PLUGIN.author = "Cheesenut"
PLUGIN.desc = "Adds UI components for grid inventories."

local INVENTORY_TYPE_ID = "grid"

if (CLIENT) then
	function PLUGIN:CreateInventoryPanel(inventory, parent)
		if (inventory.typeID ~= INVENTORY_TYPE_ID) then
			return
		end

		local panel = vgui.Create("nutGridInventory", parent)
		panel:setInventory(inventory)
		panel:Center()
		
		return panel
	end

	function PLUGIN:getItemStackKey(item)
		local elements = {}
		for key, value in SortedPairs(item.data) do
			elements[#elements + 1] = key
			elements[#elements + 1] = value
		end
		return item.uniqueID..pon.encode(elements)
	end

	function PLUGIN:getItemStacks(inventory)
		local stacks = {}
		local stack, key
		for _, item in SortedPairs(inventory:getItems()) do
			key = self:getItemStackKey(item)
			stack = stacks[key] or {}
			stack[#stack + 1] = item
			stacks[key] = stack
		end
		return stacks
	end
end
