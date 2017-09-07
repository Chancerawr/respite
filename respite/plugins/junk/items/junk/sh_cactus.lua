ITEM.name = "Cactus"
ITEM.uniqueID = "j_cactus_plant"
ITEM.model = "models/props_lab/cactus.mdl"
ITEM.desc = "A plant native to the desert."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1

ITEM.data = { scrapamount = 1 }
ITEM.salvItem = "j_scrap_organic"

ITEM.functions.Harvest = {
	name = "Harvest Flesh",
	tip = "Scrap this item",
	icon = "icon16/cross.png",
	onRun = function(item)
		if (item.player:getChar():getInv():findEmptySlot(1, 1) != nil) then
			item.player:getChar():getInv():add("food_cactus")
		else
			item.player:notify("You don't have any room in your inventory!")
			return false 
		end
		return true
	end
}