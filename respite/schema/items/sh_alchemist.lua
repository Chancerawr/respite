ITEM.name = "The Alchemist"
ITEM.uniqueID = "alchemist"
ITEM.model = "models/props_junk/gnome.mdl"
ITEM.material = "models/props_lab/security_screens"
ITEM.desc = "It moves when you're not watching."
ITEM.width = 1
ITEM.height = 1
ITEM.flag = "v"
ITEM.price = 500
ITEM.category = "Machines"
ITEM.color = Color(140, 20, 140)
ITEM.data = { producing2 = 0 }

ITEM.functions.Depressant = {
	icon = "icon16/box.png",
	sound = "physics/concrete/rock_impact_soft3.wav",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		local object = inventory:hasItem("drug_depress")
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
		object:remove()
		item:setData("producing2", CurTime())
		timer.Simple(7, 
			function()
				local position = client:getItemDropPos()
				local reward = ranScrap[math.random(1,17)]
				
				item:setData("producing2", 0)
				
				if(!IsValid(item:getEntity())) then
					if(!inventory:add(reward)) then --if the inventory has space, put it in the inventory
						nut.item.spawn(reward, position) --if not, drop it on the ground
					end
				else
					nut.item.spawn(reward, item:getEntity():GetPos() + item:getEntity():GetForward()*5 + item:getEntity():GetForward()*50) --spawn the reward item above the entity
				end
				
				nut.chat.send(client, "itclose", "When nobody is looking, the object near the alchemist changes.")
			end
		)
		
		return false
	end,
	onCanRun = function(item)
		local player = item.player or item:getOwner()
		
		if !player:getChar():getInv():hasItem("drug_depress") then --if item of importance isn't in the inventory.
			return false
		end
		
		local endTime = item:getData("producing2") + 7
		if (CurTime() > endTime or item:getData("producing2") > CurTime() or item:getData("producing2") == 0) then
			return true 
		else
			return false
		end
	end
}

ITEM.functions.Memory = {
	icon = "icon16/box.png",
	sound = "physics/concrete/rock_impact_soft3.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		local object = inventory:hasItem("j_scrap_memory")
		local ranScrap = {}
			ranScrap[1] = "cure"
			ranScrap[2] = "food_water"
			ranScrap[3] = "food_yams"
			
		if(object:getData("Amount") > 1) then
			object:setData("Amount", object:getData("Amount") - 1)
		else
			object:remove()
		end
		
		nut.item.spawn(ranScrap[math.random(1,3)], position)
		nut.chat.send(client, "itclose", "When nobody is looking, the object in front of the alchemist changes.")		
		
		return false
	end,
	onCanRun = function(item)
		local player = item.player or item:getOwner()
		
		if !player:getChar():getInv():hasItem("j_scrap_memory") then --if item of importance isn't in the inventory.
			return false
		end
	end
}

ITEM.functions.Chunk = {
	icon = "icon16/box.png",
	sound = "ambient/levels/canals/toxic_slime_sizzle2.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		local object = inventory:hasItem("c_scrap_gnome")
		local ranScrap = {}
			ranScrap[1] = "shard"
			ranScrap[2] = "cube_chip_enhanced"
			ranScrap[3] = "food_apple_cursed"
			ranScrap[4] = "portal_explosives"
		object:remove()
		nut.item.spawn(ranScrap[math.random(1,4)], position)
		nut.chat.send(client, "itclose", "When nobody is looking, the object in front of the alchemist changes.")	
		
		return false
	end,
	onCanRun = function(item)
		local player = item.player or item:getOwner()
		
		if !player:getChar():getInv():hasItem("c_scrap_gnome") then --if item of importance isn't in the inventory.
			return false
		end
	end
}

ITEM.functions.Yams = {
	name = "Mysterious Yams",
	icon = "icon16/box.png",
	sound = "ambient/levels/canals/toxic_slime_sizzle2.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		local object = inventory:hasItem("food_yams_mysterious")
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
		local player = item.player or item:getOwner()
		
		if !player:getChar():getInv():hasItem("food_yams_mysterious") then --if item of importance isn't in the inventory.
			return false
		end
	end
}
