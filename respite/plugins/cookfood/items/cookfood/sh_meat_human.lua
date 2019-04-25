ITEM.name = "Human Meat"
ITEM.desc = "Meat ripped from the body of a human, it smells disgusting."
ITEM.model = "models/gibs/antlion_gib_small_2.mdl"
ITEM.material = "models/flesh"
ITEM.uniqueID = "food_human_meat"
ITEM.hungerAmount = 15
ITEM.quantity2 = 2
ITEM.price = 0
ITEM.width = 1
ITEM.height = 1
ITEM.flag = "v"
ITEM.material = "models/flesh"
ITEM.color = Color(150,50,50)

ITEM.attribBoosts = { 
	["fortitude"] = 10 
}

ITEM.iconCam = {
	pos = Vector(0.5, -0.25, 200),
	ang = Angle(90, 0, 0),
	fov = 2.75,
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