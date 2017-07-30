ITEM.name = "Suitcase"
ITEM.desc = "A robust worn black suitcase."
ITEM.model = "models/weapons/w_suitcase_passenger.mdl"
ITEM.class = "hl2_m_suitcase"
ITEM.uniqueID = "hl2_m_suitcase"
ITEM.weaponCategory = "melee"
ITEM.width = 2
ITEM.height = 2
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Melee"
ITEM.iconCam = {
	pos = Vector(254.86956787109, 213.86093139648, 148.7124786377),
	ang = Angle(25, 220, 0),
	fov = 4.9789421784023
}

ITEM.data = { scrapamount = 8 }
ITEM.salvItem = "j_scrap_cloth"

ITEM.functions.Scrap = {
  tip = "Scrap this item",
  icon = "icon16/cross.png",
  onRun = function(item)
    if (item.player:getChar():getInv():findEmptySlot(1, 1) != nil) then
		item.player:getChar():getInv():add(item.salvItem, 1, { Amount = item:getData("scrapamount") })
		item:remove()
		return false 
    else
		item.player:notify("You don't have any room in your inventory!")
		return false 
    end
  end,
  onCanRun = function(item)
	if (item:getOwner() == nil) then
		return item.player:getChar():hasFlags("q") or item.player:getChar():getInv():hasItem("kit_salvager")
	else
		return item:getOwner():getChar():hasFlags("q") or item:getOwner():getChar():getInv():hasItem("kit_salvager")
	end
  end
}

ITEM.functions.Storage = {
  tip = "Use this item for storage",
  icon = "icon16/box.png",
  onRun = function(item)
  	local position = item.player:getItemDropPos()
		
	nut.item.spawn("stor_suitcase", position)
	item:remove()
  end
}