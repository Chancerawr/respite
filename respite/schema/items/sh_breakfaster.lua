ITEM.name = "Breakfaster"
ITEM.uniqueID = "breakfaster"
ITEM.model = "models/props_lab/filecabinet02.mdl"
ITEM.material = "phoenix_storms/plastic"
ITEM.desc = "An object that has an openable door that objects can be placed into, and an output slot."
ITEM.width = 2
ITEM.height = 2
ITEM.flag = "v"
ITEM.price = 500
ITEM.category = "Machines"
ITEM.color = Color(50, 150, 50)

ITEM.iconCam = {
	pos = Vector(332.59982299805, 279.31066894531, 202.58592224121),
	ang = Angle(25, 220, 0),
	fov = 5.2785362827253,
}

ITEM.functions.Milk = {
	name = "Milk",
	icon = "icon16/cup.png",
	sound = "HL1/fvox/hiss.wav",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		
		local water = inventory:getFirstItemOfType("food_water") or inventory:getFirstItemOfType("food_water_mountain") or inventory:getFirstItemOfType("food_blood")
		if(!water) then
			client:notify("You need water.")
			return false
		end
		
		local organic = inventory:getFirstItemOfType("j_scrap_organic")
		
		if(!organic) then --need organic materials
			client:notify("You need five organic material.")
			return false
		end
		
		local amount = organic:getData("Amount", 1)
		
		if(amount < 5) then --need a certain amount of said materials
			client:notify("You need five organic material.")
			return false
		end
		
		if(amount > 5) then --if more than five, subtract from the stack.
			organic:setData("Amount", amount - 5)
		else --if five, just remove the item.
			organic:remove()
		end
		
		
		client:notify("Converting has started.")
		nut.chat.send(client, "itclose", "The machine accepts the objects, and begins to make some strange squishing noises.")	
		
		water:remove()
		
		item:setData("producing", CurTime())		
		
		timer.Simple(30, function()
			item:setData("producing", nil)
		
			timer.Simple(amount, function()
				local reward = "food_milk_carton"
				if(math.random(0,3) == 3) then --25% chance to get milk jug
					reward = "food_milk_jug"
				end
			
				if(!IsValid(item:getEntity())) then --checks if item is not on the ground
					inventory:addSmart(reward, 1, client:getItemDropPos())
				else --if the item is on the ground
					nut.item.spawn(reward, item:getEntity():GetPos() + item:getEntity():GetUp()*50) --spawn the grow item above the item
				end
			end)
			
			client:notify("Converting has finished.")
			nut.chat.send(client, "itclose", "A container filled with milk comes out of the device.")
		end)
		
		return false
	end,
	onCanRun = function(item) --only one conversion action should be happening at once with one item.
		local prodTime = 45
		if(item:getData("producing")) then
			if(item:getData("producing") < CurTime() and item:getData("producing") + prodTime >= CurTime()) then
				return false
			end
		end
		
		return true
	end
}

ITEM.functions.Egg = {
	name = "Egg",
	icon = "icon16/cup.png",
	sound = "physics/metal/metal_box_impact_soft3.wav",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		
		local water = inventory:getFirstItemOfType("food_water") or inventory:getFirstItemOfType("food_water_mountain") or inventory:getFirstItemOfType("food_blood")
		if(!water) then
			client:notify("You need water.")
			return false
		end
		
		local organic = inventory:getFirstItemOfType("j_scrap_organic")
		
		if(!organic) then --need organic materials
			client:notify("You need two organic material.")
			return false
		end
		
		local amount = organic:getData("Amount", 1)
		
		if(amount < 2) then --need a certain amount of said materials
			client:notify("You need two organic material.")
			return false
		end
		
		if(amount > 2) then 
			organic:setData("Amount", amount - 2)
		else --if five, just remove the item.
			organic:remove()
		end
		
		client:notify("Converting has started.")
		nut.chat.send(client, "itclose", "The machine accepts the objects, and begins to make some strange squishing noises.")	
		
		item:setData("producing", CurTime())
		
		water:remove()
		
		timer.Simple(45, function()
			item:setData("producing", nil)
			
			local reward = "food_egg"
		
			if(!IsValid(item:getEntity())) then --checks if item is not on the ground
				inventory:addSmart(reward, 1, client:getItemDropPos())
			else --if the item is on the ground
				nut.item.spawn(reward, item:getEntity():GetPos() + item:getEntity():GetUp()*50) --spawn the grow item above the item
			end
			
			client:notify("Converting has finished.")
			nut.chat.send(client, "itclose", "A single egg comes out of the device.")
		end)
		
		return false
	end,
	onCanRun = function(item) --only one conversion action should be happening at once with one item.
		local prodTime = 45
		if(item:getData("producing")) then
			if(item:getData("producing") < CurTime() and item:getData("producing") + prodTime >= CurTime()) then
				return false
			end
		end
		
		return true
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
			client:notify("You need an enhanced chip to insert!") return false
		end
			
		nut.item.spawn("food_pancake", position)
		nut.item.spawn("food_pancake", position)
		nut.item.spawn("food_pancake", position)
		nut.item.spawn("food_pancake", position)
		nut.item.spawn("food_pancake", position)
		nut.item.spawn("food_pancake", position)
		nut.item.spawn("food_coffee", position)
		nut.item.spawn("food_coffee", position)
		nut.item.spawn("food_coffee", position)
			
		chip:remove()
		nut.chat.send(client, "itclose", "The breakfaster accepts the chip, and begins to dispense a lot of pancakes.")
			
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
		nut.item.spawn("food_bacon", position)
		nut.item.spawn("food_bacon", position)
		nut.item.spawn("food_bacon", position)
		
		inventory:add("j_battery_dead")
		
		nut.chat.send(client, "itclose", "The device is charged momentarily, and produces some bacon.")

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

function ITEM:getDesc()
	local desc = self.desc
	
	if(self:getData("producing", false)) then
		desc = desc .. "\nA tasty smell is coming out of the device."
	end
	
	return Format(desc)
end