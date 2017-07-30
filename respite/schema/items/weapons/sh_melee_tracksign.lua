ITEM.name = "Track Sign"
ITEM.desc = "A sign commonly seen along race tracks that warn drivers to slowdown. Or something."
ITEM.model = "models/props_trainstation/TrackSign03.mdl"
ITEM.class = "hl2_m_tracksign"
ITEM.uniqueID = "hl2_m_tracksign"
ITEM.weaponCategory = "melee"
ITEM.width = 1
ITEM.height = 4
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Melee"
ITEM.iconCam = {
	pos = Vector(975.63311767578, 818.740234375, 594.00048828125),
	ang = Angle(25, 220, 0),
	fov = 1
}

ITEM.data = { scrapamount = 8 }
ITEM.salvItem = "j_scrap_metals"

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