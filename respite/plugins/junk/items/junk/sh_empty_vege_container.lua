ITEM.name = "Empty Vegetable Oil Container"
ITEM.uniqueID = "j_empty_vegetable_oil"
ITEM.model = "models/props_junk/garbage_plasticbottle002a.mdl"
ITEM.desc = "An empty plastic container that smells like vegetable oil.\nThis container can be filled with water."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 2

ITEM.data = { scrapamount = 1 }
ITEM.salvItem = "j_scrap_plastics"

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