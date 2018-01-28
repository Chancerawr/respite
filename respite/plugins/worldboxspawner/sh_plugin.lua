local PLUGIN = PLUGIN
PLUGIN.name = "World Box Spawner"
PLUGIN.author = "Chancer"
PLUGIN.desc = "Spawns loot boxes in places."
PLUGIN.boxPoints = PLUGIN.boxPoints or {}

PLUGIN.definitions = PLUGIN.definitions or {}
STORAGE_DEFINITIONS = PLUGIN.definitions

--nut.util.include("sh_definitions.lua")

PLUGIN.spawngroups = {
	["default"] = { --this is what it uses if you dont supply a name
		"food_banana",
	},
	["food"] = {
		"food_juice",
		"food_soda_bottled",
		"food_water",
		"food_water_mountain",
		"food_beans",
		"food_instant_potatoes",
		"food_canned_1",
		"food_tuna",
		"food_chinese",
		"food_cereal",
		"food_chips",
		"food_chocolate",
		"food_egg",
		"food_fish",
		"food_fish2",
		"food_milk_carton",
		"food_milk_jug",
		"food_mre",
		"food_orange",
		"food_potato",
		"food_pumpkin",
		"food_soda_blueberry",
		"food_soda_cherry",
		"food_soda_lemon",
		"food_melon",
		"food_apple",
		"food_banana",
		"food_lemon",
		"food_water",
		"food_water_mountain",
		"food_beans",
		"food_instant_potatoes",
		"food_canned_1",
		"food_tuna",
		"food_mre",
		"food_asparagus",
		"food_chicken",
		"food_chili",
		"food_corn",
		"food_mushrooms",
		"food_peaches",
		"food_pears",
		"food_peas",
		"food_ravioli",
		"food_sausage",
		"food_chickennoodle",
		"food_chowder",
		"food_spam",
		"food_tomatoes",
		"food_yams",
	},
	["foodcan"] = {
		"food_water",
		"food_water_mountain",
		"food_beans",
		"food_instant_potatoes",
		"food_canned_1",
		"food_tuna",
		"food_mre",
		"food_asparagus",
		"food_chicken",
		"food_chili",
		"food_corn",
		"food_mushrooms",
		"food_peaches",
		"food_pears",
		"food_peas",
		"food_ravioli",
		"food_sausage",
		"food_chickennoodle",
		"food_chowder",
		"food_spam",
		"food_tomatoes",
		"food_yams",
	},
	["junkgarbage"] = {
		"j_bananaskin",
		"j_cereal_box",
		"j_empty_antidepressants",
		"j_empty_bandage",
		"j_empty_beer",
		"j_empty_beer2",
		"j_empty_bleach",
		"j_empty_soda_can",
		"j_empty_soda2",
		"j_empty_soda1",
		"j_plastic_bag",
		"j_empty_chocolate_box",
		"j_used_first_aid_kit",
		"j_empty_juice_bottle",
		"j_empty_milk_carton",
		"j_empty_milk_jug",
		"j_empty_mountain_spring",
		"j_empty_mre",
		"j_empty_soda_bottle",
		"j_empty_takeout",
		"j_empty_vegetable_oil",
		"j_empty_vial",
		"j_empty_vodka",
		"j_empty_water",
		"j_empty_water_blood",
		"j_empty_whiskey",
		"j_empty_wine",
	},
	["junkcar"] = {
		"j_car_axel",
		"j_car_door",
		"j_car_muffler",
		"j_car_engine",
		"ybattery_large",
		"j_tire",
	},
	["flares"] = {
		"nut_flare_b",
		"nut_flare",
		"nut_flare_g",
		"nut_flare_o",
		"nut_flare_p",
		"nut_flare_w",
		"nut_flare_y",
	},
	["beacons"] = {
		"nut_beacon_b",
		"nut_beacon",
		"nut_beacon_g",
		"nut_beacon_o",
		"nut_beacon_p",
		"nut_beacon_r",
		"nut_beacon_w",
		"nut_beacon_y",
	},
	["grenades"] = {
		"nut_flashgrenade",
		"nut_smokegrenade",
		"nut_teargas",
		"molotov",
	},
	["grenades_mixed"] = {
		"nut_flashgrenade",
		"nut_smokegrenade",
		"nut_teargas",
		"molotov",
		"nut_beacon_b",
		"nut_beacon",
		"nut_beacon_g",
		"nut_beacon_o",
		"nut_beacon_p",
		"nut_beacon_r",
		"nut_beacon_w",
		"nut_beacon_y",	
		"nut_flare_b",
		"nut_flare",
		"nut_flare_g",
		"nut_flare_o",
		"nut_flare_p",
		"nut_flare_w",
		"nut_flare_y",		
		"weapon_glowstick_ylw",		
		"weapon_glowstick_blu",		
		"weapon_glowstick_lblu",		
		"weapon_glowstick_rng",		
		"weapon_glowstick_pnk",		
		"weapon_glowstick_red",		
		"weapon_glowstick_wht",			
		"weapon_glowstick",		
	},
	["corpse"] = {
		"j_skull",
		"j_spine",
		"j_scapula",
		"j_rib",
	},
	["junkobj"] = {
		"j_baby_doll",
		"j_blanket",
		"j_bucket",
		"j_cactus_plant",
		"j_cinder_block",
		"j_fire_extinguisher",
		"j_gear",
		"j_hula",
		"j_life_preserver",
		"j_meat_grinder",
		"j_computer_mouse",
		"j_paint_can",
		"j_empty_paint_can",
		"j_painting1",
		"j_pickaxe_head",
		"j_picture_1",
		"j_picture_2",
		"j_picture_3",
		"j_picture_4",
		"j_picture_5",
		"j_pillow",
		"j_pliers",
		"j_old_rag",
		"j_riotshield",
		"j_power_saw",
		"j_old_shoe",
		"j_soccerball",
		"j_telephone",
		"j_empty_soda_can",
		"j_empty_soda1",
		"j_empty_soda2",
		"j_tinc",
		"j_tbrushes",
		"j_traffic_cone",
		"j_traffic_light",
		"j_tshirts",
		"j_stuffed_turtle",
		"j_broken_tv",
		"j_empty_gas_can",
		"j_dollar",
		"j_holster",
		"j_empty_mug",
		"j_empty_teapot",
		"j_family_picture",
		"j_paper_towels",
		"j_broken_receiver",
		"j_remote_control",
		"j_newspaper",
		"j_newspaper_stack",
		"j_map",
		"j_mounted_fish",
		"j_pan",
		"j_scrap_light",
		"j_scrap_screws",
		"j_scrap_elecs",
		"j_scrap_elastic",
		"j_scrap_concrete",
		"j_scrap_chems",
		"j_scrap_adhesive",
		"j_bananaskin",
		"j_cereal_box",
		"j_empty_antidepressants",
		"j_empty_bandage",
		"j_empty_beer",
		"j_empty_beer2",
		"j_empty_bleach",
		"j_empty_soda_can",
		"j_empty_soda2",
		"j_empty_soda1",
		"j_plastic_bag",
		"j_empty_chocolate_box",
		"j_used_first_aid_kit",
		"j_empty_juice_bottle",
		"j_empty_milk_carton",
		"j_empty_milk_jug",
		"j_empty_mountain_spring",
		"j_empty_mre",
		"j_empty_soda_bottle",
		"j_empty_takeout",
		"j_empty_vegetable_oil",
		"j_empty_vial",
		"j_empty_vodka",
		"j_empty_water",
		"j_empty_water_blood",
		"j_empty_whiskey",
		"j_empty_wine",
	},
	["components"] = {
		"comp_barrel",
		"comp_body",
		"comp_stock",
	},
	["medical"] = {
		"medical_splint",
		"medical_kit",
		"medical_bandages",
		"medical_gauze",
	}
}

PLUGIN.spawnrate = 20
PLUGIN.maxBoxes = 10
PLUGIN.itemsperspawn = 1
PLUGIN.maxItems = 4
PLUGIN.spawnedBoxes = PLUGIN.spawnedBoxes or {}


for k, v in pairs(PLUGIN.definitions) do
	if (v.name and v.width and v.height) then
		nut.item.registerInv("st"..v.name, v.width, v.height)
	else
		ErrorNoHalt("[NutScript] Storage for '"..k.."' is missing all inventory information!\n")
		PLUGIN.definitions[k] = nil
	end
end

if SERVER then
	--possible models for storage objects
	local models = {
		"models/props_junk/wood_crate001a.mdl",
		"models/items/item_item_crate.mdl",
		"models/props_junk/wood_crate001a_damaged.mdl",
		"models/props_junk/wood_crate002a.mdl",
		"models/props_junk/cardboard_box001a.mdl",
		"models/props_junk/cardboard_box002b.mdl",
		"models/props_junk/cardboard_box003a.mdl",
		"models/props_junk/cardboard_box003b.mdl",
		"models/props_junk/cardboard_box004a.mdl",
		"models/props/cs_assault/washer_box.mdl",
		"models/props/cs_assault/washer_box2.mdl",
		"models/props/cs_assault/dryer_box.mdl",
		"models/props/cs_assault/dryer_box2.mdl",
		"models/props_lab/filecabinet02.mdl",
		"models/props_wasteland/controlroom_filecabinet001a.mdl",
		"models/props_junk/cardboard_box002a.mdl",
		"models/props_junk/cardboard_box001b.mdl",
		"models/props/cs_office/cardboard_box01.mdl",
		"models/props/cs_office/cardboard_box03.mdl",
		"models/props/cs_office/cardboard_box02.mdl",
		"models/props_c17/furnituredrawer002a.mdl",
		"models/props_c17/furnituredresser001a.mdl",
		"models/props/cs_militia/refrigerator01.mdl",
		"models/props_c17/furniturefridge001a.mdl",
		"models/props_c17/furniturewashingmachine001a.mdl",
		"models/props/cs_militia/dryer.mdl",
		"models/props_interiors/furniture_vanity01a.mdl",
		"models/props_interiors/furniture_desk01a.mdl",
		"models/props_c17/furnituredrawer003a.mdl",
		"models/props_c17/lockers001a.mdl",
		"models/props_c17/oildrum001.mdl",
		"models/props_wasteland/controlroom_storagecloset001a.mdl",
		"models/props_wasteland/controlroom_storagecloset001b.mdl",
		"models/props/cs_office/file_cabinet1_group.mdl",
		"models/props/cs_office/file_cabinet2.mdl",
		"models/props/cs_office/file_cabinet3.mdl",
		"models/props/cs_office/file_cabinet1.mdl",
		"models/props_wasteland/controlroom_filecabinet002a.mdl",
		"models/props_lab/partsbin01.mdl",
		"models/props_junk/trashbin01a.mdl",
		"models/props_junk/trashdumpster01a.mdl",
		"models/props/cs_militia/footlocker01_closed.mdl"
	}
	
	--[[
	function PLUGIN:ItemShouldSave(entity)
		return (!entity.generated)
	end
	--]]
	
	--spawns a single npc
	local function spawnNPC()
		local v = table.Random(PLUGIN.boxPoints)
	
		if (!v) then
			return
		end
	
		local data = {}
		data.start = v[1]
		data.endpos = data.start + Vector(0, 0, 1)
		data.filter = client
		data.mins = Vector(-16, -16, 0)
		data.maxs = Vector(16, 16, 16)
	
		local ent = ents.Create("amputated")
				
		if (ent:IsValid()) then
			ent:SetPos(data.endpos + Vector(0,0,25))
			ent:Spawn()
		end
	end
	
	--spawns a single storage object
	local function spawnStorage()
		local model = table.Random(models)
				
		local storInf = nut.plugin.list["storage"].definitions[model:lower()]
				
		local v = table.Random(PLUGIN.boxPoints)

		if (!v) then
			return
		end
			
		local data = {}
		data.start = v[1]
		data.endpos = data.start + Vector(0, 0, 1)
		data.filter = client
		data.mins = Vector(-16, -16, 0)
		data.maxs = Vector(16, 16, 16)
			
		if(storInf) then --spawns a storage entity to put items in						
			local storage = ents.Create("nut_storage")
			storage:SetPos(data.endpos + Vector(0,0,25)) --this tries to make sure it doesnt get stuck in the ground
			storage:SetAngles(AngleRand()) --random angles
			storage:Spawn()
			storage:SetModel(model)
			storage:SetSolid(SOLID_VPHYSICS)
			storage:PhysicsInit(SOLID_VPHYSICS)
			storage:PhysWake()
			storage:SetMoveType(MOVETYPE_VPHYSICS)
					
			if (IsValid(physObj)) then
				physObj:EnableMotion(true)
				physObj:EnableGravity(true)
			end
					
			table.insert(PLUGIN.spawnedBoxes, storage)
					
			local loot = {}
			for i = 1, math.random(1, PLUGIN.maxItems) do
						
				lootItem = table.Random(PLUGIN.spawngroups[v[2]])
						
				table.insert(loot, lootItem) --makes a table of all the loot we're going to put into the ent
			end
					
			nut.item.newInv(0, "st"..storInf.name, function(inventory) --creates the actual inventory.
				inventory.vars.isStorage = true
						
				for k, spawnItem in pairs(loot) do
					timer.Simple(k, --this timer makes everything go into the storage 1 second at a time, prevents overlapping in certain cases.
						function()
							inventory:add(spawnItem)
						end
					)
				end

				if (IsValid(storage)) then --connects the storage and the inventory
					storage:setInventory(inventory)
				end
			end)
		end
	end

	
	local spawntime = 1
	function PLUGIN:Think()
		if spawntime > CurTime() then return end
		spawntime = CurTime() + self.spawnrate
		for k, v in ipairs(self.spawnedBoxes) do
			if (!v:IsValid()) then
				table.remove(self.spawnedBoxes, k)
			else
				table.remove(self.spawnedBoxes, k)
				v:Remove()
			end
		end

		if #self.spawnedBoxes >= self.maxBoxes then return end

		for i = 1, self.itemsperspawn do
			if #self.spawnedBoxes >= self.maxBoxes then

				return
			end
			
			for i = 1, self.maxBoxes do
				spawnStorage()
				spawnNPC()
			end
		
			
		end
	end

	function PLUGIN:LoadData()
		self.boxPoints = self:getData() or {}
	end

	function PLUGIN:SaveData()
		self:setData(self.boxPoints)
	end

else

	netstream.Hook("nut_DisplaySpawnPoints", function(data)
		for k, v in pairs(data) do
			local emitter = ParticleEmitter( v[1] )
			local smoke = emitter:Add( "sprites/glow04_noz", v[1] )
			smoke:SetVelocity( Vector( 0, 0, 1 ) )
			smoke:SetDieTime(10)
			smoke:SetStartAlpha(255)
			smoke:SetEndAlpha(255)
			smoke:SetStartSize(64)
			smoke:SetEndSize(64)
			smoke:SetColor(255,186,50)
			smoke:SetAirResistance(300)
		end
	end)

end

--most of these commands are just edits of the ones for the worlditemspawner plugin.
nut.command.add("lootspawnadd", {
	adminOnly = true,
	syntax = "<string itemgroup>",
	onRun = function(client, arguments)
		local trace = client:GetEyeTraceNoCursor()
		local hitpos = trace.HitPos + trace.HitNormal*5
		local spawngroup = arguments[1] or "default"
		table.insert( PLUGIN.boxPoints, { hitpos, spawngroup } )
		client:notify( "You added ".. spawngroup .. " container spawner." )
	end
})

nut.command.add("lootspawnremove", {
	adminOnly = true,
	onRun = function(client, arguments)
		local trace = client:GetEyeTraceNoCursor()
		local hitpos = trace.HitPos + trace.HitNormal*5
		local range = arguments[1] or 128
		local mt = 0
		for k, v in pairs( PLUGIN.boxPoints ) do
			local distance = v[1]:Distance( hitpos )
			if distance <= tonumber(range) then
				PLUGIN.boxPoints[k] = nil
				mt = mt + 1
			end
		end
		client:notify( mt .. " loot spawners has been removed.")
	end
})

nut.command.add("lootspawndisplay", {
	adminOnly = true,
	onRun = function(client, arguments)
		if SERVER then
			netstream.Start(client, "nut_DisplaySpawnPoints", PLUGIN.boxPoints)
			client:notify( "Displayed All Points for 10 secs." )
		end
	end
})