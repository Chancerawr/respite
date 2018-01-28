ITEM.name = "Empty Bleach Container"
ITEM.uniqueID = "j_empty_bleach"
ITEM.model = "models/props_junk/garbage_plasticbottle001a.mdl"
ITEM.desc = "An empty plastic container that smells of bleach.\nThis container can be filled with water."
ITEM.flag = "j"
ITEM.width = 2
ITEM.height = 2

ITEM.data = { scrapamount = 2 }
ITEM.salvItem = "j_scrap_plastics"

ITEM.iconCam = {
	pos = Vector(224.21286010742, 188.08586120605, 136.6078338623),
	ang = Angle(25, 220, 0),
	fov = 4.8611911663843,
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