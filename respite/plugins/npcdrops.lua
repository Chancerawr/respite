local PLUGIN = PLUGIN
PLUGIN.name = "NPC Drops"
PLUGIN.desc = "NPCs drop items."
PLUGIN.author = ""

if SERVER then
	PLUGIN.npcDrops = {
		["amputated"] = {
			["food_monster_meat"] = {
				max = 2, 
				chance = 30,
			},
			["medical_bandages"] = {
				max = 1, 
				chance = 15,
			},
		},
		["amputated_flame"] = {
			["food_monster_meat"] = {
				max = 2, 
				chance = 20,
			},
			["ichor"] = {
				max = 1, 
				chance = 15,
			},
		},
		["amputated_shade"] = { --add memory wrap, cloth
			["j_scrap_memory"] = {
				max = 2, 
				chance = 15,
			},
			["blight"] = {
				max = 1, 
				chance = 5,
			},
		},
		["cof_child"] = { --add shiv
			["food_monster_meat"] = {
				max = 1, 
				chance = 40,
			},
			["hl2_m_shiv_metal"] = {
				max = 2, 
				chance = 10,
			},
		},
		["cof_crazywoman"] = { --add shiv
			["food_monster_meat"] = {
				max = 1, 
				chance = 40,
			},
			["hl2_m_shiv_metal"] = {
				max = 1, 
				chance = 10,
			},
		},
		["cof_faceless"] = { --add something
			["food_monster_meat"] = {
				max = 1, 
				chance = 40,
			},
		},
		["cof_faster"] = { --add talon/claw
			["food_monster_meat"] = {
				max = 1, 
				chance = 40,
			},
		},
		["cof_upper"] = { --add shoes
			["food_monster_meat"] = {
				max = 1, 
				chance = 40,
			},
		},
		["doll_runner"] = {
			["medical_plastic"] = {
				max = 2, 
				chance = 30,
			},
			["j_scrap_plastics"] = {
				max = 3, 
				chance = 25,
			},
		},
		["doll_walker"] = {
			["medical_plastic"] = {
				max = 2, 
				chance = 30,
			},
			["j_scrap_plastics"] = {
				max = 3, 
				chance = 25,
			},
		},
		["doll_runner_shade"] = {
			["blight"] = {
				max = 1, 
				chance = 10,
			},
			["j_scrap_memory"] = {
				max = 1, 
				chance = 25,
			},
		},
		["doll_walker_shade"] = {
			["blight"] = {
				max = 1, 
				chance = 10,
			},
			["j_scrap_memory"] = {
				max = 1, 
				chance = 25,
			},
		},
		["freak"] = {
			["food_monster_meat"] = {
				max = 2, 
				chance = 35,
			},
		},
		["freak_shade"] = {
			["j_scrap_memory"] = {
				max = 1, 
				chance = 25,
			},
			["blight"] = {
				max = 1, 
				chance = 10,
			},
		},
		["housewife"] = {
			["food_monster_meat"] = {
				max = 1, 
				chance = 40,
			},
			["hl2_m_shiv_metal"] = {
				max = 1, 
				chance = 10,
			},
		},
		["housewife_shade"] = {
			["j_scrap_memory"] = {
				max = 1, 
				chance = 25,
			},
			["blight"] = {
				max = 1, 
				chance = 10,
			},
			["hl2_m_shiv_metal"] = {
				max = 1, 
				chance = 10,
			},
		},
		["nz_creeper"] = { --add energy thing here
			["shard_dust"] = {
				max = 1, 
				chance = 20,
			},
			["voltaic"] = {
				max = 1, 
				chance = 10,
			},
			["j_scrap_energy"] = {
				max = 1, 
				chance = 5,
			},
		},
		["nz_creeper_wraith"] = {
			["ichor"] = {
				max = 2, 
				chance = 20,
			},
		},
		["nz_demon"] = {
			["food_monster_meat"] = {
				max = 1, 
				chance = 40,
			},
			["hl2_m_monstertalon"] = {
				max = 2, 
				chance = 15,
			},
		},
		["nz_demon_flame"] = {
			["food_monster_meat"] = {
				max = 1, 
				chance = 40,
			},
			["hl2_m_monstertalon"] = {
				max = 2, 
				chance = 15,
			},
			["ichor"] = {
				max = 1, 
				chance = 15,
			},
		},
		["nz_demon_shade"] = {
			["j_scrap_memory"] = {
				max = 1, 
				chance = 20,
			},
			["hl2_m_monstertalon"] = {
				max = 2, 
				chance = 15,
			},
			["blight"] = {
				max = 1, 
				chance = 15,
			},
		},
		["nz_dog"] = { --add teeth or something
			["food_monster_meat"] = {
				max = 1, 
				chance = 40,
			},
		},
		["nz_dog_shade"] = {
			["j_scrap_memory"] = {
				max = 1, 
				chance = 30,
			},
			["blight"] = {
				max = 1, 
				chance = 15,
			},
		},
		["nz_drum"] = {
			["food_monster_meat"] = {
				max = 5, 
				chance = 50,
			},
		},
		["nz_drum_shade"] = {
			["j_scrap_memory"] = {
				max = 3, 
				chance = 40,
			},
			["blight"] = {
				max = 2, 
				chance = 30,
			},
		},
		["nz_drum_ice"] = {
			["food_monster_meat"] = {
				max = 5, 
				chance = 50,
			},
			["ichor"] = {
				max = 2, 
				chance = 30,
			},
		},
		["nz_freak"] = { --add more garbage
			["food_monster_meat"] = {
				max = 2, 
				chance = 50,
			},
			["j_old_rag"] = {
				max = 1, 
				chance = 15,
			},
		},
		["nz_freak_ice"] = { --add more garbage
			["food_monster_meat"] = {
				max = 2, 
				chance = 50,
			},
			["ichor"] = {
				max = 1, 
				chance = 15,
			},
			["j_old_rag"] = {
				max = 1, 
				chance = 5,
			},
		},
		["nz_freak_shade"] = {
			["j_scrap_memory"] = {
				max = 2,
				chance = 30,
			},
			["blight"] = {
				max = 1, 
				chance = 15,
			},
			["j_old_rag"] = {
				max = 1, 
				chance = 5,
			},
		},
		["nz_hatred"] = {
			["food_monster_meat"] = {
				max = 3, 
				chance = 50,
			},
		},
		["nz_hatred_shade"] = {
			["j_scrap_memory"] = {
				max = 3, 
				chance = 50,
			},
			["blight"] = {
				max = 2, 
				chance = 15,
			},
		},
		["nz_haunt"] = {
			["j_scrap_memory"] = {
				max = 2, 
				chance = 25,
			},
		},
		["nz_horror_red"] = {
			["j_scrap_memory"] = {
				max = 2, 
				chance = 25,
			},
			["ichor"] = {
				max = 1, 
				chance = 10,
			},
		},
		["nz_jeffrey"] = {
			["j_scrap_memory"] = {
				max = 5, 
				chance = 75,
			},
			["j_scrap_idea"] = {
				max = 1, 
				chance = 50,
			},
		},
		["nz_leecher"] = { --some kind of plant based stuff drops
			["food_monster_meat"] = {
				max = 3, 
				chance = 50,
			},
		},
		["nz_leecher_shade"] = {
			["j_scrap_memory"] = {
				max = 3, 
				chance = 50,
			},
			["j_scrap_memory"] = {
				max = 2, 
				chance = 30,
			},
		},
		["nz_leperkin"] = {
			["food_monster_meat"] = {
				max = 2, 
				chance = 50,
			},
			["hl2_m_monstertalon"] = {
				max = 2, 
				chance = 15,
			},
		},
		["nz_leperkin_flame"] = {
			["food_monster_meat"] = {
				max = 2, 
				chance = 50,
			},
			["hl2_m_monstertalon"] = {
				max = 2, 
				chance = 15,
			},
			["ichor"] = {
				max = 1, 
				chance = 30,
			},
		},
		["nz_leperkin_shade"] = {
			["j_scrap_memory"] = {
				max = 2, 
				chance = 50,
			},
			["hl2_m_monstertalon"] = {
				max = 2, 
				chance = 15,
			},
			["blight"] = {
				max = 1, 
				chance = 20,
			},
		},
		["nz_mimic"] = { --energy thing
			["food_monster_meat"] = {
				max = 1, 
				chance = 30,
			},
		},
		["nz_phantom"] = {
			["j_scrap_memory"] = {
				max = 1, 
				chance = 30,
			},
			["ichor"] = {
				max = 1, 
				chance = 15,
			},
			["hl2_m_pipe"] = {
				max = 1, 
				chance = 10,
			},
		},
		["nz_reanimated"] = { --sleeping stuff maybe?
			["food_monster_meat"] = {
				max = 2, 
				chance = 25,
			},
		},
		["nz_reanimated_flame"] = {
			["food_monster_meat"] = {
				max = 2, 
				chance = 25,
			},
			["ichor"] = {
				max = 1, 
				chance = 20,
			},
		},
		["nz_roller"] = { --junk or something
			["food_monster_meat"] = {
				max = 2, 
				chance = 25,
			},
		},
		["nz_roller_shade"] = {
			["j_scrap_memory"] = {
				max = 2, 
				chance = 25,
			},
			["blight"] = {
				max = 1, 
				chance = 20,
			},
		},
		["nz_static"] = { --electric item thing
			["j_scrap_energy"] = {
				max = 1, 
				chance = 5,
			},
			["j_scrap_battery"] = {
				max = 1, 
				chance = 20,
			},
			["ammo_battery"] = {
				max = 1, 
				chance = 10,
			},
		},
		["nz_staitjacket"] = {
			["food_monster_meat"] = {
				max = 3, 
				chance = 50,
			},
		},
		["nz_steve_shade"] = {
			["j_scrap_memory"] = {
				max = 3, 
				chance = 50,
			},
			["blight"] = {
				max = 1, 
				chance = 30,
			},
		},
		["nz_thrasher"] = {
			["food_monster_meat"] = {
				max = 3, 
				chance = 40,
			},
			["hl2_m_monstertalon"] = {
				max = 2, 
				chance = 15,
			},
		},
		["nz_thrower"] = {
			["food_monster_meat"] = {
				max = 3, 
				chance = 30,
			},
		},
		["nz_thrower_shade"] = {
			["j_scrap_memory"] = {
				max = 3, 
				chance = 30,
			},
			["blight"] = {
				max = 1, 
				chance = 20,
			},
		},
		["nz_undead_shade"] = {
			["j_scrap_memory"] = {
				max = 1, 
				chance = 20,
			},
			["blight"] = {
				max = 1, 
				chance = 10,
			},
		},
		["nz_wraith"] = {
			["ichor"] = {
				max = 2, 
				chance = 25,
			},
		},
		["pack"] = {
			["food_monster_meat"] = {
				max = 2, 
				chance = 25,
			},
			["hl2_m_monstertalon"] = {
				max = 2, 
				chance = 10,
			},
		},
		["pack_shade"] = {
			["j_scrap_memory"] = {
				max = 1, 
				chance = 25,
			},
			["blight"] = {
				max = 1, 
				chance = 15,
			},
			["hl2_m_monstertalon"] = {
				max = 2, 
				chance = 10,
			},
		},
		["resp_angel"] = { --add weird stuff
			["reflective"] = {
				max = 1, 
				chance = 50,
			},
		},
		["resp_skin"] = { --add garbage
			["reflective"] = {
				max = 1, 
				chance = 10,
			},
		},
		["resp_babu"] = {
			["j_scrap_plastics"] = {
				max = 3, 
				chance = 15,
			},
			["medical_plastic"] = {
				max = 1, 
				chance = 15,
			},
		},
		["resp_babu_shade"] = {
			["j_scrap_memory"] = {
				max = 1, 
				chance = 25,
			},
			["blight"] = {
				max = 1, 
				chance = 15,
			},
		},
		["resp_babu_wraith"] = {
			["j_scrap_memory"] = {
				max = 1, 
				chance = 25,
			},
			["ichor"] = {
				max = 1, 
				chance = 15,
			},
		},
		["resp_baby"] = { --bone shiv
			["j_scrap_plastics"] = {
				max = 1, 
				chance = 25,
			},
			["medical_plastic"] = {
				max = 1, 
				chance = 15,
			},
		},
		["resp_baby_big"] = { --bone shiv
			["j_scrap_plastics"] = {
				max = 2, 
				chance = 25,
			},
			["medical_plastic"] = {
				max = 2, 
				chance = 15,
			},
		},
		["resp_baby_shade"] = {
			["j_scrap_memory"] = {
				max = 1, 
				chance = 15,
			},
			["blight"] = {
				max = 1, 
				chance = 5,
			},
		},
		["resp_belmer"] = {
			["j_scrap_memory"] = {
				max = 2, 
				chance = 30,
			},
		},
		["resp_chimera"] = {
			["food_monster_meat"] = {
				max = 2, 
				chance = 30,
			},
			["hl2_m_monstertalon"] = {
				max = 2, 
				chance = 15,
			},
		},
		["resp_chimera_shade"] = {
			["j_scrap_memory"] = {
				max = 2, 
				chance = 30,
			},
			["hl2_m_monstertalon"] = {
				max = 2, 
				chance = 20,
			},
			["blight"] = {
				max = 1, 
				chance = 15,
			},
		},
		["resp_dolly"] = {
			["j_scrap_plastics"] = {
				max = 1, 
				chance = 25,
			},
			["medical_plastic"] = {
				max = 1, 
				chance = 15,
			},
		},
		["resp_dolly_shade"] = {
			["j_scrap_memory"] = {
				max = 1, 
				chance = 15,
			},
			["blight"] = {
				max = 1, 
				chance = 5,
			},
		},
		["resp_dolly_big"] = {
			["j_scrap_plastics"] = {
				max = 2, 
				chance = 25,
			},
			["medical_plastic"] = {
				max = 2, 
				chance = 15,
			},
		},
		["resp_floater"] = { --shiv
			["j_scrap_plastics"] = {
				max = 2, 
				chance = 20,
			},
		},
		["resp_floater_shade"] = {
			["j_scrap_memory"] = {
				max = 2, 
				chance = 20,
			},
			["j_scrap_memory"] = {
				max = 1, 
				chance = 20,
			},
		},
		["resp_gemini"] = {
			["j_scrap_plastics"] = {
				max = 4, 
				chance = 30,
			},
			["medical_plastic"] = {
				max = 1, 
				chance = 20,
			},
		},
		["resp_gemini_wraith"] = {
			["j_scrap_memory"] = {
				max = 3, 
				chance = 30,
			},
			["ichor"] = {
				max = 1, 
				chance = 25,
			},
		},
		["resp_kuszo"] = {
			["j_scrap_plastics"] = {
				max = 1, 
				chance = 40,
			},
			["medical_plastic"] = {
				max = 1, 
				chance = 20,
			},
		},
		["resp_kuszo_shade"] = {
			["j_scrap_memory"] = {
				max = 1, 
				chance = 40,
			},
			["blight"] = {
				max = 1, 
				chance = 20,
			},
		},
		["resp_leecher_small"] = { --add plant things
			["food_monster_meat"] = {
				max = 2, 
				chance = 25,
			},
		},
		["resp_leecher_small_shade"] = {
			["j_scrap_memory"] = {
				max = 2, 
				chance = 25,
			},
			["blight"] = {
				max = 1, 
				chance = 20,
			},
		},
		["resp_lurker"] = {
			["food_human_meat"] = {
				max = 2, 
				chance = 25,
			},
			["hl2_m_monstertalon"] = {
				max = 2, 
				chance = 15,
			},
		},
		["resp_lurker_shade"] = {
			["j_scrap_memory"] = {
				max = 1, 
				chance = 40,
			},
			["hl2_m_monstertalon"] = {
				max = 2, 
				chance = 15,
			},
			["blight"] = {
				max = 1, 
				chance = 25,
			},
		},
		["resp_lyingfigure"] = { --acid or poison or something
			["food_human_meat"] = {
				max = 3, 
				chance = 25,
			},
		},
		["resp_nurse"] = {
			["j_scrap_plastics"] = {
				max = 3, 
				chance = 25,
			},
			["medical_plastic"] = {
				max = 1, 
				chance = 20,
			},
			["hl2_m_pipe"] = {
				max = 1, 
				chance = 10,
			},
			["j_syringe"] = {
				max = 1, 
				chance = 10,
			},
		},
		["resp_paperzombie"] = {
			["misc_paper"] = {
				max = 2, 
				chance = 40,
			},
		},
		["resp_paranoia"] = {
			["j_scrap_memory"] = {
				max = 4, 
				chance = 30,
			},
			["blight"] = {
				max = 2, 
				chance = 25,
			},
		},
		["resp_pendulum"] = {
			["food_monster_meat"] = {
				max = 2, 
				chance = 30,
			},
			["j_scrap_metals"] = {
				max = 4, 
				chance = 25,
			},
		},
		["resp_saw"] = {
			["food_monster_meat"] = {
				max = 2, 
				chance = 25,
			},
			["j_scrap_elecs"] = {
				max = 3, 
				chance = 20,
			},
			["ichor"] = {
				max = 1, 
				chance = 50,
			},
		},
		["resp_smog"] = {
			["food_monster_meat"] = {
				max = 2, 
				chance = 25,
			},
		},
		["resp_spider"] = {
			["food_monster_meat"] = {
				max = 4, 
				chance = 25,
			},
			["hl2_m_monstertalon"] = {
				max = 4, 
				chance = 15,
			},
		},
		["resp_teleporter"] = {
			["j_scrap_memory"] = {
				max = 2, 
				chance = 25,
			},
			["blight"] = {
				max = 1, 
				chance = 25,
			},
		},
		["resp_titan"] = {
			["food_monster_meat"] = {
				max = 4, 
				chance = 30,
			},
		},
		["resp_titan_small"] = {
			["food_monster_meat"] = {
				max = 2, 
				chance = 30,
			},
		},
		["resp_vomit"] = { --acid, poison, venom
			["food_monster_meat"] = {
				max = 2, 
				chance = 25,
			},
		},
		["scarlet"] = {
			["j_scrap_plastics"] = {
				max = 4, 
				chance = 25,
			},
			["medical_plastic"] = {
				max = 2, 
				chance = 20,
			},
		},
		["scarlet_crawl"] = {
			["j_scrap_plastics"] = {
				max = 4, 
				chance = 25,
			},
			["medical_plastic"] = {
				max = 2, 
				chance = 20,
			},
		},
		["scarlet_shade"] = {
			["j_scrap_memory"] = {
				max = 2, 
				chance = 40,
			},
			["blight"] = {
				max = 1, 
				chance = 30,
			},
		},
		["scarlet_crawl_shade"] = {
			["j_scrap_memory"] = {
				max = 2, 
				chance = 40,
			},
			["blight"] = {
				max = 1, 
				chance = 30,
			},
		},
		["shade_crawlsmoke"] = {
			["j_scrap_memory"] = {
				max = 1, 
				chance = 25,
			},
			["blight"] = {
				max = 1, 
				chance = 10,
			},
		},
		["spore"] = { --maybe some other junk in here
			["food_monster_meat"] = {
				max = 2,
				chance = 30,
			},
		},
	}
	
	-- Weighted random based on rarity of items
	local function randomDrops(items)
		local drops = {}
		
		for uniqueID, item in pairs(items) do
			local roll = 0
			for i = 1, item.max do
				roll = math.random(1, 100)
				if(roll <= item.chance) then
					drops[uniqueID] = (drops[uniqueID] or 0) + 1
				end
			end
		end
		
		return drops
	end
	
	-- gets an item from the drop table
	function PLUGIN:getDrops(npc)
		return randomDrops(PLUGIN.npcDrops[npc])
	end

	-- Called when any NPC dies
	function PLUGIN:OnNPCKilled(npc, attacker, inflictor)		
		local className = npc:GetClass()
	
		--no npc drops if no players on server
		local playerCount = #player.GetAll()
		if(playerCount < 1) then return end
		
		--dont drop items if killed by another NPC
		if(IsValid(attacker) and (attacker:IsNPC() or attacker:IsNextBot())) then
			return false
		end
	
		-- If the NPC has a drop table
		if(PLUGIN.npcDrops[className]) then
			local drops = PLUGIN:getDrops(className)
			if(!drops or table.IsEmpty(drops)) then return false end

			for uniqueID, amount in pairs(drops) do
				for i = 1, amount do
					 -- Spawns the item
					nut.item.spawn(uniqueID, npc:GetPos()+Vector(0,0,20), function(item)
						local entity = item:getEntity()
						if(entity) then
							entity:SetCollisionGroup(COLLISION_GROUP_DEBRIS_TRIGGER)
							entity.temp = true --these items get cleaned up with map if not picked up
						end
					end)
				end
			end
		end
	end
end