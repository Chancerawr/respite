ITEM.name = "Cube - Blight"
ITEM.uniqueID = "cube_blight"
ITEM.model = "models/hunter/blocks/cube05x05x05.mdl"
ITEM.desc = "An unknown cubic device. There is a single button on it that says 'BLIGHT' and a slot for chips."
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
	icon = "icon16/arrow_down.png",
	sound = "buttons/lightswitch2.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		local chip = inventory:getFirstItemOfType("cube_chip")	
		
		if (!chip) then
			client:notifyLocalized("You can't insert a chip if you don't have one!") return false
		end
		
		chip:remove()
		
		inventory:addSmart("blight", 1, position)

		nut.chat.send(client, "itclose", "The door on the machine opens up, producing a vial.")	
		
		return false
	end
}

ITEM.functions.Chip2 = {
	name = "Enhanced Chip",
	icon = "icon16/box.png",
	sound = "buttons/lightswitch2.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		local chip = inventory:getFirstItemOfType("cube_chip_enhanced")	
			
		if (!chip) then
			client:notifyLocalized("You need an enhanced chip to insert!") return false
		end
		
		local roll = math.random(1,9)
		if(roll == 9) then --10% chance to get a rarer item
			nut.item.spawn("medical_purge", position)
			nut.chat.send(client, "itclose", "The machine accepts the chip, and dispenses a strange vial.")
		elseif(roll > 6) then
			nut.item.spawn("s_musicbox", position)
			nut.chat.send(client, "itclose", "The machine accepts the chip, and it dispenses a music box.")
		else
			nut.item.spawn("medical_memory", position)
			nut.item.spawn("medical_memory", position)
			nut.item.spawn("medical_memory", position)
			nut.item.spawn("medical_memory", position)
			nut.item.spawn("medical_memory", position)
			nut.chat.send(client, "itclose", "The machine accepts the chip, and it dispenses a few memory wraps.")
		end
			
		chip:remove()
			
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
		local required = inventory:getFirstItemOfType("ammo_battery")
			
		required:remove()
		nut.item.spawn("j_scrap_memory", position)
		nut.item.spawn("j_scrap_memory", position)

		inventory:add("j_battery_dead")
		
		nut.chat.send(client, "itclose", "The device is charged momentarily, and produces some memories.")

		return false
	end,
	onCanRun = function(item)
		local player = item.player
		
		if !player:getChar():getInv():getFirstItemOfType("ammo_battery") then 
			return false
		end
		
		return true
	end
}