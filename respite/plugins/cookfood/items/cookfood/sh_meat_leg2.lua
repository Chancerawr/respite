ITEM.name = "Human Leg"
ITEM.uniqueID = "food_human_leg2"
ITEM.model = "models/dismemberment/gibs/legs/upper_leg.mdl"
ITEM.hungerAmount = 25
ITEM.foodDesc = "The upper leg of a human being."
ITEM.quantity2 = 2
ITEM.price = 100
ITEM.width = 2
ITEM.height = 1
ITEM.color = Color(150,50,50)

ITEM.attribBoosts = { ["fortitude"] = 10 }

ITEM.iconCam = {
	pos = Vector(-1.5, 200, 0),
	ang = Angle(0, 270, 0),
	fov = 5.75,
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