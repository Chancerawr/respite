ITEM.name = "Darkened Wood"
ITEM.uniqueID = "j_dark_wood"
ITEM.model = "models/gibs/wood_gib01a.mdl"
ITEM.material = "models/effects/portalrift_sheet"
ITEM.desc = "A strange black wood, it gives off an eerie feeling."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1
ITEM.maxstack = 20
ITEM.color = Color(0, 0, 0)

ITEM.data = {
	Amount = 1
}

ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 0),
	fov = 18,
}

ITEM.functions.Scrap = {
  tip = "Scrap this item",
  icon = "icon16/cross.png",
  onRun = function(item)
    if (item.player:getChar():getInv():findEmptySlot(1, 1) != nil) then
		if(math.random(0,1) == 1) then
			item.player:getChar():getInv():add("blight")
		else
			item.player:getChar():getInv():add("j_scrap_wood", 1, { Amount = item:getData("Amount") })
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