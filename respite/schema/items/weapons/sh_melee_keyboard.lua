ITEM.name = "Keyboard"
ITEM.desc = "A typewriter-style device which uses an arrangement of buttons or keys to act as a mechanical lever or electronic switch."
ITEM.model = "models/props/cs_office/computer_keyboard.mdl"
ITEM.class = "hl2_m_keyboard"
ITEM.uniqueID = "hl2_m_keyboard"
ITEM.weaponCategory = "melee"
ITEM.width = 3
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Melee"

ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 180),
	fov = 11,
}

ITEM.data = { scrapamount = 2 }
ITEM.salvItem = "j_scrap_plastics"

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