ITEM.name = "Mystery Box II"
ITEM.desc = "An even stranger box, I wonder what's inside?"
ITEM.model = "models/Items/item_item_crate.mdl"
ITEM.material = "models/props_combine/stasisfield_beam"
ITEM.uniqueID = "mystery_box_2"
ITEM.price = 500
ITEM.flag = "v"
ITEM.width = 1
ITEM.height = 1
ITEM.color = Color(140, 20, 140)

ITEM.iconCam = {
	pos = Vector(1, -1, 200),
	ang = Angle(90, 0, 0),
	fov = 13,
}

if (CLIENT) then
	function ITEM:drawEntity(entity, item)
		entity:DrawModel()
		entity:SetModelScale(.5)
	end
end

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
		if(RContent < 10) then --brewery
			client:notify("You receive a device that smells alcoholic.")
		
			nut.item.spawn("brewery", position)
		
			if(luckRoll > 50) then 
				nut.item.spawn("alc_wine", position)
				nut.item.spawn("alc_wine", position)
			end				
		elseif(RContent < 20) then --ice crammer
			client:notify("You receive a cold device.")
		
			nut.item.spawn("ice_crammer", position)

			if(luckRoll > 50) then 
				nut.item.spawn("food_ice_cream", position)
				nut.item.spawn("food_ice_cream", position)
			end			
		elseif(RContent < 30) then --museum
			client:notify("You receive a historic looking device.")
		
			nut.item.spawn("museum", position)

			if(luckRoll > 50) then 
				nut.item.spawn("blight", position)
				nut.item.spawn("blight", position)
				nut.item.spawn("blight", position)
				nut.item.spawn("j_scrap_memory", position)
			end
		elseif(RContent < 40) then --purifier
			client:notify("You receive a clean looking device.")
		
			nut.item.spawn("purifier_water", position)

			if(luckRoll > 50) then
				nut.item.spawn("food_water", position)
				nut.item.spawn("food_water", position)
				nut.item.spawn("food_water", position)
				nut.item.spawn("food_water", position)
			end
		elseif(RContent < 50) then --bakery
			client:notify("You receive a device that smells of pastries.")
		
			nut.item.spawn("bakery", position)
			
			if(luckRoll > 50) then 
				nut.item.spawn("food_donut", position)
				nut.item.spawn("food_donut", position)
				nut.item.spawn("food_donut_giant", position)
			end
		elseif(RContent < 60) then --soda stream
			client:notify("You receive a device that somehow makes you thirsty.")
		
			nut.item.spawn("soda_stream", position)

			if(luckRoll > 50) then 
				nut.item.spawn("food_apple_soda", position)
				nut.item.spawn("food_orange_soda", position)
				nut.item.spawn("food_apple_juice", position)
			end
		elseif(RContent < 70) then --requisition device
			client:notify("You receive an expensive looking device.")
		
			nut.item.spawn("requisition", position)

			if(luckRoll > 50) then 
				nut.item.spawn("cube_chip_enhanced", position)
				nut.item.spawn("cube_chip_enhanced", position)
			end
		elseif(RContent < 80) then --shattered mirror
			client:notify("You receive a broken looking device.")
		
			nut.item.spawn("mirror", position)

			if(luckRoll > 50) then 
				nut.item.spawn("j_scrap_memory", position)
				nut.item.spawn("haze_bottled", position)
				nut.item.spawn("j_scrap_memory", position)
			end
		elseif(RContent < 90) then --breakfaster
			client:notify("You receive a device that smells like breakfast.")
		
			nut.item.spawn("breakfaster", position)
			
			if(luckRoll > 50) then 
				nut.item.spawn("food_milk_jug", position)
				nut.item.spawn("food_milk_carton", position)
				nut.item.spawn("food_milk_carton", position)
			end			
		elseif(RContent < 100) then --hamburger helper
			client:notify("You receive a device that smells like bacon.")
			
			nut.item.spawn("hamburger_helper", position)

			if(luckRoll > 50) then 
				nut.item.spawn("food_hotdog", position)
				nut.item.spawn("food_hamburger", position)
				nut.item.spawn("food_bacon", position)
			end
		elseif(RContent == 100) then --scary
			client:notify("You receive a clearly dangerous object.")
			
			nut.item.spawn("portal_explosives", position)
		end
		
		--nut.item.spawn(contents, position)
	end
}