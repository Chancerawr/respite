ITEM.name = "Fishing Pole"
ITEM.desc = "A pole with a line and a reel attached to it. It glows in the dark and feels different than an ordinary fishing rod."
ITEM.model = "models/props_junk/harpoon002a.mdl"
ITEM.uniqueID = "fishing_pole"
ITEM.width = 3
ITEM.price = 20
ITEM.flag = "v"
ITEM.data = { producing2 = 0 }
ITEM.color = Color(50, 50, 255)

ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 90),
	fov = 35,
}

ITEM.functions.FishBait = {
	name = "Fishing (Chip)",
	icon = "icon16/anchor.png",
	sound = "ambient/machines/spinup.wav",
	onRun = function(item)
		local client = item.player
		
		local hook = ents.Create("prop_physics")
		hook:SetPos(client:GetPos() + Vector(0,0,50))
		hook:SetModel("models/props_junk/meathook001a.mdl")
		hook:Spawn()
		
		local phys = hook:GetPhysicsObject()
					
		if phys:IsValid() then
			local ang = client:EyeAngles()
			phys:SetVelocityInstantaneous(ang:Forward() * math.random(300, 350))
			phys:SetMass(1)
			phys:SetBuoyancyRatio(0.1)
		end
		
		timer.Simple(2, function()
			if(hook:WaterLevel() > 0) then
				local inventory = client:getChar():getInv()
				local chip = inventory:getFirstItemOfType("cube_chip")
				local char = client:getChar()
				
				nut.chat.send(client, "itclose", "The hook is cast into the water.")		
				item:setData("producing", CurTime())
				local oldPos = client:GetPos()
				client:setAction("Fishing...", 15, function()
					local luckRoll = math.Clamp(math.random(0, math.floor(char:getAttrib("luck"))), 0, 99)
					local position = client:getItemDropPos()
					
					item:setData("producing", nil)
					
					if (item != nil and client:GetPos():Distance(oldPos) <= 500 and chip) then
						local roll = math.random(0, 1)
							
						if(roll == 0) then --fish 
							local name, desc, wgt = nut.plugin.list["fish"]:constructFish()
							
							local model = ""
							if(math.random(1,2) == 2) then
								model = "2"
							end
							
							local customData = {}
							customData.name = name
							customData.desc = desc
							
							if(!inventory:add("food_fish" .. model, 1, {custom = customData, weight = wgt})) then --if the inventory has space, put it in the inventory
								nut.item.spawn("food_fish" .. model, position,
									function(item2)
										item2:setData("custom", customData)
										item2:setData("weight", wgt)
									end
								)
							end
							
							client:notify("You catch a "..name.. ".")	
						else
							roll = math.random(luckRoll, 100)
							local catch
							
							if(roll < 10) then
								nut.chat.send(client, "meclose", "catches a chunk of meat.")		
								catch = "food_monster_meat"
								
							elseif(roll < 15) then
								nut.chat.send(client, "meclose", "catches a box of coins.")
								catch = "coin_10"
								
							elseif(roll < 25) then
								nut.chat.send(client, "meclose", "catches a nostalgic object.")
								catch = "j_scrap_memory"
								
							elseif(roll < 35) then
								nut.chat.send(client, "meclose", "catches a chunk of dark wood.")
								catch = "j_dark_wood"
								
							elseif(roll < 40) then
								nut.chat.send(client, "meclose", "catches a watery tablet.")
								catch = "purifier_water_tablet"
								
							elseif(roll < 50) then
								nut.chat.send(client, "meclose", "catches a tin can with a nail in it.")
								catch = "j_scrap_nails"
								
							elseif(roll < 60) then
								nut.chat.send(client, "meclose", "catches a vial of a strange substance.")
								catch = "ichor"
								
							elseif(roll < 70) then
								nut.chat.send(client, "meclose", "catches a vial of blight.")
								catch = "blight"
								
							elseif(roll < 80) then
								nut.chat.send(client, "meclose", "catches a strange looking apple.")
								catch = "food_apple_cursed"
							
							elseif(roll < 85) then
								nut.chat.send(client, "meclose", "catches a small amount of chemicals.")
								catch = "j_scrap_chems"
								
							elseif(roll < 95) then
								local ammo = {
									"ammo_919",
									"ammo_45",
									"ammo_12g"
								}
								
								nut.chat.send(client, "meclose", "catches a box of ammunition.")
								catch = table.Random(ammo)
								
							elseif(roll < 98) then
								nut.chat.send(client, "meclose", "catches a.. Banana?")
								catch = "food_banana"	
								
							elseif(roll < 100) then
								nut.chat.send(client, "meclose", "catches a shimmering chip.")
								catch = "cube_chip_enhanced"
								
							else
								nut.chat.send(client, "meclose", "catches some kind of weird chip.")
								catch = "cube_chip_memory"
							end
							
							if(!IsValid(item:getEntity())) then --checks if item is not on the ground
								inventory:addSmart(catch, 1, client:getItemDropPos())
							else --if the item it on the ground
								nut.item.spawn(catch, item:getEntity():GetPos() + item:getEntity():GetUp()*50) --spawn the grow item above the item
							end		
						end
					
						if(math.random(luckRoll, 150) < 90) then
							client:notify("Your bait was lost.")
							chip:remove()
						end
					else
						client:notify("Fishing has failed.")
					end
					
					hook:Remove()
				end)
			else
				hook:Remove()
				client:notify("Your hook needs to be in the water!")
			end
		end)
		
		return false
	end,
	onCanRun = function(item) --only one farm action should be happening at once with one item.
		local player = item.player
		
		if(!player:getChar():getInv():getFirstItemOfType("cube_chip")) then
			return false
		end
		
		local prodTime = 15
		if(item:getData("producing")) then
			if(item:getData("producing") < CurTime() and item:getData("producing") + prodTime >= CurTime()) then
				return false
			end
		end
		
		return true		
	end
}

ITEM.functions.FishNoBait = {
	name = "Fishing (Organic Material)",
	icon = "icon16/anchor.png",
	sound = "ambient/machines/spinup.wav",
	onRun = function(item)
		local client = item.player
		
		local hook = ents.Create("prop_physics")
		hook:SetPos(client:GetPos() + Vector(0,0,50))
		hook:SetModel("models/props_junk/meathook001a.mdl")
		hook:Spawn()
		
		local phys = hook:GetPhysicsObject()
					
		if phys:IsValid() then
			local ang = client:EyeAngles()
			phys:SetVelocityInstantaneous(ang:Forward() * math.random(300, 350))
			phys:SetMass(1)
			phys:SetBuoyancyRatio(0.1)
		end
		
		timer.Simple(2, function()
			if(hook:WaterLevel() > 0) then
				local inventory = client:getChar():getInv()
				local char = client:getChar()
				
				nut.chat.send(client, "itclose", "The hook is cast into the water.")		
				item:setData("producing", CurTime())
				local oldPos = client:GetPos()
				client:setAction("Fishing...", 25, function()
					local luckRoll = math.Clamp(math.random(0, math.floor(char:getAttrib("luck"))), 0, 99)
					local position = client:getItemDropPos()
					local bait = inventory:getFirstItemOfType("j_scrap_organic")
					
					item:setData("producing", nil)
					
					if (item != nil and client:GetPos():Distance(oldPos) <= 500 and bait and bait:getData("Amount", 1) >= 2) then
						local roll = math.random(0, 1)
							
						if(roll == 0) then --fish 
							local name, desc, wgt = nut.plugin.list["fish"]:constructFish()
							desc = "A plastic fish.\nIt weighs " .. wgt .. " pounds."
							
							local model = ""
							if(math.random(1,2) == 2) then
								model = "2"
							end
							
							local customData = {}
							customData.desc = desc
							
							if(!inventory:add("food_fish" .. model .. "_plastic", 1, {custom = customData})) then --if the inventory has space, put it in the inventory
								nut.item.spawn("food_fish" .. model .. "_plastic", position,
									function(item2)
										item2:setData("custom", customData)
									end
								)
							end
							
							client:notify("You catch a plastic fish.")	
						else
							roll = math.random(luckRoll, 100)
							local catch
							
							if(roll < 40) then
								nut.chat.send(client, "meclose", "catches nothing.")
								
							elseif(roll < 50) then
								nut.chat.send(client, "meclose", "catches a tin can.")
								catch = "j_tinc"
								
							elseif(roll < 60) then
								nut.chat.send(client, "meclose", "catches an empty bottle.")
								catch = "j_empty_water"
								
							elseif(roll < 70) then
								nut.chat.send(client, "meclose", "catches a boot.")
								catch = "j_old_shoe"
								
							elseif(roll < 80) then
								nut.chat.send(client, "meclose", "catches a baby doll.")
								catch = "j_baby_doll"
							
							elseif(roll < 85) then
								nut.chat.send(client, "meclose", "catches a can of yams.")
								catch = "food_yams"								
								
							elseif(roll < 90) then
								nut.chat.send(client, "meclose", "catches a small box of coins.")
								catch = "coin_10"
								
							elseif(roll < 95) then
								nut.chat.send(client, "meclose", "catches a humanoid rib.")
								catch = "j_rib"								
								
							elseif(roll < 96) then
								nut.chat.send(client, "meclose", "catches a strange bottle.")
								catch = "drug_depress"
								
							elseif(roll < 97) then
								nut.chat.send(client, "meclose", "catches a strange can.")
								catch = "food_laugh"									
								
							elseif(roll < 98) then
								nut.chat.send(client, "meclose", "catches a.. Banana?")
								catch = "food_banana"	
								
							elseif(roll < 99) then
								nut.chat.send(client, "meclose", "catches a chip.")
								catch = "cube_chip"
								
							elseif(roll < 100) then
								nut.chat.send(client, "meclose", "catches a cactus?")
								catch = "j_cactus_plant"
								
							else
								nut.chat.send(client, "meclose", "catches a strange object.")
								catch = "j_scrap_memory"
							end
							
							if(!IsValid(item:getEntity())) then --checks if item is not on the ground
								if(catch) then
									if(!inventory:add(catch)) then --if the inventory has space, put it in the inventory
										nut.item.spawn(catch, client:getItemDropPos()) --if not, drop it on the ground
									end
								end
								
							else --if the item it on the ground
								nut.item.spawn(catch, item:getEntity():GetPos() + item:getEntity():GetUp()*50) --spawn the grow item above the item
							end		
						end
					
						if(math.random(luckRoll, 150) < 110) then
							client:notify("Your bait was lost.")
							
							local amount = bait:getData("Amount", 1)
							bait:setData("Amount", amount - 2) --costs 2
							if (bait:getData("Amount", 1) <= 0) then
								bait:remove()
							end
						end
					else
						client:notify("Fishing has failed.")
					end
					
					hook:Remove()
				end)
			else
				hook:Remove()
				client:notify("Your hook needs to be in the water!")
			end
		end)
		
		return false
	end,
	onCanRun = function(item) --only one farm action should be happening at once with one item.
		local player = item.player
		
		local organic = player:getChar():getInv():getFirstItemOfType("j_scrap_organic")
		if(!organic or organic:getData("Amount", 1) < 2) then
			return false
		end
	
		local prodTime = 25
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
	icon = "icon16/asterisk_orange.png",
	sound = "ambient/energy/zap9.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		local required = inventory:getFirstItemOfType("ammo_battery")
			
		required:remove()
		
		local roll = math.random(1,2)
		if(roll == 1) then
			nut.chat.send(client, "itclose", "The device is charged momentarily, and produces a bottle of blue haze.")
			nut.item.spawn("haze_bottled", position)
		else
			nut.chat.send(client, "itclose", "The device is charged momentarily, and produces a bottle of pink haze.")		
			nut.item.spawn("haze_bottled_pink", position)
		end

		inventory:add("j_battery_dead")
		
		nut.chat.send(client, "itclose", "The device is charged momentarily, and produces- That can't be normal.")

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