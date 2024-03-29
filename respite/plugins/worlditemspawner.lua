local PLUGIN = PLUGIN
PLUGIN.name = "World Item Spawner"
PLUGIN.author = "Black Tea (NS 1.0), Neon (NS 1.1)"
PLUGIN.desc = "World Item Spawner."
PLUGIN.itempoints = PLUGIN.itempoints or {}

nut.config.add("item_spawnrate", 120, "How often a new item will be spawned at an item spawn point.", nil, {
	data = {min = 1, max = 84600},
	category = "Scavenging"
})

PLUGIN.spawngroups = {
	["default"] = {
		"food_banana",
	},
	["food"] = {
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
		"food_cookies",
		"food_chocolate",
		"food_egg",
		"food_fish",
		"food_fish2",
		"food_milk_carton",
		"food_milk_jug",
		"food_coffee",
		"food_popcorn",
		"food_pickles",
		"food_tea",
		"food_ice_cream",
		"food_mre",
		"food_orange",
		"food_potato",
		"food_pumpkin",
		"food_soda_blueberry",
		"food_soda_cherry",
		"food_lemon_soda",
		"food_melon",
		"food_apple",
		"food_banana",
		"food_eggnog",
		"food_eggplant",
		"food_donut",
		"food_candybar",
		"food_cheese",
		"food_coconut",
		"food_jam",
	},
	["foodplastic"] = {
		"food_fish_plastic",
		"food_fish2_plastic",
		"food_orange_plastic",
		"food_apple_plastic",
		"food_banana_plastic",
		"food_lemon_plastic",
		"food_onion_plastic",
		"food_potato_plastic",
		"food_melon_plastic",
		"food_pumpkin_plastic",
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
		"food_bread_box",
		"food_jam",
	},
	["fooddrink"] = {
		"food_water",
		"food_water_mountain",
		"food_soda_cola",
		"food_soda_cold",
		"food_soda_depress",
		"food_soda_antidepress",
		"food_soda_blueberry",
		"food_soda_cherry",
		"food_apple_soda",
		"food_banana_soda",
		"food_lemon_soda",
		"food_melon_soda",
		"food_onion_soda",
		"food_pickle_soda",
		"food_potato_soda",
		"food_pumpkin_soda",
		"food_cactus_soda",
		"food_apple_juice",
		"food_banana_juice",
		"food_lemon_juice",
		"food_melon_juice",
		"food_onion_juice",
		"food_pickle_juice",
		"food_potato_juice",
		"food_pumpkin_juice",
		"food_cactus_juice",
		"food_eggnog",
		"food_tea",
	},
	["alcohol"] = {
		"alc_beer",
		"alc_bourbon",
		"alc_midori",
		"alc_moonshine",
		"alc_rum",
		"alc_tequila",
		"alc_vodka",
		"alc_whiskey",
		"alc_wine",
	},
	["potion"] = {
		"potion_accuracy",
		"potion_agility",
		"potion_strength",
		"potion_craftiness",
		"potion_luck",
		"potion_fortitude",
		"potion_perception",
		"potion_endurance",
		"salve_healing",
	},
	["junkgarbage"] = {
		"j_bananaskin",
		--"j_cereal_box",
		"j_empty_pill",
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
		"j_car_battery",
		"j_tire",
	},
	["flare"] = {
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
	["medical"] = {
		"medical_bandages",
		"medical_gauze",
		"medical_iv",
		"medicine_cold",
		"medical_memory",
		"medical_plastic",
		"medical_splint",
		"medical_suture",
	},
	["drug"] = {
		"drug_antibiotics",
		"drug_antidepressants",
		"drug_antipsychotics",
		"drug_antivenom",
		"bottled_purple",
		"drug_burn_ointment",
		"drug_depress",
		"drug_disinfectant",
		"drug_energy",
		"drug_nightmare",
		"drug_painkillers",
		"drug_pain",
		"drug_placebo",
		"drug_poison",
		"drug_psychotics",
		"drug_rubbingalcohol",
		"drug_sleepingpills",
		"drug_steroid",
		"drug_venom",
		"voltaic",
	},
	["corpse"] = {
		"food_human_arm1",
		"food_human_arm2",
		"food_human_arms",
		"food_human_foot",
		"food_human_hand",
		"food_human_meat",
		"food_human_leg1",
		"food_human_leg2",
		"food_human_legs",
		"food_human_pelvis",
		"food_human_torso1",
		"food_human_torso2",
		"food_human_torso3",
		"food_brain",
		"food_eye",
		"food_heart",
		"food_lung",
		"food_liver",
		"j_skull",
		"j_spine",
		"j_scapula",
		"j_rib",
	},
	["corpseplastic"] = {
		"j_scrap_plastics",
		"j_scrap_plastics",
		"j_scrap_plastics",
		"j_scrap_plastics",
		"j_plastic_slice",
		"j_plastic_slice",
		"plastic_core",
		"j_plastic_leg",
		"j_plastic_pelvis",
		"j_plastic_torso1",
		"j_plastic_torso2",
		"j_plastic_torso3",
		"hl2_m_plastic_arm",
	},
	["junkobj"] = {
		"j_baby_doll",
		"j_blanket",
		"j_bucket",
		"j_cactus_plant",
		"j_cigs",
		"j_cinder_block",
		"j_drill",
		"j_fire_extinguisher",
		"j_gear",
		"j_glasses",
		"j_goggles",
		"j_goggles2",
		"j_guitar",
		"j_headphones",
		"j_hula",
		"j_industrial_fan",
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
		"j_power_saw",
		"j_old_shoe",
		"j_soccerball",
		"j_syringe",
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
		"j_wall_light",
		"j_scrap_light",
		"j_scrap_nails",
		"j_scrap_cloth",
		"j_scrap_rubber",
		"j_scrap_glass",
		"j_scrap_metals",
		"j_scrap_wood",
		"j_scrap_plastics",
		"j_scrap_elecs",
		"j_scrap_elastic",
		"j_scrap_concrete",
		"j_scrap_adhesive",
		"j_scrap_battery",
		"cube_chip",
		"hl2_m_pot",
		"hl2_m_brokenbottle",
		--"hl2_m_claypot",
		"melee_paddle",
		"melee_fireaxe",
		"hl2_m_fencepost",
		"hl2_m_hhradio",
		"hl2_m_keyboard",
		"hl2_m_steeringwheel",
		"melee_pitchfork",
		"hl2_m_stick",
		"hl2_m_branch",
		"hl2_m_valve",
		--"hl2_m_weirdvase",
		"hl2_m_woodensign",
		"hl2_m_wrench",
		"hl2_m_hammer",
		"hl2_m_pole",
		"hl2_m_bat",
		"hl2_m_bat_metal",
		"j_cards",
		"j_baseball_cap",
		"j_military_cap",
		"j_binoculars",
		"helmet_hard",
		"helmet_fire",
		"j_beanie",
		"j_gloves",
		"armor_football",
		"plastic_core",
		"coin_10"
	},
	["resource"] = {
		"j_scrap_cloth",
		"j_scrap_metals",
		"j_scrap_elecs",
		"j_scrap_plastics",
		"j_scrap_wood",
		"j_scrap_adhesive",
		"j_scrap_rubber",
		"j_scrap_organic",
		"j_scrap_elastic",
		"j_scrap_chems",
		"j_scrap_battery",
		"j_scrap_copper",
		"j_scrap_iron",
		"j_scrap_concrete",
		"j_scrap_glass",
		"j_scrap_nails",
		"j_scrap_screws",
	},
	["ammo"] = {
		"ammo_12g",
		"ammo_22lr",
		"ammo_40sw",
		"ammo_44",
		"ammo_45",
		"ammo_500",
		"ammo_50ae",
		"ammo_50bmg",
		"ammo_338",
		"ammo_357",
		"ammo_408",
		"ammo_500",
		"ammo_919",
		"ammo_939",
		"ammo_3006",
		"ammo_4570",
		"ammo_5728",
		"ammo_54539",
		"ammo_55639",
		"ammo_55645",
		"ammo_76239",
		"ammo_76251",
		"ammo_76254",
		"ammo_concrete",
		"ammo_xbow",
	},
}

PLUGIN.maxitems = 500
PLUGIN.itemsperspawn = 1
PLUGIN.spawneditems = PLUGIN.spawneditems or {}

if SERVER then
	local spawntime = 1

	function PLUGIN:ItemShouldSave(entity)
		return (!entity.generated)
	end

	function PLUGIN:Think()
		if spawntime > CurTime() then return end
		spawntime = CurTime() + nut.config.get("item_spawnrate", 60)
		for k, v in ipairs(self.spawneditems) do
			if (!v:IsValid()) then
				table.remove(self.spawneditems, k)
			end
		end

		if #self.spawneditems >= self.maxitems then return end

		for i = 1, self.itemsperspawn do
			if #self.spawneditems >= self.maxitems then

				return
			end

			local v = self.itempoints[math.random(#self.itempoints)]

			if (!v) then
				return
			end

			local data = {}
			data.start = v[1]
			data.endpos = data.start + Vector(0, 0, 1)
			data.filter = client
			data.mins = Vector(-16, -16, 0)
			data.maxs = Vector(16, 16, 16)
			local trace = util.TraceHull(data)
			
			if trace.Entity:IsValid() then
				continue
			end
			
			local nearby = false 
			local players = player.GetAll()
			
			--dont want to spawn them in too close to players
			if(players) then
				for k, v in pairs(players) do
					if(v:GetMoveType() == MOVETYPE_NOCLIP) then
						continue
					end
				
					if v:GetPos():DistToSqr(data.endpos) < 1000 * 1000 then --squared is more efficient
						nearby = true
						break
					end
				end
			end

			if(nearby) then
				continue
			end

			if(self.spawngroups[v[2]]) then
				local idat
			
				if(self.spawngroups[v[2]]) then
					idat = self.spawngroups[v[2]][math.random(#self.spawngroups[v[2]])]--table.Random(self.spawngroups[v[2]]) or self.spawngroup["default"]
				else
					idat = self.spawngroups["default"][math.random(#self.spawngroups)]
				end
				
				nut.item.spawn(idat, v[1] + Vector( math.Rand(-8,8), math.Rand(-8,8), 20 ),
					function(item, entity)
						self.spawneditems[#self.spawneditems + 1] = entity
					end,
					AngleRand()
				)
			end
		end
	end

	function PLUGIN:LoadData()
		self.itempoints = self:getData() or {}
	end

	function PLUGIN:SaveData()
		self:setData(self.itempoints)
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

local function GetWeightedRandomKey(items)
	local sum = 0
	
	for item, rarity in pairs(items) do
		sum = sum + (rarity or 10)
	end

	local select = math.random() * sum

	for item, rarity in pairs(items) do
		select = select - (rarity or 10)
		if select < 0 then 
			return item
		end
	end
end

function PLUGIN:generateItemFromGroup(group)
	return GetWeightedRandomKey(group)
end

nut.command.add("itemspawnadd", {
	adminOnly = true,
	syntax = "<string itemgroup>",
	onRun = function(client, arguments)
		local trace = client:GetEyeTraceNoCursor()
		local hitpos = trace.HitPos + trace.HitNormal*5
		local spawngroup = arguments[1] or "default"
		if(PLUGIN.spawngroups[spawngroup]) then
			table.insert(PLUGIN.itempoints, {hitpos, spawngroup})
			client:notify("You added ".. spawngroup .. " item spawner.")
		else
			client:notify("Invalid spawn group")
		end
	end
})

nut.command.add("itemspawnremove", {
	adminOnly = true,
	onRun = function(client, arguments)
		local trace = client:GetEyeTraceNoCursor()
		local hitpos = trace.HitPos + trace.HitNormal*5
		local range = arguments[1] or 128
		local mt = 0
		for k, v in pairs( PLUGIN.itempoints ) do
			local distance = v[1]:Distance(hitpos)
			if distance <= tonumber(range) then
				PLUGIN.itempoints[k] = nil
				mt = mt + 1
			end
		end
		client:notify( mt .. " item spawners has been removed.")
	end
})

nut.command.add("itemspawndisplay", {
	adminOnly = true,
	onRun = function(client, arguments)
		if SERVER then
			netstream.Start(client, "nut_DisplaySpawnPoints", PLUGIN.itempoints)
			client:notify( "Displayed All Points for 10 secs." )
		end
	end
})

nut.command.add("spawnitemgroup", {
	adminOnly = true,
	syntax = "<string itemgroup> <number amount>",
	onRun = function(client, arguments)
		local groupID = arguments[1] or "default"
		local amount = math.min(tonumber(arguments[2]) or 1, 10)
		
		local spawnGroup = PLUGIN.spawngroups[groupID]
		if(spawnGroup) then
			local aimPos = client:GetEyeTraceNoCursor().HitPos
			aimPos:Add(Vector(0, 0, 10))  
		
			for i = 1, amount do
				local uniqueID = table.Random(spawnGroup)
			
				if (!nut.item.list[uniqueID]) then
					client:notify("Invalid item " ..uniqueID.. " in item group.")
					return false
				end

				if(nut.item.list[uniqueID]) then
					nut.item.spawn(uniqueID, aimPos)
				else
					client:notify("Invalid Item " ..uniqueID.. ".")
				end
			end
			
			client:notify("Spawned " ..amount.. " items from the " ..groupID.. " group.")
		else
			client:notify("Invalid spawn group")
		end
	end
})

nut.command.add("spawnitemgrouptest", {
	adminOnly = true,
	syntax = "<string itemgroup> <number amount>",
	onRun = function(client, arguments)
		local groupID = arguments[1] or "default"
		local amount = math.min(tonumber(arguments[2]) or 1, 10)
		
		local spawnGroup = {}
		
		for k, item in pairs(nut.item.list) do
			if(item.loot and item.loot[groupID]) then
				spawnGroup[k] = item.loot[groupID]
			end
		end
		
		if(spawnGroup) then
			local aimPos = client:GetEyeTraceNoCursor().HitPos
			aimPos:Add(Vector(0, 0, 10))  
		
			for i = 1, amount do
				local uniqueID = PLUGIN:generateItemFromGroup(spawnGroup)
			
				if (!nut.item.list[uniqueID]) then
					client:notify("Invalid item " ..uniqueID.. " in item group.")
					return false
				end

				if(nut.item.list[uniqueID]) then
					nut.item.spawn(uniqueID, aimPos)
				else
					client:notify("Invalid Item " ..uniqueID.. ".")
				end
			end
			
			client:notify("Spawned " ..amount.. " items from the " ..groupID.. " group.")
		else
			client:notify("Invalid spawn group")
		end
	end
})