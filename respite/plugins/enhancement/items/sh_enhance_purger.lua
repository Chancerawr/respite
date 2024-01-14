ITEM.name = "Equipment Awakener"
ITEM.desc = "Can be used on an equipment to 'dream' upgrades attached to it."
ITEM.uniqueID = "enhance_purger"
ITEM.model = "models/warz/melee/hammer.mdl"
ITEM.material = "models/props_lab/security_screens"
ITEM.flag = "V"
ITEM.width = 1
ITEM.height = 1
ITEM.maxstack = 1
ITEM.combiner = true

ITEM.onCombineTo = function(itemSelf, itemTarget)
	if(!itemSelf.combiner) then return true end
	
	local client = itemSelf.player
	local char = client:getChar()
	local inventory = char:getInv()
	local position = client:getItemDropPos()
	
	local upgradeSlots = itemTarget:getData("upgradeSlots", {})
	
	for slotName, slotData in pairs(upgradeSlots) do
		for itemID, slotWeight in pairs(slotData) do
			--item that's in the slot
			local itemU = nut.item.instances[itemID]

			if(itemU) then
				x, y = inventory:findFreePosition(itemU)
				if(x and y) then
					itemU:setData("x", x)
					itemU:setData("y", y)
				
					inventory:addItem(itemU)
				else
					itemU:spawn(position)
				end
				
				itemU:upgrade(itemU, itemTarget, true)
			end
		end
	end
	
	itemTarget:setData("upgradeSlots", {})
end