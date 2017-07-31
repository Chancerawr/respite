ITEM.name = "Gnome"
ITEM.uniqueID = "j_gnome"
ITEM.model = "models/props_junk/gnome.mdl"
ITEM.desc = "A friendly garden gnome to watch over your plants."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1

ITEM.data = { scrapamount = 5 }
ITEM.salvItem = "c_scrap_gnome"

ITEM.functions.Memory = {
	icon = "icon16/box.png",
	sound = "physics/concrete/rock_impact_soft3.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		local object = inventory:hasItem("j_scrap_memory")
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
		local player = item.player or item:getOwner()
		
		if !player:getChar():getInv():hasItem("j_scrap_memory") then --if item of importance isn't in the inventory.
			return false
		end
	end
}