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
		["nz_freak"] = 25,
		["spore"] = 5,
		["nz_drum"] = 1,
		["nz_dog"] = 3,
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
		["nz_freak"] = 25,
		["nz_reanimated"] = 5,
		["amputated"] = 10,
		["pack"] = 5,
		["spore"] = 4,
		["resp_dolly"] = 2,
		["resp_baby"] = 2,
		["resp_smog"] = 3,
	},
	["hiders"] = {
		["amputated"] = 20,
		["pack"] = 10,
		["spore"] = 5,
		["nz_reanimated"] = 5,
		["resp_dolly"] = 3,
		["doll_walker"] = 3,
		["doll_runner"] = 3,
		["resp_baby"] = 3,
	},
	["shade"] = {
		["nz_undead_shade"] = 25,
		["nz_freak_shade"] = 5,
		["resp_babu_shade"] = 5,
		["amputated_shade"] = 3,
		["resp_dolly_shade"] = 4,
		["resp_chimera_shade"] = 3,
		["resp_vomit_shade"] = 2,
		["shade_crawlsmoke"] = 2,
		["pack_shade"] = 3,
	},
	["wraith"] = {
		["nz_haunt"] = 20,
		["nz_phantom"] = 10,
		["resp_belmer"] = 5,
		["amputated_flame"] = 3,
		["nz_reanimated_flame"] = 4,
		["resp_skinless_wraith"] = 4,
		["nz_demon_flame"] = 2,
		["nz_horror_red"] = 1,
		["nz_wraith"] = 1,
	},
	["memory"] = {
		["nz_haunt"] = 25,
		["resp_belmer"] = 10,
		["resp_babu_wraith"] = 5,
		["resp_scramble"] = 4,
		["resp_gemini_wraith"] = 2,
		["resp_tripod_small"] = 1,
	},
	["abom"] = {
		["nz_freak"] = 25,
		["amputated"] = 5,
	},
	
	["war_abom"] = {
		["nz_freak"] = 70,
		["amputated"] = 50,
		["spore"] = 45,
		["resp_smog"] = 30,
		["resp_torrent"] = 25,
		["cof_faceless"] = 25,
		["resp_lyingfigure"] = 20,
		["resp_vomit"] = 12,
		["resp_leecher_small"] = 12,
		["nz_demon"] = 12,
		["nz_thrower"] = 12,
		["resp_chimera"] = 11,
		["resp_zm_charred"] = 10,
		["resp_lurker"] = 10,
	},
	
	["war_shade"] = {
		["nz_undead_shade"] = 25,
		["nz_freak_shade"] = 18,
		["resp_babu_shade"] = 12,
		["resp_dolly_shade"] = 8,
		["pack_shade"] = 5,
		["nz_thrower_shade"] = 5,
		["resp_vomit_shade"] = 5,
		["resp_chimera_shade"] = 3,
		["resp_teleporter"] = 2,
		["resp_floater_shade"] = 2,
		["scarlet_shade"] = 2,
		["resp_stranger"] = 1,
	},
	
	["war_wraith"] = {
		["nz_haunt"] = 30,
		["nz_phantom"] = 20,
		["resp_belmer"] = 15,
		["nz_reanimated_flame"] = 12,
		["nz_freak_ice"] = 10,
		["housewife"] = 10,
		["amputated_flame"] = 8,
		["nz_leperkin_flame"] = 5,
		["resp_scramble"] = 5,
		["nz_wraith"] = 6,
		["nz_creeper_wraith"] = 4,
		["resp_gemini_wraith"] = 3,
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