ITEM.name = "Wooden Pole"
ITEM.desc = "A long beefy wooden pole. Great for cracking people over the head."
ITEM.model = "models/props_c17/signpole001.mdl"
ITEM.material = "models/props/cs_militia/roofbeams01"
ITEM.class = "hl2_m_woodenpole"
ITEM.uniqueID = "hl2_m_woodenpole"
ITEM.weaponCategory = "melee"
ITEM.width = 1
ITEM.height = 4
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Melee"
ITEM.iconCam = {
	pos = Vector(1007.7691650391, 845.61218261719, 668.30572509766),
	ang = Angle(25, 220, 0),
	fov = 1.2
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