ITEM.name = "Monster Claw"
ITEM.desc = "A medium sized claw torn from some kind of monster."
ITEM.model = "models/gibs/antlion_gib_small_1.mdl"
ITEM.class = "hl2_m_monsterclaw"
ITEM.uniqueID = "j_monster_claw"
ITEM.weaponCategory = "melee"
ITEM.width = 1
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Melee"
ITEM.iconCam = {
	pos = Vector(0, 200, 1),
	ang = Angle(0, 270, 0),
	fov = 2
}

ITEM.data = { scrapamount = 1 }
ITEM.salvItem = "j_scrap_bone"

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



