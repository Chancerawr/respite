ITEM.name = "Device - Food"
ITEM.uniqueID = "cube_b"
ITEM.model = "models/hunter/blocks/cube05x05x05.mdl"
ITEM.material = "models/props_canal/canal_bridge_railing_01a"
ITEM.desc = "A strange metal box, it would be seemingly vibrating lightly. The box appears to have only a single button, labelled 'FOOD', and a slot in the top for some sort of chip."
ITEM.width = 3
ITEM.height = 3
ITEM.flag = "v"
ITEM.price = 500
ITEM.category = "Machines"
ITEM.color = Color(128, 128, 128)

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
			if(!inventory:add(reward)) then --if the inventory has space, put it in the inventory
				nut.item.spawn(reward, position) --if not, drop it on the ground
			end	
			nut.chat.send(client, "itclose", "The door on the machine opens up, dropping out a " ..rewardN.. ".")				
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
		nut.item.spawn("food_mre", position)
		nut.item.spawn("food_mre", position)
		nut.item.spawn("food_mre", position)
		
		inventory:add("j_battery_dead")
		
		nut.chat.send(client, "itclose", "The device is charged momentarily, and produces some packages.")

		return false
	end,
	onCanRun = function(item)
		local player = item.player or item:getOwner()
		
		if !player:getChar():getInv():hasItem("ammo_battery") then 
			return false
		end
	end
}
