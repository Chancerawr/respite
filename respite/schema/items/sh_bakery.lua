ITEM.name = "Bakery"
ITEM.uniqueID = "bakery"
ITEM.model = "models/props_c17/FurnitureCupboard001a.mdl"
ITEM.desc = "A strange wooden cupboard, the left door is labelled 'ORGANIC', and the right door is labelled 'WATER'."
ITEM.width = 2
ITEM.height = 2
ITEM.flag = "v"
ITEM.price = 500
ITEM.category = "Machines"
ITEM.color = Color(50, 150, 50)

ITEM.iconCam = {
	pos = Vector(200, -11, 10),
	ang = Angle(180, -0, 180),
	fov = 10.5,
}

ITEM.functions.Bake = {
	icon = "icon16/cake.png",
	sound = "ambient/fire/mtov_flame2.wav",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		local organic = inventory:getFirstItemOfType("j_scrap_organic")	
		local water = inventory:getFirstItemOfType("food_water_misc") or inventory:getFirstItemOfType("food_water") or inventory:getFirstItemOfType("food_blood") or inventory:getFirstItemOfType("food_water_mountain")
		
		if (!organic or !water) then
			client:notify("You need 2 organic materials and one bottle of water!") return false
		end
			
		local amount = organic:getData("Amount", 1)

		if (amount >= 2) then
			nut.chat.send(client, "itclose", "The bakery accepts the materials.")
			local roll = math.random(0,10)
			local result
			local num
			
			if(roll < 5) then --donuts
				result = "food_donut"
				num = math.random(2,3)
			elseif(roll < 9) then --bread
				result = "food_bread_box"
				num = math.random(1,2)
			else
				local roll2 = math.random(0,2)
				if(roll2 == 0) then --chocolate
					result = "food_chocolate"
					num = math.random(1,2)
				elseif(roll2 == 1) then --cookies
					result = "food_cookies"
					num = math.random(1,2)
				else
					if(math.random(0,1) == 1 and water.uniqueID != "food_water_misc") then --giant donut
						result = "food_donut_giant"
						num = 1
					else
						result = "food_donut" --lots of donuts
						num = math.random(4,7)
					end
				end
			end
			
			--removes used items
			water:remove()
			organic:setData("Amount", amount - 2)
			if (organic:getData("Amount", 1) == 0) then
				organic:remove()
			end
			
			item:setData("producing", CurTime())
			
			timer.Simple(60, 
				function()
					if (item != nil) then
						local position 
						
						item:setData("producing", nil)
						
						if(water.uniqueID == "food_water_misc") then --if our water is dirty, only 1 item
							num = 1
						end
						
						if(!IsValid(item:getEntity())) then--determines where to drop item
							position = client:getItemDropPos()
						else
							position = item:getEntity():GetPos() + item:getEntity():GetUp()*50
						end
			
						for i = 1, num do --spawns items
							nut.item.spawn(result, position)
						end

						client:notify("Baking is finished.")
					end
				end
			)
		else
			client:notifyLocalized("You need 2 organic material and one bottle of water!") return false
		end

		return false
	end,
	onCanRun = function(item) --only one conversion action should be happening at once with one item.
		local prodTime = 60
		if(item:getData("producing")) then
			if(item:getData("producing") < CurTime() and item:getData("producing") + prodTime >= CurTime()) then
				return false
			end
		end
		
		print("We can run")
		return true
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
		nut.item.spawn("food_donut_giant", position)

		inventory:add("j_battery_dead")
		
		nut.chat.send(client, "itclose", "The device is charged momentarily, and produces a giant donut.")

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
		desc = desc .. "\nA delicious smell is coming out of the device."
	end
	
	return Format(desc)
end