ITEM.name = "Broken Bottle"
ITEM.desc = "A glass bottle that has been smashed open."
ITEM.model = "models/props_junk/glassbottle01a_chunk01a.mdl"
ITEM.class = "hl2_m_brokenbottle"
ITEM.uniqueID = "hl2_m_brokenbottle"
ITEM.weaponCategory = "melee"
ITEM.width = 1
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Melee"
ITEM.iconCam = {
	pos = Vector(80.707870483398, 67.755783081055, 49.285007476807),
	ang = Angle(25, 220, 0),
	fov = 4.3100946982013
}

ITEM.data = { scrapamount = 2 }
ITEM.salvItem = "j_scrap_glass"

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