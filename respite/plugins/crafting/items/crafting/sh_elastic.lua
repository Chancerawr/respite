ITEM.name = "Elastic"
ITEM.uniqueID = "j_scrap_elastic"
ITEM.model = "models/gibs/manhack_gib05.mdl"
ITEM.material = "phoenix_storms/officewindow_1-1"
ITEM.desc = "Some elastic."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1
ITEM.data = {
	Amount = 1
}

ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 90),
	fov = 4.5,
}

ITEM.functions.Scrap = {
  tip = "Scrap this item",
  icon = "icon16/cross.png",
  onRun = function(item)
    if (item.player:getChar():getInv():findEmptySlot(1, 1) != nil) then
		item.player:getChar():getInv():add("j_scrap_plastics", 1, { Amount = item:getData("Amount")*2 })
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
