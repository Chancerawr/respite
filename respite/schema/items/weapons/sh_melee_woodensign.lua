ITEM.name = "Wooden sign"
ITEM.desc = "A wooden sign with 'BEWARE OF DOG' written in big red letters across it."
ITEM.model = "models/props_lab/bewaredog.mdl"
ITEM.class = "hl2_m_woodensign"
ITEM.uniqueID = "hl2_m_woodensign"
ITEM.weaponCategory = "melee"
ITEM.width = 1
ITEM.height = 2
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Melee"

ITEM.iconCam = {
	pos = Vector(200, 0, 22),
	ang = Angle(180, 0, 180),
	fov = 9,
}

ITEM.data = { scrapamount = 4 }
ITEM.salvItem = "j_scrap_wood"

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