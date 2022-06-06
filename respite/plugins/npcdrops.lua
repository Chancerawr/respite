local PLUGIN = PLUGIN
PLUGIN.name = "NPC Drops"
PLUGIN.desc = "NPCs drop items."
PLUGIN.author = ""

if SERVER then
	PLUGIN.npcDrops = {
		["amputated"] = {
			["food_monster_meat"] = 5,
			["medical_bandages"] = 5,
			["nothing"] = 10,
		},
		["amputated_flame"] = {
			["ichor"] = 3,
			["food_monster_meat"] = 10,
			["nothing"] = 10,
		},
		["amputated_shade"] = {
			["j_scrap_memory"] = 5,
			["nothing"] = 10,
		},
		["cof_child"] = {
			["food_monster_meat"] = 5,
			["nothing"] = 10,
		},
		["cof_crazywoman"] = {
			["food_monster_meat"] = 5,
			["nothing"] = 10,
		},
		["cof_faceless"] = {
			["food_monster_meat"] = 5,
			["nothing"] = 10,
		},
		["cof_faster"] = {
			["food_monster_meat"] = 5,
			["nothing"] = 10,
		},
		["cof_upper"] = {
			["food_monster_meat"] = 5,
			["nothing"] = 10,
		},
		["doll_runner"] = {
			["medical_plastic"] = 1,
			["j_scrap_plastics"] = 5,
			["nothing"] = 10,
		},
		["doll_walker"] = {
			["medical_plastic"] = 1,
			["j_scrap_plastics"] = 5,
			["nothing"] = 10,
		},
		["doll_runner_shade"] = {
			["blight"] = 1,
			["j_scrap_memory"] = 5,
			["nothing"] = 10,
		},
		["doll_walker_shade"] = {
			["blight"] = 1,
			["j_scrap_memory"] = 5,
			["nothing"] = 10,
		},
		["doll_walker_shade"] = {
			["blight"] = 1,
			["j_scrap_memory"] = 5,
			["nothing"] = 10,
		},
		["freak"] = {
			["j_old_rag"] = 1,
			["food_monster_meat"] = 5,
			["nothing"] = 10,
		},
		["freak_shade"] = {
			["blight"] = 1,
			["j_scrap_memory"] = 5,
			["nothing"] = 10,
		},
		["housewife"] = {
			["hl2_m_shiv_metal"] = 1,
			["food_monster_meat"] = 5,
			["nothing"] = 10,
		},
		["housewife_shade"] = {
			["hl2_m_shiv_metal"] = 1,
			["blight"] = 5,
			["j_scrap_memory"] = 5,
			["nothing"] = 10,
		},
		["housewife_shade"] = {
			["hl2_m_shiv_metal"] = 1,
			["blight"] = 5,
			["j_scrap_memory"] = 5,
			["nothing"] = 10,
		},
		["nz_creeper"] = {
			["shard_dust"] = 5,
			["voltaic"] = 1,
			["nothing"] = 20,
		},
		["nz_creeper_wraith"] = {
			["ichor"] = 5,
			["nothing"] = 10,
		},
		["nz_demon"] = {
			["hl2_m_monstertalon"] = 1,
			["food_monster_meat"] = 5,
			["nothing"] = 10,
		},
		["nz_demon_flame"] = {
			["ichor"] = 3,
			["hl2_m_monstertalon"] = 1,
			["food_monster_meat"] = 5,
			["nothing"] = 10,
		},
		["nz_demon_shade"] = {
			["hl2_m_monstertalon"] = 1,
			["blight"] = 3,
			["J_scrap_memory"] = 5,
			["nothing"] = 10,
		},
		["nz_dog"] = {
			["food_monster_meat"] = 5,
			["nothing"] = 10,
		},
		["nz_dog_shade"] = {
			["blight"] = 2,
			["j_scrap_memory"] = 5,
			["nothing"] = 10,
		},
		["nz_drum"] = {
			["food_monster_meat"] = 10,
			["nothing"] = 5,
		},
		["nz_drum_shade"] = {
			["blight"] = 5,
			["j_scrap_memory"] = 10,
			["nothing"] = 5,
		},
		["nz_drum_ice"] = {
			["ichor"] = 5,
			["food_monster_meat"] = 10,
			["nothing"] = 5,
		},
		["nz_freak"] = {
			["food_monster_meat"] = 5,
			["nothing"] = 10,
		},
		["nz_freak_ice"] = {
			["ichor"] = 1,
			["food_monster_meat"] = 5,
			["nothing"] = 10,
		},
		["nz_freak_shade"] = {
			["blight"] = 1,
			["j_scrap_memory"] = 5,
			["nothing"] = 10,
		},
		["nz_hatred"] = {
			["food_monster_meat"] = 10,
			["nothing"] = 10,
		},
		["nz_hatred_shade"] = {
			["blight"] = 5,
			["j_scrap_memory"] = 10,
			["nothing"] = 10,
		},
		["nz_haunt"] = {
			["j_scrap_memory"] = 5,
			["nothing"] = 10,
		},
		["nz_horror_red"] = {
			["ichor"] = 2,
			["j_scrap_memory"] = 5,
			["nothing"] = 10,
		},
		["nz_jeffrey"] = {
			["j_scrap_idea"] = 5,
			["j_scrap_memory"] = 20,
		},
		["nz_leecher"] = {
			["food_monster_meat"] = 10,
			["nothing"] = 5,
		},
		["nz_leecher_shade"] = {
			["blight"] = 5,
			["j_scrap_memory"] = 10,
			["nothing"] = 5,
		},
		["nz_leperkin"] = {
			["hl2_m_monstertalon"] = 3,
			["food_monster_meat"] = 10,
			["nothing"] = 5,
		},
		["nz_leperkin_flame"] = {
			["ichor"] = 5,
			["hl2_m_monstertalon"] = 3,
			["food_monster_meat"] = 10,
			["nothing"] = 5,
		},
		["nz_leperkin_shade"] = {
			["blight"] = 5,
			["hl2_m_monstertalon"] = 3,
			["j_scrap_memory"] = 10,
			["nothing"] = 5,
		},
		["nz_mimic"] = {
			["nothing"] = 5,
		},
		["nz_phantom"] = {
			["ichor"] = 5,
			["hl2_m_pipe"] = 3,
			["j_scrap_memory"] = 10,
			["nothing"] = 10,
		},
		["nz_reanimated"] = {
			["food_monster_meat"] = 10,
			["nothing"] = 10,
		},
		["nz_reanimated_flame"] = {
			["ichor"] = 1,
			["food_monster_meat"] = 10,
			["nothing"] = 10,
		},
		["nz_roller"] = {
			["food_monster_meat"] = 10,
			["nothing"] = 10,
		},
		["nz_roller_shade"] = {
			["blight"] = 1,
			["j_scrap_memory"] = 10,
			["nothing"] = 5,
		},
		["nz_static"] = {
			["ammo_battery"] = 5,
			["j_scrap_battery"] = 5,
			["j_scrap_memory"] = 10,
			["nothing"] = 5,
		},
		["nz_steve"] = {
			["food_monster_meat"] = 10,
			["nothing"] = 10,
		},
		["nz_steve_shade"] = {
			["blight"] = 3,
			["j_scrap_memory"] = 10,
			["nothing"] = 10,
		},
		["nz_thrasher"] = {
			["hl2_m_monstertalon"] = 5,
			["food_monster_meat"] = 10,
			["nothing"] = 10,
		},
		["nz_thrower"] = {
			["food_monster_meat"] = 10,
			["nothing"] = 10,
		},
		["nz_thrower_shade"] = {
			["blight"] = 5,
			["j_scrap_memory"] = 10,
			["nothing"] = 10,
		},
		["nz_thrower_shade"] = {
			["blight"] = 5,
			["j_scrap_memory"] = 10,
			["nothing"] = 10,
		},
		["nz_undead_shade"] = {
			["blight"] = 1,
			["j_scrap_memory"] = 5,
			["nothing"] = 10,
		},
		["nz_wraith"] = {
			["ichor"] = 5,
			["nothing"] = 10,
		},
		["pack"] = {
			["hl2_m_monstertalon"] = 5,
			["food_monster_meat"] = 5,
			["nothing"] = 10,
		},
		["pack_shade"] = {
			["blight"] = 5,
			["hl2_m_monstertalon"] = 5,
			["j_scrap_memory"] = 5,
			["nothing"] = 10,
		},
		["resp_angel"] = {
			["reflective"] = 1,
			["nothing"] = 10,
		},
		["resp_skin"] = {
			["reflective"] = 1,
			["nothing"] = 20,
		},
		["resp_babu"] = {
			["medical_plastic"] = 1,
			["j_scrap_plastics"] = 10,
			["nothing"] = 10,
		},
		["resp_babu_shade"] = {
			["blight"] = 1,
			["j_scrap_memory"] = 10,
			["nothing"] = 10,
		},
		["resp_babu_wraith"] = {
			["ichor"] = 1,
			["j_scrap_memory"] = 10,
			["nothing"] = 10,
		},
		["resp_baby"] = {
			["medical_plastic"] = 1,
			["j_scrap_plastics"] = 10,
			["nothing"] = 20,
		},
		["resp_baby_big"] = {
			["medical_plastic"] = 1,
			["j_scrap_plastics"] = 10,
			["nothing"] = 20,
		},
		["resp_baby_shade"] = {
			["blight"] = 1,
			["j_scrap_memory"] = 10,
			["nothing"] = 20,
		},
		["resp_belmer"] = {
			["ichor"] = 1,
			["j_scrap_memory"] = 10,
			["nothing"] = 20,
		},
		["resp_chimera"] = {
			["hl2_m_monstertalon"] = 5,
			["food_monster_meat"] = 10,
			["nothing"] = 20,
		},
		["resp_chimera_shade"] = {
			["blight"] = 5,
			["hl2_m_monstertalon"] = 5,
			["j_scrap_memory"] = 10,
			["nothing"] = 20,
		},
		["resp_dolly"] = {
			["medical_plastic"] = 1,
			["j_scrap_plastics"] = 10,
			["nothing"] = 20,
		},
		["resp_dolly_shade"] = {
			["blight"] = 1,
			["j_scrap_memory"] = 10,
			["nothing"] = 20,
		},
		["resp_dolly_big"] = {
			["medical_plastic"] = 1,
			["j_scrap_plastics"] = 10,
			["nothing"] = 20,
		},
		["resp_floater"] = {
			["food_monster_meat"] = 10,
			["nothing"] = 20,
		},
		["resp_floater_shade"] = {
			["blight"] = 10,
			["j_scrap_memory"] = 10,
			["nothing"] = 20,
		},
		["resp_gemini"] = {
			["medical_plastic"] = 1,
			["j_scrap_plastics"] = 10,
			["nothing"] = 5,
		},
		["resp_gemini_wraith"] = {
			["ichor"] = 1,
			["j_scrap_memory"] = 10,
			["nothing"] = 5,
		},
		["resp_kuszo"] = {
			["medical_plastic"] = 1,
			["j_scrap_plastics"] = 10,
			["nothing"] = 5,
		},
		["resp_kuszo_shade"] = {
			["blight"] = 1,
			["j_scrap_memory"] = 10,
			["nothing"] = 5,
		},
		["resp_leecher_small"] = {
			["food_monster_meat"] = 10,
			["nothing"] = 5,
		},
		["resp_leecher_small_shade"] = {
			["blight"] = 5,
			["j_scrap_memory"] = 10,
			["nothing"] = 5,
		},
		["resp_leecher_small_shade"] = {
			["blight"] = 5,
			["j_scrap_memory"] = 10,
			["nothing"] = 5,
		},
		["resp_lurker"] = {
			["hl2_m_monstertalon"] = 5,
			["food_human_meat"] = 10,
			["nothing"] = 5,
		},
		["resp_lurker_shade"] = {
			["hl2_m_monstertalon"] = 5,
			["blight"] = 5,
			["j_scrap_memory"] = 10,
			["nothing"] = 5,
		},
		["resp_lyingfigure"] = {
			["food_monster_meat"] = 10,
			["nothing"] = 10,
		},
		["resp_nurse"] = {
			["j_syringe"] = 1,
			["hl2_m_pipe"] = 1,
			["medical_plastic"] = 1,
			["j_scrap_plastics"] = 10,
			["nothing"] = 5,
		},
		["resp_paperzombie"] = {
			["misc_paper"] = 10,
			["nothing"] = 5,
		},
		["resp_paranoia"] = {
			["blight"] = 10,
			["j_scrap_memory"] = 10,
			["nothing"] = 5,
		},
		["resp_pendulum"] = {
			["j_scrap_metals"] = 10,
			["food_monster_meat"] = 10,
			["nothing"] = 5,
		},
		["resp_saw"] = {
			["j_scrap_elecs"] = 10,
			["ichor"] = 10,
			["food_monster_meat"] = 10,
			["nothing"] = 5,
		},
		["resp_smog"] = {
			["food_monster_meat"] = 10,
			["nothing"] = 5,
		},
		["resp_spider"] = {
			["hl2_m_monstertalon"] = 10,
			["food_monster_meat"] = 10,
			["nothing"] = 5,
		},
		["resp_teleporter"] = {
			["blight"] = 10,
			["j_scrap_memory"] = 10,
			["nothing"] = 5,
		},
		["resp_titan"] = {
			["food_monster_meat"] = 10,
			["nothing"] = 5,
		},
		["resp_titan_small"] = {
			["food_monster_meat"] = 5,
			["nothing"] = 5,
		},
		["resp_vomit"] = {
			["food_monster_meat"] = 5,
			["nothing"] = 5,
		},
		["scarlet"] = {
			["medical_plastic"] = 1,
			["j_scrap_plastics"] = 10,
			["nothing"] = 5,
		},
		["scarlet_crawl"] = {
			["medical_plastic"] = 1,
			["j_scrap_plastics"] = 10,
			["nothing"] = 5,
		},
		["scarlet_shade"] = {
			["blight"] = 1,
			["j_scrap_memory"] = 10,
			["nothing"] = 5,
		},
		["scarlet_crawl_shade"] = {
			["blight"] = 1,
			["j_scrap_memory"] = 10,
			["nothing"] = 5,
		},
		["shade_crawlsmoke"] = {
			["blight"] = 1,
			["j_scrap_memory"] = 15,
			["nothing"] = 15,
		},
		["spore"] = {
			["food_monster_meat"] = 15,
			["nothing"] = 15,
		},
	}
	
	-- Weighted random based on rarity of items
	local function GetWeightedRandomKey(items)
		local sum = 0
		
		for item, rarity in pairs(items) do
			sum = sum + (rarity or 1)
		end

		local select = math.random() * sum

		for item, rarity in pairs(items) do
			select = select - (rarity or 1)
			if select < 0 then 
				return item
			end
		end
	end
	
	-- gets an item from the drop table
	function PLUGIN:getDrop(npc)
		return GetWeightedRandomKey(PLUGIN.npcDrops[npc])
	end

	-- Called when any NPC dies
	function PLUGIN:OnNPCKilled(npc, attacker, inflictor)		
		local className = npc:GetClass()
	
		-- If the NPC has a drop table
		if(PLUGIN.npcDrops[className]) then
			local drop = PLUGIN:getDrop(className)
			if(!drop) then return false end
			
			if(drop == "nothing") then
				return
			end
		
			nut.item.spawn(drop, npc:GetPos()+Vector(0,0,20)) -- Spawns the item
		end
	end
end