local PLUGIN = PLUGIN
PLUGIN.name = "NPC Drops"
PLUGIN.desc = "NPCs drop items."
PLUGIN.author = ""

if SERVER then
	PLUGIN.npcDrops = {
		["resp_amputated"] = {
			["food_monster_meat"] = {
				max = 2, 
				chance = 30,
			},
			["medical_bandages"] = {
				max = 1, 
				chance = 15,
			},
		},
		["resp_amputated_w"] = {
			["food_monster_meat"] = {
				max = 2, 
				chance = 20,
			},
			["ichor"] = {
				max = 1, 
				chance = 15,
			},
		},
		["resp_amputated_s"] = { --add memory wrap, cloth
			["j_scrap_memory"] = {
				max = 2, 
				chance = 15,
			},
			["blight"] = {
				max = 1, 
				chance = 5,
			},
		},
		["resp_cof_child"] = { --add shiv
			["food_monster_meat"] = {
				max = 1, 
				chance = 40,
			},
			["hl2_m_shiv_metal"] = {
				max = 2, 
				chance = 10,
			},
		},
		["resp_cof_crazywoman"] = { --add shiv
			["food_monster_meat"] = {
				max = 1, 
				chance = 40,
			},
			["hl2_m_shiv_metal"] = {
				max = 1, 
				chance = 10,
			},
		},
		["resp_cof_faceless"] = { --add something
			["food_monster_meat"] = {
				max = 1, 
				chance = 40,
			},
		},
		["resp_cof_faster"] = { --add talon/claw
			["food_monster_meat"] = {
				max = 1, 
				chance = 40,
			},
		},
		["resp_cof_upper"] = { --add shoes
			["food_monster_meat"] = {
				max = 1, 
				chance = 40,
			},
		},
		["resp_doll_runner"] = {
			["medical_plastic"] = {
				max = 2, 
				chance = 30,
			},
			["j_scrap_plastics"] = {
				max = 3, 
				chance = 25,
			},
		},
		["resp_doll_walker"] = {
			["medical_plastic"] = {
				max = 2, 
				chance = 30,
			},
			["j_scrap_plastics"] = {
				max = 3, 
				chance = 25,
			},
		},
		["resp_doll_runner_s"] = {
			["blight"] = {
				max = 1, 
				chance = 10,
			},
			["j_scrap_memory"] = {
				max = 1, 
				chance = 25,
			},
		},
		["resp_doll_walker_s"] = {
			["blight"] = {
				max = 1, 
				chance = 10,
			},
			["j_scrap_memory"] = {
				max = 1, 
				chance = 25,
			},
		},
		["resp_deformed"] = {
			["food_monster_meat"] = {
				max = 2, 
				chance = 35,
			},
		},
		["resp_deformed_s"] = {
			["j_scrap_memory"] = {
				max = 1, 
				chance = 25,
			},
			["blight"] = {
				max = 1, 
				chance = 10,
			},
		},
		["resp_housewife"] = {
			["food_monster_meat"] = {
				max = 1, 
				chance = 40,
			},
			["hl2_m_shiv_metal"] = {
				max = 1, 
				chance = 10,
			},
		},
		["resp_housewife_s"] = {
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
		["resp_creeper"] = { --add energy thing here
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
		["resp_creeper_w"] = {
			["ichor"] = {
				max = 2, 
				chance = 20,
			},
		},
		["resp_demon"] = {
			["food_monster_meat"] = {
				max = 1, 
				chance = 40,
			},
			["hl2_m_monstertalon"] = {
				max = 2, 
				chance = 15,
			},
		},
		["resp_demon_w"] = {
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
		["resp_demon_s"] = {
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
		["resp_dog"] = { --add teeth or something
			["food_monster_meat"] = {
				max = 1, 
				chance = 40,
			},
		},
		["resp_dog_s"] = {
			["j_scrap_memory"] = {
				max = 1, 
				chance = 30,
			},
			["blight"] = {
				max = 1, 
				chance = 15,
			},
		},
		["resp_drum"] = {
			["food_monster_meat"] = {
				max = 5, 
				chance = 50,
			},
		},
		["resp_drum_s"] = {
			["j_scrap_memory"] = {
				max = 3, 
				chance = 40,
			},
			["blight"] = {
				max = 2, 
				chance = 30,
			},
		},
		["resp_drum_w"] = {
			["food_monster_meat"] = {
				max = 5, 
				chance = 50,
			},
			["ichor"] = {
				max = 2, 
				chance = 30,
			},
		},
		["resp_waste"] = { --add more garbage
			["food_monster_meat"] = {
				max = 2, 
				chance = 50,
			},
			["j_old_rag"] = {
				max = 1, 
				chance = 15,
			},
		},
		["resp_waste_w"] = { --add more garbage
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
		["resp_waste_s"] = {
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
		["resp_hatred"] = {
			["food_monster_meat"] = {
				max = 3, 
				chance = 50,
			},
		},
		["resp_hatred_s"] = {
			["j_scrap_memory"] = {
				max = 3, 
				chance = 50,
			},
			["blight"] = {
				max = 2, 
				chance = 15,
			},
		},
		["resp_haunt"] = {
			["j_scrap_memory"] = {
				max = 2, 
				chance = 25,
			},
		},
		["resp_horror_w"] = {
			["j_scrap_memory"] = {
				max = 2, 
				chance = 25,
			},
			["ichor"] = {
				max = 1, 
				chance = 10,
			},
		},
		["resp_jeffrey"] = {
			["j_scrap_memory"] = {
				max = 5, 
				chance = 75,
			},
			["j_scrap_idea"] = {
				max = 1, 
				chance = 50,
			},
		},
		["resp_leecher"] = { --some kind of plant based stuff drops
			["food_monster_meat"] = {
				max = 3, 
				chance = 50,
			},
		},
		["resp_leecher_s"] = {
			["j_scrap_memory"] = {
				max = 3, 
				chance = 50,
			},
			["j_scrap_memory"] = {
				max = 2, 
				chance = 30,
			},
		},
		["resp_leperkin"] = {
			["food_monster_meat"] = {
				max = 2, 
				chance = 50,
			},
			["hl2_m_monstertalon"] = {
				max = 2, 
				chance = 15,
			},
		},
		["resp_leperkin_w"] = {
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
		["resp_leperkin_s"] = {
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
		["resp_mimic"] = { --energy thing
			["food_monster_meat"] = {
				max = 1, 
				chance = 30,
			},
		},
		["resp_phantom"] = {
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
		["resp_reanimated"] = { --sleeping stuff maybe?
			["food_monster_meat"] = {
				max = 2, 
				chance = 25,
			},
		},
		["resp_reanimated_w"] = {
			["food_monster_meat"] = {
				max = 2, 
				chance = 25,
			},
			["ichor"] = {
				max = 1, 
				chance = 20,
			},
		},
		["resp_roller"] = { --junk or something
			["food_monster_meat"] = {
				max = 2, 
				chance = 25,
			},
		},
		["resp_roller_s"] = {
			["j_scrap_memory"] = {
				max = 2, 
				chance = 25,
			},
			["blight"] = {
				max = 1, 
				chance = 20,
			},
		},
		["resp_static"] = { --electric item thing
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
		["resp_staitjacket"] = {
			["food_monster_meat"] = {
				max = 3, 
				chance = 50,
			},
		},
		["resp_staitjacket_s"] = {
			["j_scrap_memory"] = {
				max = 3, 
				chance = 50,
			},
			["blight"] = {
				max = 1, 
				chance = 30,
			},
		},
		["resp_thrasher"] = {
			["food_monster_meat"] = {
				max = 3, 
				chance = 40,
			},
			["hl2_m_monstertalon"] = {
				max = 2, 
				chance = 15,
			},
		},
		["resp_thrower"] = {
			["food_monster_meat"] = {
				max = 3, 
				chance = 30,
			},
		},
		["resp_thrower_s"] = {
			["j_scrap_memory"] = {
				max = 3, 
				chance = 30,
			},
			["blight"] = {
				max = 1, 
				chance = 20,
			},
		},
		["resp_shambler"] = {
			["j_scrap_memory"] = {
				max = 1, 
				chance = 20,
			},
			["blight"] = {
				max = 1, 
				chance = 10,
			},
		},
		["resp_wraith"] = {
			["ichor"] = {
				max = 2, 
				chance = 25,
			},
		},
		["resp_pack"] = {
			["food_monster_meat"] = {
				max = 2, 
				chance = 25,
			},
			["hl2_m_monstertalon"] = {
				max = 2, 
				chance = 10,
			},
		},
		["resp_pack_s"] = {
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
		["resp_babu_s"] = {
			["j_scrap_memory"] = {
				max = 1, 
				chance = 25,
			},
			["blight"] = {
				max = 1, 
				chance = 15,
			},
		},
		["resp_babu_w"] = {
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
		["resp_baby_s"] = {
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
		["resp_chimera_s"] = {
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
		["resp_dolly_s"] = {
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
		["resp_floater_s"] = {
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
		["resp_gemini_w"] = {
			["j_scrap_memory"] = {
				max = 3, 
				chance = 30,
			},
			["ichor"] = {
				max = 1, 
				chance = 25,
			},
		},
		["resp_ghoul"] = {
			["j_scrap_plastics"] = {
				max = 1, 
				chance = 40,
			},
			["medical_plastic"] = {
				max = 1, 
				chance = 20,
			},
		},
		["resp_ghoul_s"] = {
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
		["resp_leecher_small_s"] = {
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
		["resp_lurker_s"] = {
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
		["resp_paper"] = {
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
		["resp_scarlet"] = {
			["j_scrap_plastics"] = {
				max = 4, 
				chance = 25,
			},
			["medical_plastic"] = {
				max = 2, 
				chance = 20,
			},
		},
		["resp_scarlet_crawl"] = {
			["j_scrap_plastics"] = {
				max = 4, 
				chance = 25,
			},
			["medical_plastic"] = {
				max = 2, 
				chance = 20,
			},
		},
		["resp_scarlet_s"] = {
			["j_scrap_memory"] = {
				max = 2, 
				chance = 40,
			},
			["blight"] = {
				max = 1, 
				chance = 30,
			},
		},
		["resp_scarlet_crawl_s"] = {
			["j_scrap_memory"] = {
				max = 2, 
				chance = 40,
			},
			["blight"] = {
				max = 1, 
				chance = 30,
			},
		},
		["resp_shade_crawl"] = {
			["j_scrap_memory"] = {
				max = 1, 
				chance = 25,
			},
			["blight"] = {
				max = 1, 
				chance = 10,
			},
		},
		["resp_spore"] = { --maybe some other junk in here
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
		PLUGIN:NPCDrop(npc, attacker, inflictor)
	end
	
	function PLUGIN:NPCDrop(npc, attacker, inflictor)
		local dmginfo = npc.deathInfo
		local v = npc:GetVelocity() --velocity
		local className = npc:GetClass()
		
		if(dmginfo) then
			v = v + (dmginfo:GetDamageForce())

			v.z = math.min(v.z, 100)
			
			--if exploded
			if(dmginfo:IsExplosionDamage()) then
				local explosionPos = dmginfo:GetDamagePosition()
				local directionVec = ((npc:GetPos() - explosionPos):GetNormalized())*(dmginfo:GetDamage()*2)

				v = v + (directionVec)
			end
			
			--crossbow
			if(dmginfo:IsDamageType(DMG_NEVERGIB)) then
				-- this is the actual crossbow bolt
				if(IsValid(inflictor)) then
					local directionVec = ((inflictor:GetVelocity()):GetNormalized())*(dmginfo:GetDamage())
				
					v = v + (directionVec)
				end
			end
		end
	
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
						
							local physObj = entity:GetPhysicsObject()
							if(IsValid(physObj)) then
								physObj:SetVelocityInstantaneous(v)
							end
						end
					end)
				end
			end
		end
	end
end