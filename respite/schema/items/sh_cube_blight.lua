ITEM.name = "Device - Blight"
ITEM.uniqueID = "cube_blight"
ITEM.model = "models/hunter/blocks/cube05x05x05.mdl"
ITEM.desc = "An unknown cubic device. There is a single button on it that says 'CURE'."
ITEM.width = 3
ITEM.height = 3
ITEM.flag = "v"
ITEM.price = 500
ITEM.material = "models/props_pipes/destroyedpipes01a"
ITEM.category = "Machines"
ITEM.color = Color(0, 0, 0)

ITEM.iconCam = {
	ang = Angle(0, 270, 0),
	fov	= 9.4,
	pos	= Vector(0, 200, 0)
}

ITEM.functions.Activate = {
	icon = "icon16/box.png",
	sound = "buttons/lightswitch2.wav",
	onRun = function(item)
			local client = item.player
			local position = client:getItemDropPos()
			local inventory = client:getChar():getInv()
			local chip = inventory:hasItem("cube_chip")	
			
			if (!chip) then
				client:notifyLocalized("You can't insert a chip if you don't have one!") return false
			end
			
			chip:remove()
			
			if(!inventory:add("cure")) then --if the inventory has space, put it in the inventory
				nut.item.spawn("cure", position) --if not, drop it on the ground
			end	

			nut.chat.send(client, "itclose", "The door on the machine opens up, producing a vial.")	
			return false
	end
}

ITEM.functions.Battery = {
	name = "Charged Battery",
	icon = "icon16/asterisk_orange.png",
	sound = "ambient/energy/zap9.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		local required = inventory:hasItem("ammo_battery")
			
		required:remove()
		nut.item.spawn("j_scrap_memory", position)
		nut.item.spawn("j_scrap_memory", position)

		inventory:add("j_battery_dead")
		
		nut.chat.send(client, "itclose", "The device is charged momentarily, and produces some memories.")

		return false
	end,
	onCanRun = function(item)
		local player = item.player or item:getOwner()
		
		if !player:getChar():getInv():hasItem("ammo_battery") then 
			return false
		end
	end
}