local PLUGIN = PLUGIN
PLUGIN.name = "NPC Spawner"
PLUGIN.author = "Black Tea (NS 1.0), Neon (NS 1.1)"
PLUGIN.desc = "NPC Spawner."
PLUGIN.spawnpoints = PLUGIN.spawnpoints or {}

nut.config.add("spawner_enabled", true, "Whether NPC spawners are on or not.", nil, {
	category = "NPC Spawner"
})

PLUGIN.spawngroups = {
	["default"] = {
		"nz_freak",
		"amputated",
		"pack"
	},
	["outside"] = {
		"nz_freak",
		"spore",
		"nz_drum",
		"resp_chimera",
		"resp_babu"
	},
	["inside"] = {
		"nz_freak",
		"amputated",
		"pack",
		"resp_dolly",
		"resp_baby"
	},
	["shade"] = {
		"nz_freak_shade",
		"amputated_shade",
		"pack_shade",
	},
	["abom"] = {
		"amputated",
		"nz_freak",
	},
}

PLUGIN.spawnrate = 120
PLUGIN.maxnpcs = 40
PLUGIN.spawnedNPCs = PLUGIN.spawnedNPCs or {}

if SERVER then
	local spawntime = 1

	function PLUGIN:Think()
		if spawntime > CurTime() then return end
		spawntime = CurTime() + self.spawnrate
		for k, v in ipairs(self.spawnedNPCs) do
			if (!v:IsValid()) then
				table.remove(self.spawnedNPCs, k)
			end
		end

		if #self.spawnedNPCs >= self.maxnpcs then return end

		local v = table.Random(self.spawnpoints)

		if(!nut.config.get("spawner_enabled", false)) then
			return
		end
		
		if (!v) then
			return
		end

		local data = {}
		data.start = v[1]
		data.endpos = data.start + Vector(0, 0, 1)
		data.filter = client
		data.mins = Vector(-16, -16, 0)
		data.maxs = Vector(16, 16, 16)

		local idat = table.Random(self.spawngroups[v[2]]) or self.spawngroup["default"]

		--nut.item.spawn(idat, v[1] + Vector( math.Rand(-8,8), math.Rand(-8,8), 20 ), nil, AngleRand())
			
		local trace = util.TraceHull(data)

		
		local nearby = false 
		local players = player.GetAll()
		
		--dont want to spawn them in too close to players
		if(players) then
			for k, v in pairs(players) do
				if(v:GetMoveType() == MOVETYPE_NOCLIP) then
					continue
				end
			
				if v:GetPos():Distance(data.endpos) < 1000 then
					nearby = true
					break
				end
			end
		end
		
		if (!nearby and !trace.Entity:IsValid()) then --dont want the npcs to stack on each other or spawn inside something.
			local ent = ents.Create(idat)
			
			table.insert(self.spawnedNPCs, ent)
				
			if (ent:IsValid()) then
				ent:SetPos(data.endpos + Vector(0,0,25))
				ent:Spawn()
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
		table.insert( PLUGIN.spawnpoints, { hitpos, spawngroup } )
		client:notify( "You added ".. spawngroup .. " npc spawner." )
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
			local distance = v[1]:Distance( hitpos )
			if distance <= tonumber(range) then
				PLUGIN.spawnpoints[k] = nil
				mt = mt + 1
			end
		end
		client:notify( mt .. " npc spawners has been removed.")
	end
})

nut.command.add("npcspawndisplay", {
	adminOnly = true,
	onRun = function(client, arguments)
		if SERVER then
			netstream.Start(client, "nut_DisplaySpawnPoints", PLUGIN.spawnpoints)
			client:notify( "Displayed All Points for 10 secs." )
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