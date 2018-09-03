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
		end
		
		timer.Simple(2, function()
			if(hook:WaterLevel() > 0) then
				local inventory = client:getChar():getInv()
				local chip = inventory:hasItem("cube_chip")
				local char = client:getChar()
				
				nut.chat.send(client, "itclose", "The hook is cast into the water.")		
				item:setData("producing2", CurTime())
				local oldPos = client:GetPos()
				client:setAction("Fishing...", 15, 
					function()
						local luckRoll = math.Clamp(math.random(0, math.floor(char:getAttrib("luck"))), 0, 99)
						local position = client:getItemDropPos()
						
						item:setData("producing2", 0)
						
						if (item != nil and client:GetPos():Distance(oldPos) <= 500 and chip) then
							local roll = math.random(0, 1)
								
							if(roll == 0) then --fish 
								local name, desc, wgt = nut.plugin.list["fish"]:constructFish()
								
								local model = ""
								if(math.random(1,2) == 2) then
									model = "2"
								end
								
								if(!inventory:add("food_fish" .. model, 1, {customName = name, customDesc = desc, weight = wgt})) then --if the inventory has space, put it in the inventory
									nut.item.spawn("food_fish" .. model, position,
										function(item2)
											item2:setData("customName", name)
											item2:setData("customDesc", desc)
											item2:setData("weight", wgt)
										end
									)
								end
								
								client:notify("You catch a "..name.. ".")	
							else
								roll = math.random(luckRoll, 100)
								
								if(roll < 10) then
									nut.chat.send(client, "meclose", "catches a chunk of meat.")		
									catch = "food_monster_meat"
									
								elseif(roll < 20) then
									nut.chat.send(client, "meclose", "catches a box of coins.")
									catch = "coin_10"
									
								elseif(roll < 30) then
									nut.chat.send(client, "meclose", "catches a nostalgic object.")
									catch = "j_scrap_memory"
									
								elseif(roll < 40) then
									nut.chat.send(client, "meclose", "catches a chunk of dark wood.")
									catch = "j_dark_wood"
									
								elseif(roll < 50) then
									nut.chat.send(client, "meclose", "catches a watery tablet.")
									catch = "purifier_water_tablet"
									
								elseif(roll < 60) then
									nut.chat.send(client, "meclose", "catches a small amount of chemicals.")
									catch = "j_scrap_chems"
									
								elseif(roll < 70) then
									nut.chat.send(client, "meclose", "catches a strange looking apple.")
									catch = "food_apple_cursed"
									
								elseif(roll < 80) then
									nut.chat.send(client, "meclose", "catches a metallic chip.")
									catch = "cube_chip"
									
								elseif(roll < 90) then
									nut.chat.send(client, "meclose", "catches a vial of a strange substance.")
									catch = "ichor"
								
								elseif(roll < 95) then
									nut.chat.send(client, "meclose", "catches a shimmering chip.")
									catch = "cube_chip_enhanced"
									
								elseif(roll < 99) then
									nut.chat.send(client, "meclose", "catches a box of ammunition.")
									catch = "ammo_919"
									
								else
									nut.chat.send(client, "meclose", "catches some kind of glowing dust.")
									catch = "shard_dust"
								end
								
								if(!IsValid(item:getEntity())) then --checks if item is not on the ground
									if(!inventory:add(catch)) then --if the inventory has space, put it in the inventory
										nut.item.spawn(catch, client:getItemDropPos()) --if not, drop it on the ground
									end
								else --if the item it on the ground
									nut.item.spawn(catch, item:getEntity():GetPos() + item:getEntity():GetUp()*50) --spawn the grow item above the item
								end		
							end
						
							if(math.random(luckRoll, 100) < 75) then
								client:notify("Your bait was lost.")
								chip:remove()
							end
						else
							client:notify("Fishing has failed.")
						end
						
						hook:Remove()
					end
				)
			else
				hook:Remove()
				client:notify("Your hook needs to be in the water!")
			end
		end)
		
		return false
	end,
	onCanRun = function(item) --only one farm action should be happening at once with one item.
		local endTime = item:getData("producing2") + 15
		local player = item.player or item:getOwner()
		
		if(!player:getChar():getInv():hasItem("cube_chip")) then
			return false
		end
		
		if (CurTime() > endTime or item:getData("producing2") > CurTime() or item:getData("producing2") == 0) then
			return true 
		else
			return false
		end
	end
}

ITEM.functions.FishNoBait = {
	name = "Fishing (No Bait)",
	icon = "icon16/anchor.png",
	sound = "ambient/machines/spinup.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		if(client:WaterLevel() > 0) then
			local inventory = client:getChar():getInv()
			local reward = math.random(0,10) 
			local catch = ""
			
			if(reward <= 5) then
				if(math.random(0,1) == 0) then
					catch = "food_fish_plastic"
				else
					catch = "food_fish2_plastic"
				end
			elseif(reward <= 6) then
				catch = "j_old_shoe"
			elseif(reward <= 7) then
				catch = "j_family_picture"
			elseif(reward <= 8) then
				catch = "j_baby_doll"
			elseif(reward <= 9) then
				catch = "j_stuffed_turtle"
			else
				catch = "j_soccerball"
			end
			client:notify("Fishing has started.")
			nut.chat.send(client, "itclose", "The unbaited hook is cast into the water.")		
			item:setData("producing2", CurTime())
			local oldPos = client:GetPos()
			client:setAction("Fishing...", 120, 
				function()
					if (item != nil and client:GetPos():Distance(oldPos) <= 500) then
						item:setData("producing2", 0)
						if(!IsValid(item:getEntity())) then --checks if item is not on the ground
							if(!inventory:add(catch)) then --if the inventory has space, put it in the inventory
								nut.item.spawn(catch, client:getItemDropPos()) --if not, drop it on the ground
							end
						else --if the item it on the ground
							nut.item.spawn(catch, item:getEntity():GetPos() + item:getEntity():GetUp()*50) --spawn the grow item above the item
						end
						client:notify("Fishing has finished.")
					else
						client:notify("Fishing has failed.")
					end
				end
			)
		end
		return false
	end,
	onCanRun = function(item) --only one farm action should be happening at once with one item.
		local endTime = item:getData("producing2") + 80
		if (CurTime() > endTime or item:getData("producing2") > CurTime() or item:getData("producing2") == 0) then
			return true 
		else
			return false
		end
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
		local player = item.player or item:getOwner()
		
		if !player:getChar():getInv():hasItem("ammo_battery") then 
			return false
		end
	end
}