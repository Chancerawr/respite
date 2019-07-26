ITEM.name = "The Alchemist"
ITEM.uniqueID = "alchemist"
ITEM.model = "models/props_junk/gnome.mdl"
ITEM.material = "models/props_combine/stasisfield_beam"
ITEM.desc = "It moves when you're not watching."
ITEM.width = 1
ITEM.height = 1
ITEM.flag = "v"
ITEM.price = 500
ITEM.category = "Gnomes"
ITEM.color = Color(140, 20, 140)
ITEM.data = { producing2 = 0 }

ITEM.iconCam = {
	pos = Vector(280.39529418945, 236.86444091797, 184.78364562988),
	ang = Angle(25, 220, 0),
	fov = 5.0807393438119,
}

ITEM.functions.Depressant = {
	icon = "icon16/arrow_refresh.png",
	sound = "physics/concrete/rock_impact_soft3.wav",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		local object = inventory:getFirstItemOfType("drug_depress")
		local ranScrap = {}
			ranScrap[1] = "j_scrap_adhesive"
			ranScrap[2] = "j_scrap_battery"
			ranScrap[3] = "j_scrap_bone"
			ranScrap[4] = "j_scrap_chems"
			ranScrap[5] = "j_scrap_cloth"
			ranScrap[6] = "j_scrap_concrete"
			ranScrap[7] = "j_scrap_elastic"
			ranScrap[8] = "j_scrap_elecs"
			ranScrap[9] = "j_scrap_glass"
			ranScrap[10] = "j_scrap_light"
			ranScrap[11] = "j_scrap_metals"
			ranScrap[12] = "j_scrap_nails"
			ranScrap[13] = "j_scrap_organic"
			ranScrap[14] = "j_scrap_plastics"
			ranScrap[15] = "j_scrap_rubber"
			--ranScrap[16] = "c_scrap_gnome"
			ranScrap[16] = "j_scrap_screws"
			ranScrap[17] = "j_scrap_wood"
			--ranScrap[18] = "cube_chip"
			
		nut.chat.send(client, "itclose", "The object is placed near the Alchemist.")
		
		local amount = object:getData("Amount", 1)
		if(amount > 1) then
			object:setData("Amount", amount - 1)
		else
			object:remove()
		end
		
		item:setData("producing", CurTime())
		timer.Simple(7, function()
			local position = client:getItemDropPos()
			local reward = ranScrap[math.random(1,17)]
			
			item:setData("producing", nil)
			
			if(!IsValid(item:getEntity())) then
				inventory:addSmart(reward, 1, position)
			else
				nut.item.spawn(reward, item:getEntity():GetPos() + item:getEntity():GetForward()*5 + item:getEntity():GetForward()*50) --spawn the reward item above the entity
			end
			
			nut.chat.send(client, "itclose", "When nobody is looking, the object near the alchemist changes.")
		end)
		
		return false
	end,
	onCanRun = function(item)
		local player = item.player
		
		if !player:getChar():getInv():getFirstItemOfType("drug_depress") then --if item of importance isn't in the inventory.
			return false
		end
		
		local prodTime = 7
		if(item:getData("producing")) then
			if(item:getData("producing") < CurTime() and item:getData("producing") + prodTime >= CurTime()) then
				return false
			end
		end
		
		return true
	end
}

ITEM.functions.Memory = {
	icon = "icon16/arrow_refresh.png",
	sound = "physics/concrete/rock_impact_soft3.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		local object = inventory:getFirstItemOfType("j_scrap_memory")
		
		if(!object) then
			client:notify("You need a memory.")
			return false
		end
		
		local ranScrap = {
			"blight",
			"ichor",
			"food_water",
			"food_water_misc",
			"food_yams",
			"j_rib"
		}
			
		if(object:getData("Amount", 1) > 1) then
			object:setData("Amount", object:getData("Amount", 1) - 1)
		else
			object:remove()
		end
		
		nut.item.spawn(table.Random(ranScrap), position)
		nut.chat.send(client, "itclose", "When nobody is looking, the object in front of the alchemist changes.")		
		
		return false
	end,
	onCanRun = function(item)
		local player = item.player
		
		if !player:getChar():getInv():getFirstItemOfType("j_scrap_memory") then --if item of importance isn't in the inventory.
			return false
		end
		
		return true
	end
}

ITEM.functions.Chunk = {
	icon = "icon16/arrow_refresh.png",
	sound = "ambient/levels/canals/toxic_slime_sizzle2.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		local object = inventory:getFirstItemOfType("c_scrap_gnome")
		local amount = object:getData("Amount", 1)
		
		local ranScrap = {}
			ranScrap[1] = "shard_dust"
			ranScrap[2] = "cube_chip_memory"
			ranScrap[3] = "voltaic"
			ranScrap[4] = "charged_cube"
			
		if(amount > 1) then
			object:setData("Amount", amount - 1)
		else
			object:remove()
		end
			
		nut.item.spawn(ranScrap[math.random(1,4)], position)
		nut.chat.send(client, "itclose", "When nobody is looking, the object in front of the alchemist changes.")	
		
		return false
	end,
	onCanRun = function(item)
		local player = item.player
		
		if !player:getChar():getInv():getFirstItemOfType("c_scrap_gnome") then --if item of importance isn't in the inventory.
			return false
		end
		
		return true
	end
}

ITEM.functions.Yams = {
	name = "Mysterious Yams",
	icon = "icon16/arrow_refresh.png",
	sound = "ambient/levels/canals/toxic_slime_sizzle2.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		local object = inventory:getFirstItemOfType("food_yams_mysterious")
		local ranScrap = {}
			ranScrap[1] = "alc_whiskey"
			ranScrap[2] = "alc_vodka"
			ranScrap[3] = "alc_tequila"
			ranScrap[4] = "alc_moonshine"
		object:remove()
		nut.item.spawn(ranScrap[math.random(1,4)], position)
		nut.item.spawn(ranScrap[math.random(1,4)], position)
		nut.item.spawn(ranScrap[math.random(1,4)], position)
		nut.item.spawn(ranScrap[math.random(1,4)], position)
		nut.item.spawn(ranScrap[math.random(1,4)], position)

		nut.chat.send(client, "itclose", "When nobody is looking, the object in front of the alchemist is replaced with five bottles of alcohol.")	
		
		return false
	end,
	onCanRun = function(item)
		local player = item.player
		
		if !player:getChar():getInv():getFirstItemOfType("food_yams_mysterious") then --if item of importance isn't in the inventory.
			return false
		end
		
		return true
	end
}

ITEM.functions.Ichor = {
	name = "Ichor",
	icon = "icon16/arrow_refresh.png",
	sound = "ambient/levels/canals/toxic_slime_sizzle2.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		local ichor = inventory:getFirstItemOfType("ichor")

		local amount = ichor:getData("Amount", 1)
		ichor:setData("Amount", amount - 5) --costs 5
		if (ichor:getData("Amount", 1) == 0) then
			ichor:remove()
		end

		nut.item.spawn("food_apple_cursed", position)
		
		nut.chat.send(client, "itclose", "When nobody is looking, the object in front of the alchemist is replaced with an apple.")	
		
		return false
	end,
	onCanRun = function(item)
		local player = item.player
		
		local ichor = player:getChar():getInv():getFirstItemOfType("ichor")
		if(ichor) then
			local amount = ichor:getData("Amount", 1)
			if(amount >= 5) then
				return true --need 5 ichor to run
			else
				return false
			end
		else
			return false
		end
	end
}
