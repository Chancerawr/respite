ITEM.name = "Cube - Water"
ITEM.uniqueID = "cube_water"
ITEM.model = "models/hunter/blocks/cube05x05x05.mdl"
ITEM.desc = "A strange metal box, it would be seemingly vibrating lightly. The box appears to have only a single button, labelled 'WATER', and a slot in the top for some sort of chip."
ITEM.width = 3
ITEM.height = 3
ITEM.flag = "v"
ITEM.price = 500
ITEM.material = "models/props_c17/metalladder001"
ITEM.category = "Machines"
ITEM.color = Color(70, 120, 70)

ITEM.iconCam = {
	ang = Angle(0, 270, 0),
	fov	= 9.4,
	pos	= Vector(0, 200, 0)
}

ITEM.functions.Chip = {
	icon = "icon16/arrow_down.png",
	sound = "buttons/lightswitch2.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		local chip = inventory:getFirstItemOfType("cube_chip")	
		
		if (!chip) then
			client:notify("You need a chip to insert!") return false
		end
		
		for i = 1,6 do 
			inventory:addSmart("food_water_misc", 1, position)
		end
		
		chip:remove()
		nut.chat.send(client, "itclose", "The machine accepts the chip, and begins to dispense multiple bottles of corrupted water.")
		
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
			
		nut.item.spawn("voltaic", position)
			
		chip:remove()
		nut.chat.send(client, "itclose", "The machine accepts the chip, and begins to dispenses a single bottle of liquid.")
			
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
		nut.item.spawn("food_soda_cola", position)
		nut.item.spawn("food_soda_cola", position)
		
		inventory:add("j_battery_dead")
		
		nut.chat.send(client, "itclose", "The device is charged momentarily, and produces some kind of soda.")

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