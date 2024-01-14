local PLUGIN = PLUGIN

local function spawnNPC(npc, client, position, data)
	local entity = ents.Create(npc)
	
	if (IsValid(entity)) then
		local collisionSide = entity.CollisionSide
		local collisionHeight = entity.CollisionHeight
		
		if(collisionSide and collisionHeight) then
			local mins = Vector(-collisionSide, -collisionSide, 0)
			local maxs = Vector(collisionSide, collisionSide, collisionHeight)

			local data = {}
				data.start = position --position value
				data.endpos = position + Vector(0, 0, 1)
				data.filter = {entity}
				data.mins = mins
				data.maxs = maxs
			local trace = util.TraceHull(data)

			if(IsValid(trace.Entity) or trace.HitWorld or !util.IsInWorld(position)) then
				SafeRemoveEntity(entity)
				return false
			end
		end
	
		entity:SetPos(position)
		entity:Spawn()
		entity:SetOwner(client)
		
		entity.ghostSpawner = client
		entity.ghostData = data
		
		return true
	end
end

local function spawnVehicle(vehicle, client, position, data)
	local entity = simfphys.SpawnVehicleSimple(vehicle, position, Angle(0,0,0))
	
	if (IsValid(entity)) then
		entity:SetColor(Color(255,0,0))
		entity.ghostSpawner = client
		entity.ghostData = data
		entity:SetOwner(client)
		
		return true
	end
end

local function spawnItem(uniqueID, client, position, data, amount, itemData)
	if (!nut.item.list[uniqueID]) then
		for k, v in SortedPairs(nut.item.list) do
			if (nut.util.stringMatches(v.name, uniqueID)) then
				uniqueID = k

				break
			end
		end
	end

	if(nut.item.list[uniqueID]) then
		position:Add(Vector(0, 0, 10))
	
		for i = 1, (amount or 1) do
			nut.item.spawn(uniqueID, position, function(item, entity)
				if(itemData) then
					for k, v in pairs(itemData) do
						item:setData(k, v)
					end
				end
				
				if(IsValid(entity)) then
					entity.ghostSpawner = client
					entity.ghostData = data
				end
			end)
		end
	end
	
	return true
end

local function refundEntity(client, entity, data)
	if(!IsValid(entity)) then
		client:notify("Invalid target.")
		return true
	end

	if(entity.ghostSpawner and entity.ghostSpawner == client) then
		local ghostData = entity.ghostData
		if(ghostData and ghostData.cost) then
			local cost = entity.ghostData.cost

			local refundPoints = cost * 0.5
		
			local weapon = client:GetWeapon("nut_ghostswep")
			
			if(IsValid(weapon)) then
				local curPoints = weapon:getNetVar("points", 0)
				weapon:setNetVar("points", curPoints + refundPoints)
				
				if(ghostData.name) then
					weapon.cdTbl[ghostData.name] = nil
				end
			end
			
			client:notify("Entity refunded for " ..refundPoints.. " points.")
		end
		
		SafeRemoveEntity(entity)
		return true
	else
		client:notify("You cannot refund that.")
		return true
	end
end

PLUGIN.actions = {
	--abominations
	{
		name = "Paper Zombie",
		desc = "Spawn a Paper Zombie",
		model = "models/respite/paperzombie.mdl",
		category = "Monsters - Abomination",
		cost = 5,
		CD = 1,
		useFunction = function(client, position, data) --serverside only
			return spawnNPC("resp_paperzombie", client, position, data)
		end
	},
	{
		name = "Waste",
		desc = "Spawn a Waste",
		model = "models/prosperity/freak.mdl",
		category = "Monsters - Abomination",
		cost = 10,
		CD = 1,
		useFunction = function(client, position, data) --serverside only
			return spawnNPC("nz_freak", client, position, data)
		end
	},
	{
		name = "Smog",
		desc = "Spawn a Smog",
		model = "models/sient hill custom/Homecoming/smog.mdl",
		category = "Monsters - Abomination",
		cost = 15,
		CD = 5,
		useFunction = function(client, position, data)
			return spawnNPC("resp_smog", client, position, data)
		end
	},
	{
		name = "Amputated",
		desc = "Spawn an Amputated",
		model = "models/am_npc/amputated.mdl",
		category = "Monsters - Abomination",
		cost = 15,
		CD = 5,
		useFunction = function(client, position, data)
			return spawnNPC("amputated", client, position, data)
		end
	},
	{
		name = "Lying Figure",
		desc = "Spawn a Lying Figure",
		model = "models/chillax_sf2/silenthill/sh2/lying_figure/lying_figure.mdl",
		category = "Monsters - Abomination",
		cost = 20,
		CD = 5,
		useFunction = function(client, position, data)
			return spawnNPC("resp_lyingfigure", client, position, data)
		end
	},
	{
		name = "Vomit",
		desc = "Spawn a Vomit",
		model = "models/zombie/zombie_vomit.mdl",
		category = "Monsters - Abomination",
		cost = 35,
		CD = 5,
		useFunction = function(client, position, data)
			return spawnNPC("resp_vomit", client, position, data)
		end
	},
	{
		name = "Pack",
		desc = "Spawn a Pack",
		model = "models/spite/pack.mdl",
		category = "Monsters - Abomination",
		cost = 20,
		CD = 5,
		useFunction = function(client, position, data)
			return spawnNPC("pack", client, position, data)
		end
	},
	{
		name = "Dog",
		desc = "Spawn a Dog",
		model = "models/zombie/dog.mdl",
		category = "Monsters - Abomination",
		cost = 25,
		CD = 5,
		useFunction = function(client, position, data)
			return spawnNPC("nz_dog", client, position, data)
		end
	},
	{
		name = "Hunter",
		desc = "Spawn a Hunter",
		model = "models/sin/leperkin.mdl",
		category = "Monsters - Abomination",
		cost = 45,
		CD = 10,
		useFunction = function(client, position, data)
			return spawnNPC("nz_leperkin", client, position, data)
		end
	},
	{
		name = "Chimera",
		desc = "Spawn a Chimera",
		model = "models/ninja/signalvariance/monsters/chimera.mdl",
		category = "Monsters - Abomination",
		cost = 45,
		CD = 15,
		useFunction = function(client, position, data)
			return spawnNPC("resp_chimera", client, position, data)
		end
	},
	{
		name = "Static",
		desc = "Spawn a Static",
		model = "models/nh2zombies/friendly.mdl",
		category = "Monsters - Abomination",
		cost = 50,
		CD = 10,
		useFunction = function(client, position, data)
			return spawnNPC("nz_static", client, position, data)
		end
	},
	{
		name = "Faceless",
		desc = "Spawn a Faceless",
		model = "models/cryoffear/faceless/faceless3.mdl",
		category = "Monsters - Abomination",
		cost = 30,
		CD = 10,
		useFunction = function(client, position, data)
			return spawnNPC("cof_faceless", client, position, data)
		end
	},
	{
		name = "Demon",
		desc = "Spawn a Demon",
		model = "models/nh2zombies/friendly.mdl",
		category = "Monsters - Abomination",
		cost = 40,
		CD = 15,
		useFunction = function(client, position, data)
			return spawnNPC("nz_demon", client, position, data)
		end
	},
	{
		name = "Thrower",
		desc = "Spawn a Thrower",
		model = "models/player/zombie_fast.mdl",
		category = "Monsters - Abomination",
		cost = 30,
		CD = 15,
		useFunction = function(client, position, data)
			return spawnNPC("nz_thrower", client, position, data)
		end
	},
	{
		name = "Torrent",
		desc = "Spawn a Torrent",
		model = "models/zombie/classic.mdl",
		category = "Monsters - Abomination",
		cost = 20,
		CD = 10,
		useFunction = function(client, position, data)
			return spawnNPC("resp_torrent", client, position, data)
		end
	},
	{
		name = "Babu",
		desc = "Spawn a Babu",
		model = "models/zombie/babu.mdl",
		category = "Monsters - Abomination",
		cost = 30,
		CD = 20,
		useFunction = function(client, position, data)
			return spawnNPC("resp_babu", client, position, data)
		end
	},
	{
		name = "Gemini",
		desc = "Spawn a Gemini",
		model = "models/zombie/gemini.mdl",
		category = "Monsters - Abomination",
		cost = 40,
		CD = 5,
		useFunction = function(client, position, data)
			return spawnNPC("resp_gemini", client, position, data)
		end
	},
	{
		name = "Skinless",
		desc = "Spawn a Skinless",
		model = "models/cryoffear/tenslower/tenslower.mdl",
		category = "Monsters - Abomination",
		cost = 30,
		CD = 20,
		useFunction = function(client, position, data)
			return spawnNPC("resp_skinless", client, position, data)
		end
	},
	{
		name = "Club",
		desc = "Spawn a Club",
		model = "models/cryoffear/mace/sewer_boss.mdl",
		category = "Monsters - Abomination",
		cost = 80,
		CD = 60,
		useFunction = function(client, position, data)
			return spawnNPC("resp_club", client, position, data)
		end
	},
	{
		name = "Drum",
		desc = "Spawn a Drum",
		model = "models/zombie/zombineplayer.mdl",
		category = "Monsters - Abomination",
		cost = 100,
		CD = 60,
		useFunction = function(client, position, data)
			return spawnNPC("nz_drum", client, position, data)
		end
	},
	{
		name = "Pendulum",
		desc = "Spawn a Pendulum",
		model = "models/sient hill custom/Homecoming/pendulum.mdl",
		category = "Monsters - Abomination",
		cost = 100,
		CD = 60,
		useFunction = function(client, position, data)
			return spawnNPC("resp_pendulum", client, position, data)
		end
	},
	{
		name = "Flayer",
		desc = "Spawn a Flayer",
		model = "models/cryoffear/sawrunner/sawrunner.mdl",
		category = "Monsters - Abomination",
		cost = 100,
		CD = 60,
		useFunction = function(client, position, data)
			return spawnNPC("resp_flayer", client, position, data)
		end
	},
	{
		name = "Leecher (Big)",
		desc = "Spawn a Leecher",
		model = "models/player/slow/amberlyn/re5/uroboro/slow_public.mdl",
		category = "Monsters - Abomination",
		cost = 150,
		CD = 60,
		useFunction = function(client, position, data)
			return spawnNPC("nz_leecher", client, position, data)
		end
	},
	{
		name = "Dollmother",
		desc = "Spawn a Dollmother",
		model = "models/spite/scarlet.mdl",
		category = "Monsters - Abomination",
		cost = 150,
		CD = 60,
		useFunction = function(client, position, data)
			return spawnNPC("scarlet", client, position, data)
		end
	},
	
	--shades
	{
		name = "Shambling Shade",
		desc = "Spawn a Shambling Shade",
		model = "models/freshdead/freshdead_01.mdl",
		category = "Monsters - Shade",
		cost = 5,
		CD = 3,
		useFunction = function(client, position, data)
			return spawnNPC("nz_undead_shade", client, position, data)
		end
	},
	{
		name = "Crawler",
		desc = "Spawn a Crawler",
		model = "models/angelsaur/ghost_girl.mdl",
		category = "Monsters - Shade",
		cost = 10,
		CD = 15,
		useFunction = function(client, position, data)
			return spawnNPC("shade_crawlsmoke", client, position, data)
		end
	},
	{
		name = "Stranger",
		desc = "Spawn a Stranger",
		model = "models/cryoffear/stranger/stranger.mdl",
		category = "Monsters - Shade",
		cost = 50,
		CD = 60,
		useFunction = function(client, position, data)
			return spawnNPC("resp_stranger", client, position, data)
		end
	},
	{
		name = "Paranoia",
		desc = "Spawn a Paranoia",
		model = "models/respite/wheelchair_model.mdl",
		category = "Monsters - Shade",
		cost = 50,
		CD = 60,
		useFunction = function(client, position, data)
			return spawnNPC("resp_paranoia", client, position, data)
		end
	},
	
	--wraiths
	{
		name = "Seeker",
		desc = "Spawn a Seeker",
		model = "models/predatorcz/amnesia/grunt.mdl",
		category = "Monsters - Wraith",
		cost = 40,
		CD = 20,
		useFunction = function(client, position, data)
			return spawnNPC("nz_wraith", client, position, data)
		end
	},
	{
		name = "Skinless (Wraith)",
		desc = "Spawn a Skinless (Wraith)",
		model = "models/cryoffear/tenslower/tenslower.mdl",
		category = "Monsters - Wraith",
		cost = 30,
		CD = 10,
		useFunction = function(client, position, data)
			return spawnNPC("resp_skinless_wraith", client, position, data)
		end
	},
	{
		name = "Belmer",
		desc = "Spawn a Belmer",
		model = "models/chillax_sf2/silenthill/sh2/mannequin/mannequin.mdl",
		category = "Monsters - Wraith",
		cost = 30,
		CD = 5,
		useFunction = function(client, position, data)
			return spawnNPC("resp_belmer", client, position, data)
		end
	},
	{
		name = "Creeper (Wraith)",
		desc = "Spawn a Creeper (Wraith)",
		model = "models/nh2zombies/creeper.mdl",
		category = "Monsters - Wraith",
		cost = 50,
		CD = 25,
		useFunction = function(client, position, data)
			return spawnNPC("nz_creeper_wraith", client, position, data)
		end
	},
	{
		name = "Haunt",
		desc = "Spawn a Haunt",
		model = "models/tnb/citizens/male_04.mdl",
		category = "Monsters - Wraith",
		cost = 10,
		CD = 5,
		useFunction = function(client, position, data)
			return spawnNPC("nz_haunt", client, position, data)
		end
	},
	{
		name = "Phantom",
		desc = "Spawn a Phantom",
		model = "models/zombie/junkie_01.mdl",
		category = "Monsters - Wraith",
		cost = 15,
		CD = 5,
		useFunction = function(client, position, data)
			return spawnNPC("nz_phantom", client, position, data)
		end
	},
	{
		name = "Red Horror",
		desc = "Spawn a Red Horror",
		model = "models/horror/zm_f4zt.mdl",
		category = "Monsters - Wraith",
		cost = 15,
		CD = 5,
		useFunction = function(client, position, data)
			return spawnNPC("nz_horror_red", client, position, data)
		end
	},
	{
		name = "Babu (Wraith)",
		desc = "Spawn a Babu (Wraith)",
		model = "models/zombie/babu.mdl",
		category = "Monsters - Wraith",
		cost = 40,
		CD = 15,
		useFunction = function(client, position, data)
			return spawnNPC("resp_babu_wraith", client, position, data)
		end
	},
	{
		name = "Saw",
		desc = "Spawn a Saw",
		model = "models/cryoffear/sawer/chainsawguy.mdl",
		category = "Monsters - Wraith",
		cost = 50,
		CD = 60,
		useFunction = function(client, position, data)
			return spawnNPC("resp_saw", client, position, data)
		end
	},
	{
		name = "Tripod",
		desc = "Spawn a Tripod",
		model = "models/hunter.mdl",
		category = "Monsters - Wraith",
		cost = 50,
		CD = 60,
		useFunction = function(client, position, data)
			return spawnNPC("resp_tripod", client, position, data)
		end
	},
	
	--husk
	{
		name = "Skin",
		desc = "Spawn a Skin",
		model = "models/player/group01/male_01.mdl",
		category = "Monsters - Husk",
		cost = 15,
		CD = 60,
		useFunction = function(client, position, data)
			return spawnNPC("resp_skin", client, position, data)
		end
	},
	{
		name = "Excited",
		desc = "Spawn an Excited",
		model = "models/player/group01/male_01.mdl",
		category = "Monsters - Husk",
		cost = 20,
		CD = 60,
		useFunction = function(client, position, data)
			return spawnNPC("resp_excited", client, position, data)
		end
	},
	{
		name = "Mirror",
		desc = "Spawn a Mirror",
		model = "models/player/group01/male_01.mdl",
		category = "Monsters - Husk",
		cost = 20,
		CD = 60,
		useFunction = function(client, position, data)
			return spawnNPC("resp_mirror", client, position, data)
		end
	},
	{
		name = "Twitch",
		desc = "Spawn a Twitch",
		model = "models/player/group01/male_01.mdl",
		category = "Monsters - Husk",
		cost = 25,
		CD = 60,
		useFunction = function(client, position, data)
			return spawnNPC("resp_twitch", client, position, data)
		end
	},
	{
		name = "Leaper",
		desc = "Spawn a Leaper",
		model = "models/player/group01/male_01.mdl",
		category = "Monsters - Husk",
		cost = 30,
		CD = 60,
		useFunction = function(client, position, data)
			return spawnNPC("resp_leaper", client, position, data)
		end
	},
	{
		name = "Hi",
		desc = "Spawn a Hi",
		model = "models/player/group01/male_01.mdl",
		category = "Monsters - Husk",
		cost = 60,
		CD = 60,
		useFunction = function(client, position, data)
			return spawnNPC("resp_hi", client, position, data)
		end
	},
	{
		name = "Angel",
		desc = "Spawn an Angel",
		model = "models/player/group01/male_01.mdl",
		category = "Monsters - Husk",
		cost = 70,
		CD = 60,
		useFunction = function(client, position, data)
			return spawnNPC("resp_angel", client, position, data)
		end
	},
	
	--nightmare
	{
		name = "Dreamless",
		desc = "Spawn a Dreamless",
		model = "models/player/group01/male_01.mdl",
		category = "Monsters - Nightmare",
		cost = 50,
		CD = 20,
		useFunction = function(client, position, data)
			return spawnNPC("resp_dreamless", client, position, data)
		end
	},
	{
		name = "Dreamless Torso",
		desc = "Spawn a Dreamless Torso",
		model = "models/zombie/classic_torso.mdl",
		category = "Monsters - Nightmare",
		cost = 70,
		CD = 20,
		useFunction = function(client, position, data)
			return spawnNPC("resp_torso_dreamless", client, position, data)
		end
	},
	{
		name = "Dreamless Splitter",
		desc = "Spawn a Dreamless Splitter",
		model = "models/player/zombie_fast.mdl",
		category = "Monsters - Nightmare",
		cost = 80,
		CD = 30,
		useFunction = function(client, position, data)
			return spawnNPC("resp_dreamless_splitter", client, position, data)
		end
	},
	
	--items
	{
		name = "Bandages",
		desc = "Spawns a Box of Bandages",
		category = "Items",
		cost = 15,
		CD = 15,
		useFunction = function(client, position, data)
			return spawnItem("medical_bandages", client, position, data)
		end
	},
	{
		name = "First Aid Kit",
		desc = "Spawns a First Aid Kit",
		category = "Items",
		cost = 30,
		CD = 30,
		useFunction = function(client, position, data)
			return spawnItem("medical_kit", client, position, data)
		end
	},
	{
		name = "Plastic Dust",
		desc = "Spawns some Plastic Dust",
		category = "Items",
		cost = 12,
		CD = 15,
		useFunction = function(client, position, data)
			return spawnItem("medical_plastic", client, position, data)
		end
	},
	{
		name = "Plastic Aid Kit",
		desc = "Spawns some Plastic Dust",
		category = "Items",
		cost = 25,
		CD = 60,
		useFunction = function(client, position, data)
			return spawnItem("first_aid_plastic", client, position, data)
		end
	},
	{
		name = "9x19mm Bullets",
		desc = "Spawn some 9x19mm bullets.",
		category = "Items",
		cost = 15,
		CD = 30,
		useFunction = function(client, position, data)
			local itemData = {ammo = math.random(1,6)}
		
			return spawnItem("ammo_919", client, position, data, 1, itemData)
		end
	},
	{
		name = "7.62x51mm Bullets",
		desc = "Spawn some 7.62x51mm bullets.",
		category = "Items",
		cost = 15,
		CD = 30,
		useFunction = function(client, position, data)
			local itemData = {ammo = math.random(1,6)}
		
			return spawnItem("ammo_76251", client, position, data, 1, itemData)
		end
	},
	{
		name = ".45 ACP Bullets",
		desc = "Spawn some .45 ACP bullets.",
		category = "Items",
		cost = 15,
		CD = 30,
		useFunction = function(client, position, data)
			local itemData = {ammo = math.random(1,6)}
		
			return spawnItem("ammo_45", client, position, data, 1, itemData)
		end
	},
	{
		name = "12 Gauge Shells",
		desc = "Spawn some 12 Gauge shells.",
		category = "Items",
		cost = 20,
		CD = 30,
		useFunction = function(client, position, data)
			local itemData = {ammo = math.random(1,3)}
		
			return spawnItem("ammo_12g", client, position, data, 1, itemData)
		end
	},
	{
		name = "Random Junk",
		desc = "Spawn a random junk item.",
		category = "Items",
		cost = 5,
		CD = 5,
		useFunction = function(client, position, data)
			local items = {
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
				"j_empty_mre",
				"j_empty_soda_bottle",
				"j_empty_takeout",
				"j_empty_vegetable_oil",
				"j_empty_vial",
				"j_empty_vodka",
				"j_empty_water",
				"j_empty_water_blood",
				"j_empty_whiskey",
				"j_baby_doll",
				"j_blanket",
				"j_bucket",
				"j_cactus_plant",
				"j_cigs",
				"j_cinder_block",
				"j_drill",
				"j_glasses",
				"j_goggles",
				"j_goggles2",
				"j_guitar",
				"j_headphones",
				"j_hula",
				"j_industrial_fan",
				"j_meat_grinder",
				"j_paint_can",
				"j_empty_paint_can",
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
				"j_traffic_cone",
				"j_broken_tv",
				"j_empty_gas_can",
				"j_empty_mug",
				"j_empty_teapot",
				"j_family_picture",
				"j_paper_towels",
				"j_broken_receiver",
				"j_newspaper",
				"j_newspaper_stack",
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
				"hl2_m_brokenbottle",
				"melee_paddle",
				"melee_fireaxe",
				"hl2_m_steeringwheel",
				"melee_pitchfork",
				"hl2_m_valve",
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
			local ranItem = table.Random(items)
			
			return spawnItem(ranItem, client, position, data)
		end
	},
	{
		name = "Random Food Item",
		desc = "Spawn a random food item.",
		category = "Items",
		cost = 10,
		CD = 5,
		useFunction = function(client, position, data)
			local items = {
				"food_soda_bottled",
				"food_water",
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
				"food_pickles",
				"food_tea",
				"food_mre",
				"food_orange",
				"food_potato",
				"food_soda_blueberry",
				"food_soda_cherry",
				"food_lemon_soda",
				"food_melon",
				"food_eggnog",
				"food_donut",
				"food_candybar",
				"food_cheese",
				"food_coconut",
				"food_jam",
			}
			local ranItem = table.Random(items)
			
			return spawnItem(ranItem, client, position, data)
		end
	},
	{
		name = "Random Melee Weapon",
		desc = "Spawns a Random Melee Weapon",
		category = "Items",
		cost = 20,
		CD = 20,
		useFunction = function(client, position, data)
			local items = {
				"hl2_m_shovel",
				"melee_fireaxe",
				"melee_pitchfork",
				"hl2_m_wrench",
				"hl2_m_hammer",
				"hl2_m_pole",
				"hl2_m_bat",
				"hl2_m_bat_metal",
				"hl2_m_brokenbottle",
				"hl2_m_shiv_metal",
				"hl2_m_shovel_alt",
				"hl2_m_pipe",
				"hl2_m_meathook",
				"hl2_m_machate",
				"hl2_m_crowbar",
				"hl2_m_crowbar_alt",
				"hl2_m_baton",
			}
			local ranItem = table.Random(items)
			
			return spawnItem(ranItem, client, position, data)
		end
	},
	{
		name = "Random Vehicle",
		desc = "Spawns a Random Vehicle.",
		category = "Items",
		cost = 500,
		CD = 60,
		useFunction = function(client, position, data)
			local cars = {
				"sim_fphys_pwavia",
				"sim_fphys_pwgaz52",
				"sim_fphys_pwhatchback",
				"sim_fphys_pwliaz",
				"sim_fphys_pwmoskvich",
				"sim_fphys_pwtrabant",
				"sim_fphys_pwtrabant02",
				"sim_fphys_pwvan",
				"sim_fphys_pwvolga",
				"sim_fphys_pwzaz",
				"r751",
				"r752",
			}
			local ranCar = table.Random(cars)
			
			return spawnVehicle(ranCar, client, position, data)
		end
	},
	
	--Anomaly
	{
		name = "Haunting Mannequin",
		desc = "Spawn a teleporting mannequin. Chases closest living player once spawned, lasts 5 minutes.",
		model = "models/nh2_gmn/dave_the_dummy_on_stand_phys.mdl",
		category = "Anomalies",
		cost = 100,
		CD = 60,
		useFunction = function(client, position, data)
			local ent = ents.Create("mannequin")
	
			if (IsValid(ent)) then
				ent:SetPos(position+Vector(0,0,40))
				ent:Spawn()
				
				timer.Simple(300, function()
					SafeRemoveEntity(ent)
				end)
			end
			
			return true
		end
	},
	
	{
		name = "Angry Corpse",
		desc = "Spawn an Angry Corpse",
		model = "models/dismemberment/gibs/legs.mdl",
		category = "Anomalies",
		cost = 20,
		CD = 15,
		useFunction = function(client, position, data)
			local ent = ents.Create("respite_corpse")
	
			if (IsValid(ent)) then
				ent:SetPos(position)
				ent:Spawn()
			end
			
			if(IsValid(ent)) then
				return true
			else
				return false
			end
		end
	},
	
	{
		name = "Bead Anomaly",
		desc = "Spawn an Anomaly that bounces around.",
		model = "models/hunter/blocks/cube05x05x05.mdl",
		category = "Anomalies",
		cost = 30,
		CD = 30,
		useFunction = function(client, position, data)
			local ent = ents.Create("anom_bead")
	
			if (IsValid(ent)) then
				ent:SetPos(position)
				ent:Spawn()
			end
			
			if(IsValid(ent)) then
				return true
			else
				return false
			end
		end
	},
	
	{
		name = "Stone Anomaly",
		desc = "Spawn an Anomaly that floats around.",
		model = "models/hunter/blocks/cube05x05x05.mdl",
		category = "Anomalies",
		cost = 20,
		CD = 30,
		useFunction = function(client, position, data)
			local ent = ents.Create("anom_hoverstone")
	
			if (IsValid(ent)) then
				ent:SetPos(position)
				ent:Spawn()
			end
			
			if(IsValid(ent)) then
				return true
			else
				return false
			end
		end
	},
	
	{
		name = "Mystic Anomaly",
		desc = "Spawn an Anomaly that chases places.",
		model = "models/hunter/blocks/cube05x05x05.mdl",
		category = "Anomalies",
		cost = 30,
		CD = 30,
		useFunction = function(client, position, data)
			local ent = ents.Create("anom_mystic")
	
			if (IsValid(ent)) then
				ent:SetPos(position)
				ent:Spawn()
			end
			
			if(IsValid(ent)) then
				return true
			else
				return false
			end
		end
	},
	
	{
		name = "Static Anomaly",
		desc = "Spawn an Anomaly that shocks people who come near it (for 300 seconds)..",
		model = "models/hunter/blocks/cube05x05x05.mdl",
		category = "Anomalies",
		cost = 50,
		CD = 120,
		useFunction = function(client, position, data)
			local ent = ents.Create("anom_static")
	
			if (IsValid(ent)) then
				ent:SetPos(position)
				ent:Spawn()
			end
			
			timer.Simple(300, function()
				if(IsValid(ent)) then
					SafeRemoveEntity(ent)
				end
			end)
			
			if(IsValid(ent)) then
				return true
			else
				return false
			end
		end
	},
	
	--cat
	{
		name = "Plastic Cat",
		desc = "Spawn a Plastic Cat",
		model = "models/jeezy/animals/siamese_cat/siamese_cat.mdl",
		category = "Anomalies",
		cost = 100,
		CD = 1,
		useFunction = function(client, position, data)
			return spawnNPC("plastic_cat", client, position, data)
		end
	},
	
	--rat
	{
		name = "Plastic Rat",
		desc = "Spawn a Plastic Rat",
		model = "models/alieneer/rat.mdl",
		category = "Anomalies",
		cost = 20,
		CD = 1,
		useFunction = function(client, position, data)
			return spawnNPC("plastic_rat", client, position, data)
		end
	},
	
	{
		name = "Refund",
		desc = "Refunds something that you have spawned for 50% of the points.",
		model = "models/hunter/blocks/cube05x05x05.mdl",
		category = "Utility",
		cost = 0,
		CD = 0,
		useFunction = function(client, position, data)
			local data = {}
				data.start = client:GetShootPos()
				data.endpos = data.start + client:GetAimVector()*4096
				data.filter = {client}
			local trace = util.TraceLine(data)
		
			return refundEntity(client, trace.Entity, data)
		end
	},
}