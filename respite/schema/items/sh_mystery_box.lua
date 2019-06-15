ITEM.name = "Mystery Box"
ITEM.desc = "A strange box, I wonder what's inside?"
ITEM.model = "models/Items/item_item_crate.mdl"
ITEM.material = "models/props_combine/stasisfield_beam"
ITEM.uniqueID = "mystery_box"
ITEM.price = 500
ITEM.flag = "v"
ITEM.width = 2
ITEM.height = 2
ITEM.color = Color(140, 20, 140)

ITEM.iconCam = {
	pos = Vector(0.75, -1, 200),
	ang = Angle(90, 0, 0),
	fov = 12,
}

ITEM.functions.Open = {
	icon = "icon16/briefcase.png",
	sound = "items/ammocrate_open.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local char = client:getChar()
		local inventory = char:getInv()
		local luck = math.Clamp(char:getAttrib("luck"), 0, 100)
		--designed so that people with large amounts of luck can always roll low, but are less likely to.
		local luckRoll = math.random(math.random(luck,100), 100) 
		
		local RContent = math.random(0,100)

		--sorry for the big complicated mess.
		if(RContent == 0) then
			client:notify("You receive a strange can-like device.")
			
			nut.item.spawn("nac", position)
			
			if(luckRoll > 50) then --potential bonus
				nut.item.spawn("food_yams", position)
				nut.item.spawn("food_laugh", position)
				nut.item.spawn("food_ravioli", position)
				nut.item.spawn("food_corn", position)
			end
		elseif(RContent < 10) then --shard
			client:notify("You receive a rib-like device.")
			
			nut.item.spawn("ribcage", position)
			
			if(luckRoll > 50) then --potential bonus
				nut.item.spawn("j_scrap_bone", position)
				nut.item.spawn("j_scrap_bone", position)
				nut.item.spawn("j_scrap_bone", position)
				nut.item.spawn("j_scrap_bone", position)
			end
		elseif(RContent < 20) then --refinery
			client:notify("You receive a refinery.")
		
			local refinery = {
				"refinery_battery",
				"refinery_chems",
				"refinery_screws",
				"refinery_currency",
				"refinery_enhanced",
				"refinery_plastics",
				"refinery_adhesive"
			}
			
			nut.item.spawn(table.Random(refinery), position) -- random refinery
			
			if(luckRoll > 60) then 
				nut.item.spawn("cube_chip_enhanced", position)
				nut.item.spawn("hl2_m_wrench", position)
			end
		elseif(RContent < 30) then --farms
			client:notify("You receive a pot of soil.")
			
			local farm = {
				"farm_apple",
				"farm_banana",
				"farm_cactus",
				"farm_lemon",
				"farm_melon",
				"farm_monster",
				"farm_orange",
				"farm_potato",
				"farm_pumpkin"
			}		
		
			nut.item.spawn(table.Random(farm), position) -- random farm
			
			if(luckRoll > 70) then
				nut.item.spawn("shard_dust", position)
			end
		elseif(RContent < 40) then --generator
			client:notify("You receive a strange looking device.")
		
			nut.item.spawn("generator_chip", position)
		
			if(luckRoll > 50) then 
				nut.item.spawn("generator_repair", position)
				nut.item.spawn("generator_repair", position)
			end
		elseif(RContent < 50) then --cube
			client:notify("You receive some kind of cube.")
		
			local cube = {
				"cube_b",
				"cube_water",
				"cube_blight",
			}
			
			nut.item.spawn(table.Random(cube), position) -- random CUBE
			
			if(luckRoll > 50) then 
				nut.item.spawn("cube_chip", position)
				nut.item.spawn("cube_chip", position)
				nut.item.spawn("cube_chip", position)
				nut.item.spawn("cube_chip", position)
			end
		elseif(RContent < 60) then --medicator or charger
			if(math.random(0,1) == 1) then
				client:notify("You receive a strange device that seems somehow medical.")			
			
				nut.item.spawn("medicator", position)
				if(luckRoll < 50) then 
					nut.item.spawn("medical_kit", position)
					nut.item.spawn("medical_kit", position)
				end
			else
				client:notify("You receive a strange device that seems hums with electricity.")
			
				nut.item.spawn("charger", position)
				if(luckRoll < 50) then 
					nut.item.spawn("ammo_battery", position)
					nut.item.spawn("ammo_battery", position)
				end				
			end
		elseif(RContent < 70) then --remini
			client:notify("You receive a nostalgic device.")
		
			nut.item.spawn("reminiscence", position)
			
			if(luckRoll > 50) then
				nut.item.spawn("j_scrap_memory", position)
				nut.item.spawn("j_scrap_memory", position)
				nut.item.spawn("j_scrap_memory", position)
				nut.item.spawn("j_scrap_memory", position)
			elseif(luckRoll > 90) then
				nut.item.spawn("cube_chip_memory", position)
			end
		elseif(RContent < 80) then --empty frame
			client:notify("You receive a large picture frame.")
		
			nut.item.spawn("frame", position)
			
			if(luckRoll > 60) then 
				nut.item.spawn("j_paint_can", position)
				nut.item.spawn("j_paint_can", position)
				nut.item.spawn("j_paint_can", position)
			end
		elseif(RContent < 90) then --converter
			client:notify("You receive some kind of cube.")
		
			nut.item.spawn("converter", position)
			
			if(luckRoll > 50) then 
				nut.item.spawn("food_apple_plastic", position)
				nut.item.spawn("food_orange_plastic", position)
				nut.item.spawn("food_lemon_plastic", position)
				nut.item.spawn("food_banana_plastic", position)
				nut.item.spawn("food_melon_plastic", position)
			end
		elseif(RContent <= 100) then --peculiar statue
			client:notify("You receive an angry looking statue.")
		
			nut.item.spawn("statue", position)
			
			if(luckRoll > 50) then 
				nut.item.spawn("food_blood", position)
				nut.item.spawn("food_blood", position)
				nut.item.spawn("food_blood", position)
			end	
		end
		if(math.random(1,5) == 5) then --random chance to drop a smaller mystery box
			client:notify("Another box?")
			nut.item.spawn("mystery_box_2", position)
		end
	end
}