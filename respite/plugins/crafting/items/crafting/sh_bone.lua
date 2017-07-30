ITEM.name = "Bones"
ITEM.uniqueID = "j_scrap_bone"
ITEM.model = "models/props_lab/jar01a.mdl"
ITEM.material = "models/props_c17/furnituremetal001a"
ITEM.desc = "Some collected bones."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1
ITEM.maxstack = 30

ITEM.data = {
	Amount = 1
}

ITEM.functions.Scrap = {
  tip = "Scrap this item",
  icon = "icon16/cross.png",
  onRun = function(item)
    if (item.player:getChar():getInv():findEmptySlot(1, 1) != nil) then
		item.player:getChar():getInv():add("j_scrap_organic", 1, { Amount = item:getData("Amount")*2 })
		item:remove()
		return false 
    else
		item.player:notify("You don't have any room in your inventory!")
		return false 
    end
  end,
  onCanRun = function(item)
	local client = item:getOwner() or item.player
	return client:getChar():hasFlags("q") or client:getChar():getInv():hasItem("converter_meat")
  end
}
