ITEM.name = "Cube - Food"
ITEM.desc = "A strange metal box, it would be seemingly vibrating lightly. The box appears to have only a single button, labelled 'FOOD', and a slot in the top for some sort of chip."
ITEM.uniqueID = "cube_b"
ITEM.model = "models/hunter/blocks/cube05x05x05.mdl"
ITEM.material = "models/props_canal/canal_bridge_railing_01a"
ITEM.width = 3
ITEM.height = 3
ITEM.flag = "v"
ITEM.price = 500
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
			client:notifyLocalized("You need a chip to insert!") return false
		end

		local ranNum = math.random(1,6)
		local reward = "food_potato" --for the item reward
		local rewardN = "potato" --for the action description
		
		if(ranNum == 1) then
		--handled by variable's default
		elseif (ranNum == 2) then
			reward = "food_banana"
			rewardN = "banana"
		elseif (ranNum == 3) then
			reward = "food_orange"
			rewardN = "orange"
		elseif (ranNum == 4) then
			reward = "food_melon"
			rewardN = "melon"
		elseif (ranNum == 5) then
			reward = "food_apple"
			rewardN = "apple"
		else
			reward = "food_lemon"
			rewardN = "lemon"
		end
		
		chip:remove()
		
		inventory:addSmart(reward, 1, position)
		
		nut.chat.send(client, "itclose", "The door on the machine opens up, dropping out a " ..rewardN.. ".")
		
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
			
		nut.item.spawn("food_apple_cursed", position)
		nut.item.spawn("food_apple_cursed", position)
		nut.item.spawn("food_apple_cursed", position)
			
		chip:remove()
		nut.chat.send(client, "itclose", "The machine accepts the chip, and begins to dispenses three strange apples.")
			
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
		nut.item.spawn("food_mre", position)
		nut.item.spawn("food_mre", position)
		nut.item.spawn("food_mre", position)
		
		inventory:add("j_battery_dead")
		
		nut.chat.send(client, "itclose", "The device is charged momentarily, and produces some packages.")

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
