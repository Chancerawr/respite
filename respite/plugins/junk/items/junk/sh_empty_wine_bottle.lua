ITEM.name = "Empty Wine Bottle"
ITEM.uniqueID = "j_empty_wine"
ITEM.model = "models/props/cs_militia/bottle01.mdl"
ITEM.desc = "An empty bottle made of glass, it smells like wine.\nThis container can be filled with water."
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