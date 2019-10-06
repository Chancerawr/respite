ITEM.name = "Soda Stream"
ITEM.uniqueID = "soda_stream"
ITEM.model = "models/props/cs_assault/ventilationduct02.mdl"
ITEM.material = "models/props_pipes/pipesystem01a_skin3"
ITEM.desc = "A contraption that can make various types of liquid."
ITEM.width = 2
ITEM.height = 2
ITEM.flag = "v"
ITEM.price = 500
ITEM.category = "Machines"
ITEM.color = Color(50, 150, 50)

ITEM.iconCam = {
	pos = Vector(9.5, 0, 200),
	ang = Angle(90, 0, 0),
	fov = 7,
}

ITEM.functions.Ichor = {
	name = "Produce Ichor",
	icon = "icon16/cup.png",
	sound = "HL1/fvox/hiss.wav",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		
		local items = {
			"food_apple",
			"food_orange",
			"food_lemon",
			"food_potato",
			"food_melon",
			"food_banana",
			"food_pumpkin",
			"food_onion",
			"food_cactus"
		}
		
		for k, v in pairs(items) do
			food = inventory:getFirstItemOfType(v)
			if(food) then
				break
			end
		end
		
		if(!food) then
			client:notify("You need a grown food item.")
			return false
		end
		
		local memory = inventory:getFirstItemOfType("j_scrap_memory")
		if(!memory) then
			client:notify("You need a memory.")
			return false
		end
		
		local amount = memory:getData("Amount", 1)
		if(amount > 1) then
			memory:setData("Amount", amount - 1)
		else
			memory:remove()
		end
		
		client:notify("Converting has started.")
		nut.chat.send(client, "itclose", "The machine accepts the objects, and begins to make some strange squishing noises.")	
		
		item:setData("producing", CurTime())
		
		food:remove()
		
		timer.Simple(60, function()
			item:setData("producing", nil)
		
			timer.Simple(amount, function()
				if(!IsValid(item:getEntity())) then --checks if item is not on the ground
					inventory:addSmart("ichor", 1, client:getItemDropPos())
				else --if the item is on the ground
					nut.item.spawn("ichor", item:getEntity():GetPos() + item:getEntity():GetUp()*50) --spawn the grow item above the item
				end
			end)
			
			client:notify("Converting has finished.")
			nut.chat.send(client, "itclose", "Ichor comes out of the machine in a container.")
		end)
		
		return false
	end,
	onCanRun = function(item) --only one conversion action should be happening at once with one item.
		local player = item.player
		local memory = player:getChar():getInv():getFirstItemOfType("j_scrap_memory")
		
		if(!memory) then
			return false
		end
		
		local prodTime = 60
		if(item:getData("producing")) then
			if(item:getData("producing") < CurTime() and item:getData("producing") + prodTime >= CurTime()) then
				return false
			end
		end
		
		return true
	end
}

ITEM.functions.Depress = {
	name = "Depressant",
	icon = "icon16/cup.png",
	sound = "HL1/fvox/hiss.wav",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		
		local amount = depress:getData("Amount", 1)
		if(amount > 1) then
			depress:setData("Amount", amount - 1)
		else
			depress:remove()
		end
		
		client:notify("Converting has started.")
		nut.chat.send(client, "itclose", "The machine accepts the object, and begins to make some strange squishing noises.")	
		
		item:setData("producing", CurTime())
		
		timer.Simple(60, function()
			item:setData("producing", nil)
	
			if(!IsValid(item:getEntity())) then --checks if item is not on the ground
				inventory:addSmart("food_soda_depress", 1, client:getItemDropPos())
			else --if the item is on the ground
				nut.item.spawn("food_soda_depress", item:getEntity():GetPos() + item:getEntity():GetUp()*50) --spawn the grow item above the item
			end

			client:notify("Converting has finished.")
			nut.chat.send(client, "itclose", "A strangely sad soda comes out of the machine in a container.")
		end)
		
		return false
	end,
	onCanRun = function(item) --only one conversion action should be happening at once with one item.
		local player = item.player
		local depress = player:getChar():getInv():getFirstItemOfType("drug_depress")
		
		if(!depress) then
			return false
		end
		
		local prodTime = 60
		if(item:getData("producing")) then
			if(item:getData("producing") < CurTime() and item:getData("producing") + prodTime >= CurTime()) then
				return false
			end
		end
		
		return true
	end
}

ITEM.functions.Antidepress = {
	name = "Depressant",
	icon = "icon16/cup.png",
	sound = "HL1/fvox/hiss.wav",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()

		local depress = player:getChar():getInv():getFirstItemOfType("food_soda_depress")
		depress:remove()
		
		client:notify("Converting has started.")
		nut.chat.send(client, "itclose", "The machine accepts the object, and begins to make some strange squishing noises.")	
		
		item:setData("producing", CurTime())
		
		timer.Simple(60, function()
			item:setData("producing", nil)
	
			if(!IsValid(item:getEntity())) then --checks if item is not on the ground
				inventory:addSmart("food_soda_antidepress", 1, client:getItemDropPos())
			else --if the item is on the ground
				nut.item.spawn("food_soda_antidepress", item:getEntity():GetPos() + item:getEntity():GetUp()*50) --spawn the grow item above the item
			end

			client:notify("Converting has finished.")
			nut.chat.send(client, "itclose", "A not sad soda comes out of the machine in a container.")
		end)
		
		return false
	end,
	onCanRun = function(item) --only one conversion action should be happening at once with one item.
		local player = item.player
		local depress = player:getChar():getInv():getFirstItemOfType("food_soda_depress")
		
		if(!depress) then
			return false
		end
		
		local prodTime = 60
		if(item:getData("producing")) then
			if(item:getData("producing") < CurTime() and item:getData("producing") + prodTime >= CurTime()) then
				return false
			end
		end
		
		return true
	end
}

ITEM.functions.Pickle = {
	name = "Pickles",
	icon = "icon16/cup.png",
	sound = "HL1/fvox/hiss.wav",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		
		local pickle = inventory:getFirstItemOfType("food_pickles")
		pickle:remove()
		
		client:notify("Converting has started.")
		nut.chat.send(client, "itclose", "The machine accepts the object, and begins to make some strange squishing noises.")	
		
		item:setData("producing", CurTime())
		
		timer.Simple(60, function()
			item:setData("producing", nil)
			
			local soda = "food_pickle_soda"
			if(math.random(0,1) == 1) then
				soda = "food_pickle_juice"
			end

			if(!IsValid(item:getEntity())) then --checks if item is not on the ground
				inventory:addSmart(soda, 1, client:getItemDropPos())
			else --if the item is on the ground
				nut.item.spawn(soda, item:getEntity():GetPos() + item:getEntity():GetUp()*50) --spawn the grow item above the item
			end

			client:notify("Converting has finished.")
			
			nut.chat.send(client, "itclose", "A strange drink comes from the machine.")
		end)
		
		return false
	end,
	onCanRun = function(item) --only one conversion action should be happening at once with one item.
		local player = item.player
		local pickle = player:getChar():getInv():getFirstItemOfType("food_pickles")
		
		if(!pickle) then
			return false
		end
		
		local prodTime = 60
		if(item:getData("producing")) then
			if(item:getData("producing") < CurTime() and item:getData("producing") + prodTime >= CurTime()) then
				return false
			end
		end
		
		return true
	end
}

ITEM.functions.Juice = {
	icon = "icon16/cup.png",
	sound = "npc/barnacle/neck_snap2.wav",
	onRun = function(item)
		local foods = {
			"food_apple",
			"food_banana",
			"food_lemon",
			"food_melon",
			"food_orange",
			"food_potato",
			"food_pumpkin",
			"food_onion",
			"food_cactus"
		}
	
		local client = item.player
		local inventory = client:getChar():getInv()
		
		local fruit
		for k, v in pairs (foods) do
			fruit = inventory:getFirstItemOfType(v)
			if (fruit) then
				break
			end
		end	
		
		if(!fruit) then
			client:notifyLocalized("You don't have a suitable food!") 
			return false
		end
		
		client:notifyLocalized("Converting has started.")
		nut.chat.send(client, "itclose", "The machine accepts the plant matter.")	
		
		item:setData("producing", CurTime())
		fruit:remove()
		
		timer.Simple(120, function()
			item:setData("producing", nil)
		
			local cans = 1 --this is left over from soda
			
			local soda = fruit.uniqueID .. "_juice"
			
			if(!IsValid(item:getEntity())) then --checks if item is not on the ground
				inventory:addSmart(soda, cans, client:getItemDropPos())
			else --if the item is on the ground
				for i = 1, cans do
					nut.item.spawn(soda, item:getEntity():GetPos() + item:getEntity():GetUp()*50) --spawn the grow item above the item
				end
			end
			
			nut.chat.send(client, "itclose", "Juice is dispensed from the machine.")
		end)
		
		return false
	end,
	onCanRun = function(item) --only one conversion action should be happening at once with one item.
		local prodTime = 120
		if(item:getData("producing")) then
			if(item:getData("producing") < CurTime() and item:getData("producing") + prodTime >= CurTime()) then
				return false
			end
		end
		
		return true
	end
}

ITEM.functions.Soda = {
	icon = "icon16/cup.png",
	sound = "npc/barnacle/neck_snap2.wav",
	onRun = function(item)
		local foods = {
			"food_apple",
			"food_banana",
			"food_lemon",
			"food_melon",
			"food_orange",
			"food_potato",
			"food_pumpkin",
			"food_onion",
			"food_cactus"
		}
	
		local client = item.player
		local inventory = client:getChar():getInv()
		
		local fruit
		for k, v in pairs (foods) do
			fruit = inventory:getFirstItemOfType(v)
			if (fruit) then
				break
			end
		end	
		
		if(!fruit) then
			client:notify("You don't have a suitable food!") return false
		end
		
		client:notifyLocalized("Converting has started.")
		nut.chat.send(client, "itclose", "The machine accepts the plant matter.")	
		
		item:setData("producing", CurTime())
		fruit:remove()
		
		timer.Simple(120, function()
			item:setData("producing", nil)
		
			local cans = 1
			if (fruit.uniqueID == "food_pumpkin") then
				cans = 3
			elseif(fruit.uniqueID == "food_melon") then
				cans = 2
			end
			
			local soda = fruit.uniqueID .. "_soda"

			if(math.random(0,10) == 10) then
				local ran = math.random(0,2)
				if(ran == 0) then
					soda = "food_soda_cherry"
				elseif(ran == 1) then
					soda = "food_soda_blueberry"
				else
					soda = "food_soda_cola"
				end
			end
			
			if(!IsValid(item:getEntity())) then --checks if item is not on the ground
				inventory:addSmart(soda, cans, client:getItemDropPos())
			else --if the item is on the ground
				for i = 1, cans do
					nut.item.spawn(soda, item:getEntity():GetPos() + item:getEntity():GetUp()*50) --spawn the grow item above the item
				end
			end
			
			nut.chat.send(client, "itclose", "Soda is dispensed from the machine.")
		end)
		
		return false
	end,
	onCanRun = function(item) --only one conversion action should be happening at once with one item.
		local prodTime = 120
		if(item:getData("producing")) then
			if(item:getData("producing") < CurTime() and item:getData("producing") + prodTime >= CurTime()) then
				return false
			end
		end
		
		return true
	end
}

ITEM.functions.Cactus = {
	icon = "icon16/cup.png",
	sound = "npc/barnacle/neck_snap2.wav",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		
		local cactus = inventory:getFirstItemOfType("j_cactus_plant")
		
		client:notifyLocalized("Converting has started.")
		nut.chat.send(client, "itclose", "The machine accepts the cactus.")	
		
		item:setData("producing", CurTime())
		cactus:remove()
		
		timer.Simple(45, 
			function()
				item:setData("producing", nil)
			
				local soda = "food_cactus_soda"

				if(!IsValid(item:getEntity())) then --checks if item is not on the ground
					inventory:addSmart(soda, 1, client:getItemDropPos())
				else --if the item is on the ground
					nut.item.spawn(soda, item:getEntity():GetPos() + item:getEntity():GetUp()*50) --spawn the grow item above the item
				end
				
				nut.chat.send(client, "itclose", "Soda is dispensed from the machine.")
			end
		)
		
		return false
	end,
	onCanRun = function(item) --only one conversion action should be happening at once with one item.
		local player = item.player
		local cactus = player:getChar():getInv():getFirstItemOfType("j_cactus_plant")
		
		if(!cactus) then
			return false
		end
		
		local prodTime = 45
		if(item:getData("producing")) then
			if(item:getData("producing") < CurTime() and item:getData("producing") + prodTime >= CurTime()) then
				return false
			end
		end
		
		return true
	end
}

ITEM.functions.Battery = {
	name = "Charged Battery",
	icon = "icon16/cup.png",
	sound = "HL1/fvox/hiss.wav",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		
		local battery = inventory:getFirstItemOfType("ammo_battery")
		
		client:notifyLocalized("Converting has started.")
		nut.chat.send(client, "itclose", "The machine accepts the battery.")	
		
		item:setData("producing", CurTime())
		battery:remove()
		
		timer.Simple(45, function()
			item:setData("producing", nil)
			
			local soda = "food_soda_cold"

			local rewards = {
				"food_soda_cold",
				"j_battery_dead"
			}
			
			for k, v in pairs(rewards) do
				timer.Simple(k, function()
					if(!IsValid(item:getEntity())) then --checks if item is not on the ground
						inventory:addSmart(v, 1, client:getItemDropPos())
					else --if the item is on the ground
						nut.item.spawn(v, item:getEntity():GetPos() + item:getEntity():GetUp()*50) --spawn the grow item above the item
					end
				end)
			end
			
			nut.chat.send(client, "itclose", "Something is dispensed from the machine.")
		end)
		
		return false
	end,
	onCanRun = function(item) --only one conversion action should be happening at once with one item.
		local player = item.player
		local battery = player:getChar():getInv():getFirstItemOfType("ammo_battery")

		if(!battery) then
			return false
		end
		
		local prodTime = 45
		if(item:getData("producing")) then
			if(item:getData("producing") < CurTime() and item:getData("producing") + prodTime >= CurTime()) then
				return false
			end
		end
		
		return true
	end
}

ITEM.functions.EChip = {
	name = "Enhanced Chip",
	icon = "icon16/map.png",
	sound = "ambient/water/distant_drip4.wav",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		local chip = inventory:getFirstItemOfType("cube_chip_enhanced")	
		
		nut.chat.send(client, "meclose", "pushes an enhanced chip into the device, and bottles shoot out of it suddenly.")

		chip:remove()

		local position = client:getItemDropPos()
	
		local reward = "food_soda_bottled"
		if(!IsValid(item:getEntity())) then
			inventory:addSmart(reward, 3, position)
		else
			--spawn the reward item above the entity
			for i = 1, 3 do
				nut.item.spawn(reward, item:getEntity():GetPos() + item:getEntity():GetUp()*50)
			end
		end

		return false
	end,
	onCanRun = function(item)
		local player = item.player
		local chip = player:getChar():getInv():getFirstItemOfType("cube_chip_enhanced")
		
		if (!chip) then --if item of importance isn't in the inventory.
			return false
		end
		
		return true
	end
}

function ITEM:getDesc()
	local desc = self.desc
	
	if(self:getData("producing", false)) then
		desc = desc .. "\nThe device is activated."
	end
	
	return Format(desc)
end