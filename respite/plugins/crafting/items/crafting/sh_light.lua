ITEM.name = "Light Bulbs"
ITEM.uniqueID = "j_scrap_light"
ITEM.model = "models/props_lab/box01a.mdl"
ITEM.desc = "A box of lightbulbs."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1
ITEM.maxstack = 10

ITEM.data = {
	Amount = 1
}

ITEM.iconCam = {
	pos = Vector(89.432174682617, 74.904991149902, 54.501823425293),
	ang = Angle(25, 220, 0),
	fov = 5,
}

ITEM.functions.Scrap = {
  tip = "Scrap this item",
  icon = "icon16/cross.png",
  onRun = function(item)
    if (item.player:getChar():getInv():findEmptySlot(1, 1) != nil) then
		if(math.random(0,1) == 1) then
			item.player:getChar():getInv():add("j_scrap_elecs", 1, { Amount = item:getData("Amount") })
		else
			item.player:getChar():getInv():add("j_scrap_glass", 1, { Amount = item:getData("Amount") })
		end
		item:remove()
		return false 
    else
		item.player:notify("You don't have any room in your inventory!")
		return false 
    end
  end,
  onCanRun = function(item)
	local client = item:getOwner() or item.player
	return client:getChar():hasFlags("q") or client:getChar():getInv():hasItem("kit_salvager")
  end
}
