ITEM.name = "Empty Vodka Bottle"
ITEM.uniqueID = "j_empty_vodka"
ITEM.model = "models/props_junk/glassjug01.mdl"
ITEM.desc = "An empty bottle made of glass, it smells like vodka.\nThis container can be filled with water."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 2

ITEM.data = { scrapamount = 1 }
ITEM.salvItem = "j_scrap_glass"

ITEM.functions.Fill = {
	icon = "icon16/box.png",
	sound = "ambient/water/distant_drip4.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
			
		nut.item.spawn("food_water_misc", position) 
		client:notifyLocalized("Your container has been filled.")
	end,
	onCanRun = function(item)
		local client = item:getOwner() or item.player
		if(client:WaterLevel() < 1) then
			return false
		end
	end
}