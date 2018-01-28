ITEM.name = "Human Leg"
ITEM.uniqueID = "food_human_legs"
ITEM.model = "models/dismemberment/gibs/legs.mdl"
ITEM.hungerAmount = 35
ITEM.foodDesc = "A leg that was once connected to a human being."
ITEM.quantity = 4
ITEM.price = 100
ITEM.width = 4
ITEM.height = 1
ITEM.color = Color(150,50,50)

ITEM.attribBoosts = { ["fortitude"] = 10 }

ITEM.iconCam = {
	pos = Vector(-15, 200, 2.5),
	ang = Angle(0, 270, 0),
	fov = 14.5,
}

ITEM.functions.Convert = {
  tip = "Convert this item",
  icon = "icon16/cross.png",
  onRun = function(item)
    if (item.player:getChar():getInv():findEmptySlot(1, 1) != nil) then
		item.player:getChar():getInv():add("j_scrap_organic", 1, { Amount = 12 })
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