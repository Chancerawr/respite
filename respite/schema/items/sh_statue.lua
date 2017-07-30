ITEM.name = "Peculiar Statue"
ITEM.uniqueID = "statue"
ITEM.model = "models/props_combine/breenbust.mdl"
ITEM.desc = "It appears to be some kind of bust, but something about it makes you uncomfortable."
ITEM.width = 2
ITEM.height = 3
ITEM.flag = "v"
ITEM.price = 500
ITEM.material = "models/props_pipes/destroyedpipes01a"
ITEM.color = Color(0, 0, 0)

ITEM.category = "Machines"

ITEM.iconCam = {
	ang = Angle(0, 270, 0),
	fov	= 9.4,
	pos	= Vector(0, 200, 0)
}

ITEM.functions.CURE = {
	icon = "icon16/box.png",
	sound = "ambient/creatures/rats4.wav",
	onRun = function(item)
			local client = item.player
			local position = client:getItemDropPos()
			local inventory = client:getChar():getInv()
			local cure = inventory:hasItem("cure")	
			
			if (cure) then
				cure:remove()
				nut.item.spawn("food_blood", position)
				nut.chat.send(client, "itclose", "The statue begins crying blood.")	
			else
				client:notifyLocalized("You need CURE.")
			end
			
			return false
	end
}