ITEM.name = "Empty Mountain Spring Bottle"
ITEM.uniqueID = "j_empty_mountain_spring"
ITEM.model = "models/props/cs_office/water_bottle.mdl"
ITEM.desc = "An empty bottle made of plastic, it has no scent.\nThis container can be filled with water."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 2

ITEM.data = { scrapamount = 1 }
ITEM.salvItem = "j_scrap_plastics"

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 3,
}

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