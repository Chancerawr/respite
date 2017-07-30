ITEM.name = "Bacon"
ITEM.uniqueID = "food_bacon"
ITEM.hungerAmount = 15
ITEM.model = "models/gibs/wood_gib01e.mdl"
ITEM.foodDesc = "Some sort of bacon, it looks pretty tasty."
ITEM.quantity = 2
ITEM.price = 0
ITEM.width = 1
ITEM.height = 1
ITEM.flag = "v"
ITEM.material = "models/flesh"

ITEM.attribBoosts = { ["fortitude"] = 8, ["str"] = 5}

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