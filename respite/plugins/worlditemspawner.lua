local PLUGIN = PLUGIN
PLUGIN.name = "World Item Spawner"
PLUGIN.author = "Black Tea (NS 1.0), Neon (NS 1.1)"
PLUGIN.desc = "World Item Spawner."
PLUGIN.itempoints = PLUGIN.itempoints or {}

nut.config.add("item_spawnrate", 120, "How often a new item will be spawned at an item spawn point.", nil, {
	data = {min = 1, max = 84600},
	category = "Scavenging"
})

PLUGIN.spawngroups = { -- Example is based on HL2RP items.
	["default"] = {
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
		"food_soda_lemon",
		"food_melon",
		"food_apple",
		"food_banana",
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
	},
	["junkgarbage"] = {
		"j_bananaskin",
		"j_cereal_box",
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
		"hl2_m_claypot",
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
		"hl2_m_weirdvase",
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
	}
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