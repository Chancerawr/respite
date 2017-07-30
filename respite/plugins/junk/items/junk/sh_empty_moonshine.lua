ITEM.name = "Empty Moonshine Container"
ITEM.uniqueID = "j_empty_moonshine"
ITEM.model = "models/props_junk/garbage_glassbottle003a.mdl"
ITEM.desc = "An empty container, it smells horrible.\nThis container can be filled with water."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 2
ITEM.material = "models/props_wasteland/tugboat02"

ITEM.data = { scrapamount = 3 }
ITEM.salvItem = "j_scrap_plastic"

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