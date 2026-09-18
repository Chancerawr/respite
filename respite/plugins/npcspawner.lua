local PLUGIN = PLUGIN
PLUGIN.name = "NPC Spawner"
PLUGIN.author = "Black Tea (NS 1.0), Neon (NS 1.1)"
PLUGIN.desc = "NPC Spawner."
PLUGIN.spawnpoints = PLUGIN.spawnpoints or {}

nut.config.add("spawner_enabled", true, "Whether NPC spawners are on or not.", nil, {
	category = "NPC Spawner"
})

nut.config.add("npc_spawnrate", 90, "How often an npc will be spawned at an npc spawn point.", nil, {
	data = {min = 1, max = 84600},
	category = "NPC Spawner"
})

nut.config.add("npc_maxnpcs", 100, "How many npcs the spawner is allowed to spawn at once.", nil, {
	data = {min = 1, max = 84600},
	category = "NPC Spawner"
})

PLUGIN.spawngroups = {
	["outside"] = {
		["resp_waste"] = 25,
		["resp_spore"] = 5,
		["resp_drum"] = 1,
		["resp_dog"] = 3,
		["resp_chimera"] = 2,
		["resp_leecher_small"] = 4,
		["resp_spider"] = 1,
		["resp_babu"] = 3,
		["resp_smog"] = 5,
		["resp_vomit"] = 4,
		["resp_torrent"] = 3,
		["resp_club"] = 1,
	},
	["inside"] = {
		["resp_waste"] = 25,
		["resp_reanimated"] = 5,
		["resp_amputated"] = 10,
		["resp_pack"] = 5,
		["resp_spore"] = 4,
		["resp_dolly"] = 2,
		["resp_baby"] = 2,
		["resp_smog"] = 3,
	},
	["hiders"] = {
		["resp_amputated"] = 20,
		["resp_pack"] = 10,
		["resp_spore"] = 5,
		["resp_reanimated"] = 5,
		["resp_dolly"] = 3,
		["resp_doll_walker"] = 3,
		["resp_doll_runner"] = 3,
		["resp_baby"] = 3,
	},
	["shade"] = {
		["resp_shambler"] = 25,
		["resp_waste_s"] = 5,
		["resp_babu_s"] = 5,
		["resp_amputated_s"] = 3,
		["resp_dolly_s"] = 4,
		["resp_chimera_s"] = 3,
		["resp_vomit_s"] = 2,
		["resp_shade_crawl"] = 2,
		["pack_s"] = 3,
	},
	["wraith"] = {
		["resp_haunt"] = 20,
		["resp_phantom"] = 10,
		["resp_belmer"] = 5,
		["resp_amputated_w"] = 3,
		["resp_reanimated_w"] = 4,
		["resp_skinless_w"] = 4,
		["resp_demon_w"] = 2,
		["resp_horror_w"] = 1,
		["resp_wraith"] = 1,
	},
	["memory"] = {
		["resp_haunt"] = 25,
		["resp_belmer"] = 10,
		["resp_babu_w"] = 5,
		["resp_scramble"] = 4,
		["resp_gemini_w"] = 2,
		["resp_tripod_small"] = 1,
	},
	["abom"] = {
		["resp_waste"] = 25,
		["resp_amputated"] = 5,
	},
	
	["war_abom"] = {
		["resp_waste"] = 70,
		["resp_amputated"] = 50,
		["resp_spore"] = 45,
		["resp_smog"] = 30,
		["resp_torrent"] = 25,
		["resp_cof_faceless"] = 25,
		["resp_cof_faster"] = 25,
		["resp_lyingfigure"] = 20,
		["resp_vomit"] = 12,
		["resp_leecher_small"] = 12,
		["resp__demon"] = 12,
		["resp_skinless"] = 12,
		["resp__thrower"] = 12,
		["resp_chimera"] = 11,
		["resp_zm_charred"] = 10,
		["resp_lurker"] = 10,
		["resp_flayer"] = 10,
		["resp_cof_crazywoman"] = 10,
		["resp_cof_child"] = 10,
		["resp_babu"] = 10,
		["resp_thrasher"] = 5,
		["resp_gemini"] = 5,
		["resp_hatred"] = 5,
		["resp_pendulum"] = 5,
	},
	
	["war_shade"] = {
		["resp_shambler"] = 25,
		["resp_waste_s"] = 18,
		["resp_babu_s"] = 12,
		["resp_dolly_s"] = 8,
		["pack_s"] = 5,
		["resp_thrower_s"] = 5,
		["resp_vomit_s"] = 5,
		["resp_chimera_s"] = 3,
		["resp_teleporter"] = 2,
		["resp_floater_s"] = 2,
		["resp_scarlet_s"] = 2,
		["resp_stranger"] = 1,
	},
	
	["war_wraith"] = {
		["resp_haunt"] = 30,
		["resp_phantom"] = 20,
		["resp_belmer"] = 15,
		["resp_reanimated_w"] = 12,
		["resp_waste_w"] = 10,
		["resp_housewife"] = 10,
		["resp_amputated_w"] = 8,
		["resp_leperkin_w"] = 5,
		["resp_scramble"] = 5,
		["resp_wraith"] = 6,
		["resp_creeper_w"] = 4,
		["resp_gemini_w"] = 3,
		["resp_saw"] = 2,
		["resp_guardian"] = 1,
	},
	
	["nightmare"] = {
		["resp_dreamless"] = 40,
		["resp_torso_dreamless"] = 5,
		["resp_dreamless_splitter"] = 1,
	},
	
	["husk"] = {
		["resp_skin"] = 50,
		["resp_excited"] = 15,
		["resp_twitch"] = 15,
		["resp_leaper"] = 10,
		["resp_hi"] = 2,
		["resp_mirror"] = 2,
		["resp_angel"] = 1,
	},
	
	["fiend"] = {
		["resp_fiend"] = 50,
		["resp_fiend_bloodbag"] = 10,
		["resp_mannequin_fiend"] = 8,
		["resp_fiend_cracked"] = 5,
		["resp_fiend_stalker"] = 1,
	},
	
	["worm"] = {
		["resp_deformed_worm"] = 60,
		["resp_lurker_worm"] = 40,
		["resp_skinless"] = 20,
		["resp_demon_worm"] = 20,
		["resp_gemini_worm"] = 10,
		["resp_hatred_worm"] = 5,
		["resp_spore"] = 5,
		["resp_thrasher"] = 1,
		["resp_flayer"] = 1,
	},
}

PLUGIN.maxnpcs = 100
PLUGIN.spawnedNPCs = PLUGIN.spawnedNPCs or {}

if SERVER then
	local spawntime = 1
	
	local function GetWeightedRandomKey(npcs)
		local sum = 0
		
		for _, spawnChance in pairs(npcs) do
			sum = sum + (spawnChance or 1)
		end

		local select = math.random() * sum

		for className, spawnChance in pairs(npcs) do
			select = select - (spawnChance or 1)
			if select < 0 then 
				return className
			end
		end
	end
	
	function PLUGIN:getWeightedRandomNPC(npcs)
		return GetWeightedRandomKey(npcs)
	end
	
	function PLUGIN:Think()
		if spawntime > CurTime() then return end
		spawntime = CurTime() + nut.config.get("npc_spawnrate", 90)
		for k, v in ipairs(self.spawnedNPCs) do
			if (!v:IsValid()) then
				table.remove(self.spawnedNPCs, k)
			end
		end

		if(!nut.config.get("spawner_enabled", false)) then return end
		if #self.spawnedNPCs >= nut.config.get("npc_maxnpcs", 40) then return end
		
		local v = table.Random(self.spawnpoints)
		if (!v) then return end

		if(!self.spawngroups) then
			return
		end
		
		local groupName = v[2]
		
		--local idat = table.Random(self.spawngroups[v[2]] or self.spawngroup["default"])
		local className = PLUGIN:getWeightedRandomNPC(self.spawngroups[groupName])

		local nearby = false 
		local players = player.GetAll()
		
		local spawnPos = v[1]  + Vector(0, 0, 1)
		
		--dont want to spawn them in too close to players
		if(players) then
			for k, v in pairs(players) do
				if(v:GetMoveType() == MOVETYPE_NOCLIP) then
					continue
				end
			
				if v:GetPos():DistToSqr(spawnPos) < 1000 * 1000 then --squared is more efficient
					nearby = true
					break
				end
			end
		end
		
		if (!nearby) then --dont want the npcs to stack on each other or spawn inside something.
			local ent = ents.Create(className)

			if (IsValid(ent)) then
				spawnPos = spawnPos + Vector(0,0,25)
			
				ent:SetPos(spawnPos)
				ent:Spawn()
				
				local data = {}
					data.start = spawnPos --position value
					data.endpos = spawnPos
					data.filter = {ent}
				local trace = util.TraceEntity(data, ent)--util.TraceHull(data)
				
				if(IsValid(trace.Entity) or trace.HitWorld or !util.IsInWorld(spawnPos)) then
					SafeRemoveEntity(ent)
					return false
				end
				
				table.insert(self.spawnedNPCs, ent)
			end
		end
	end

	function PLUGIN:LoadData()
		self.spawnpoints = self:getData() or {}
	end

	function PLUGIN:SaveData()
		self:setData(self.spawnpoints)
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
			smoke:SetColor(255,50,50)
			smoke:SetAirResistance(300)
		end
	end)

end

nut.command.add("npcspawnadd", {
	adminOnly = true,
	syntax = "<string npcgroup>",
	onRun = function(client, arguments)
		local trace = client:GetEyeTraceNoCursor()
		local hitpos = trace.HitPos + trace.HitNormal*5
		local spawngroup = arguments[1] or "default"
		
		if(PLUGIN.spawngroups[spawngroup]) then
			table.insert(PLUGIN.spawnpoints, {hitpos, spawngroup})
			client:notify("You added ".. spawngroup .. " npc spawner.")
		else
			client:notify("Invalid spawngroup.")
		end
	end
})

nut.command.add("npcspawnremove", {
	adminOnly = true,
	onRun = function(client, arguments)
		local trace = client:GetEyeTraceNoCursor()
		local hitpos = trace.HitPos + trace.HitNormal*5
		local range = arguments[1] or 128
		local mt = 0
		
		for k, v in pairs( PLUGIN.spawnpoints ) do
			local distance = v[1]:DistToSqr(hitpos)
			if distance <= tonumber(range) * tonumber(range) then
				PLUGIN.spawnpoints[k] = nil
				mt = mt + 1
			end
		end
		
		client:notify(mt .. " npc spawners has been removed.")
	end
})

nut.command.add("npcspawndisplay", {
	adminOnly = true,
	onRun = function(client, arguments)
		if SERVER then
			netstream.Start(client, "nut_DisplaySpawnPoints", PLUGIN.spawnpoints)
			client:notify("Displayed All Points for 10 secs.")
		end
	end
})

nut.command.add("npcspawntoggle", {
	adminOnly = true,
	onRun = function(client, arguments)
		if(nut.config.get("spawner_enabled", false)) then
			nut.config.set("spawner_enabled", false)
			client:notify("NPC Spawners have been turned off.")
		else
			nut.config.set("spawner_enabled", true)
			client:notify("NPC Spawners have been turned on.")
		end
	end
})