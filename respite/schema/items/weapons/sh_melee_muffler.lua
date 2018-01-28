ITEM.name = "Car Muffler"
ITEM.desc = "A metal muffler that was once attached to a car."
ITEM.model = "models/props_vehicles/carparts_muffler01a.mdl"
ITEM.class = "hl2_m_muffler"
ITEM.uniqueID = "j_car_muffler"
ITEM.weaponCategory = "melee"
ITEM.width = 6
ITEM.height = 2
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Melee"

ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 90),
	fov = 21,
}

ITEM.data = { scrapamount = 6 }
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



