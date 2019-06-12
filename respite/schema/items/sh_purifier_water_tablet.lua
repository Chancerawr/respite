ITEM.name = "Water Purification Tablet"
ITEM.uniqueID = "purifier_water_tablet"
ITEM.model = "models/gibs/metal_gib4.mdl"
ITEM.material = "models/props_combine/com_shield001a"
ITEM.desc = "A small tablet, it says 'PURIFY' on the side of it."
ITEM.width = 1
ITEM.height = 1
ITEM.flag = "v"
ITEM.price = 500
ITEM.category = "Machines"
ITEM.color = Color(135, 200, 255)

ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 0),
	fov = 2.5,
}

ITEM.functions.Activate = {
	name = "Purify Water",
	icon = "icon16/bullet_white.png",
	sound = "buttons/lightswitch2.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		local corwater = inventory:getFirstItemOfType("food_water_misc")	
			
		if (!corwater) then
			client:notify("You don't have any Corrupted Water!") return false
		end
		
		corwater:remove()
		inventory:add("food_water", 1)
		
		nut.chat.send(client, "itclose", "The tablet is dropped into the liquid, and it is slowly purified.")
	end
}