ITEM.name = "Gnome"
ITEM.uniqueID = "j_gnome"
ITEM.model = "models/props_junk/gnome.mdl"
ITEM.desc = "A friendly garden gnome to watch over your plants."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1
ITEM.color = Color(255, 140, 20)

ITEM.salvItem = {
	["c_scrap_gnome"] = 2
}

ITEM.iconCam = {
	pos = Vector(280.39529418945, 236.86444091797, 184.78364562988),
	ang = Angle(25, 220, 0),
	fov = 5.0807393438119,
}

ITEM.functions.Memory = {
	icon = "icon16/box.png",
	sound = "physics/concrete/rock_impact_soft3.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		local object = inventory:getFirstItemOfType("j_scrap_memory")
		local emotions = {
			"fear",
			"anger",
			"sadness",
			"joy",
			"disgust",
			"surprise",
			"trust",
			"anticipation",
			"neutral",
		}
			
		local emotion = emotions[math.random(0,8)]
		object:setData("feeling", emotion)
		
		nut.chat.send(client, "itclose", "The memory is changed somehow.")		
		
		return false
	end,
	onCanRun = function(item)
		local player = item.player
		
		if !player:getChar():getInv():getFirstItemOfType("j_scrap_memory") then --if item of importance isn't in the inventory.
			return false
		end
		
		return true
	end
}