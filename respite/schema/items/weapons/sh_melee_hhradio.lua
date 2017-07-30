ITEM.name = "Hand-held Radio"
ITEM.desc = "A busted hand-held radio. You can still hit things with it I guess."
ITEM.model = "models/props/cs_office/radio.mdl"
ITEM.class = "hl2_m_hhradio"
ITEM.uniqueID = "hl2_m_hhradio"
ITEM.weaponCategory = "melee"
ITEM.width = 2
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Melee"
ITEM.iconCam = {
	pos = Vector(-200, 0, 5),
	ang = Angle(0, -0, 0),
	fov = 6
}

ITEM.data = { scrapamount = 1 }
ITEM.salvItem = "j_scrap_elecs"

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