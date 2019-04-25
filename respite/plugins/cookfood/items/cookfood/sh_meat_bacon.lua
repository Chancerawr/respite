ITEM.name = "Bacon"
ITEM.model = "models/gibs/wood_gib01e.mdl"
ITEM.material = "models/flesh"
ITEM.desc = "Some sort of bacon, it looks pretty tasty."
ITEM.uniqueID = "food_bacon"
ITEM.hungerAmount = 15
ITEM.quantity2 = 2
ITEM.price = 10
ITEM.width = 1
ITEM.height = 1
ITEM.mustCooked = true

ITEM.attribBoosts = { 
	["fortitude"] = 6, 
	["str"] = 6
}

ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 90),
	fov = 4.5,
}

ITEM.functions.Convert = {
  tip = "Convert this item",
  icon = "icon16/cross.png",
  onRun = function(item)
    if (item.player:getChar():getInv():findEmptySlot(1, 1) != nil) then
		item.player:getChar():getInv():add("j_scrap_organic", 1, { Amount = 5 })
		item:remove()
		return false 
    else
		item.player:notify("You don't have any room in your inventory!")
		return false 
    end
  end,
  onCanRun = function(item)
	if (item:getOwner() == nil) then
		return item.player:getChar():hasFlags("q") or item.player:getChar():getInv():hasItem("converter_meat")
	else
		return item:getOwner():getChar():hasFlags("q") or item:getOwner():getChar():getInv():hasItem("converter_meat")
	end
  end
}