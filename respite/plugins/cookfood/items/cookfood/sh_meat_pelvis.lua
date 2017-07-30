ITEM.name = "Human Pelvis"
ITEM.uniqueID = "food_human_pelvis"
ITEM.model = "models/dismemberment/gibs/torso/torso_pelvis.mdl"
ITEM.hungerAmount = 45
ITEM.foodDesc = "The pelvis of a human being."
ITEM.quantity = 3
ITEM.price = 100
ITEM.width = 3
ITEM.height = 3
--10 fortitude
ITEM.attribBoosts = { ["fortitude"] = 10 }

ITEM.functions.Convert = {
  tip = "Convert this item",
  icon = "icon16/cross.png",
  onRun = function(item)
    if (item.player:getChar():getInv():findEmptySlot(1, 1) != nil) then
		item.player:getChar():getInv():add("j_scrap_organic", 1, { Amount = 15 })
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