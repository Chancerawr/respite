local PLUGIN = PLUGIN
PLUGIN.name = "Weird Effects"
PLUGIN.author = "???"
PLUGIN.desc = "A weird visual effect thing."

if(CLIENT) then
	local cache = { }
	local timercache = { }
	local modelcache = { }

	local floating = {
		"models/food/hotdog.mdl",
		"models/foodnhouseholditems/hotdog.mdl",
	}

	local CreatePhysModel = function(mdl)
		local ent = ents.CreateClientProp()
		ent:SetModel(mdl)
		ent:PhysicsInit(SOLID_VPHYSICS)
		ent:SetMoveType(MOVETYPE_VPHYSICS)
		ent:SetSolid(SOLID_VPHYSICS)

		table.insert(modelcache, ent)

		return ent
	end

	local CreateModel = function(mdl, isragdoll)
		local ent

		if isragdoll then
			ent = ClientsideRagdoll(mdl)
		else
			ent = ClientsideModel(mdl, RENDERGROUP_OTHER)
		end
	  
		table.insert(modelcache, ent)
	  
		return ent
	end

	local NewHookAdd = function(str, name, func)
		--name = "dronesrewrite_hell_hooks" .. name
		hook.Add(str, name, func)
	  
		table.insert(cache, {
			str = str,
			name = name
		})
	end

	local NewTimerSimple = function(time, func)
		local name = "hotdog_rain_timers" .. table.Count(timercache)
		timer.Create(name, time, 1, func)
	  
		table.insert(timercache, {
			name = name
		})
	end

	local StopTimers = function() for k, v in pairs(timercache) do timer.Destroy(v.name) end end
	local RemoveHooks = function() for k, v in pairs(cache) do hook.Remove(v.str, v.name) end end
	local RemoveModels = function() for k, v in pairs(modelcache) do SafeRemoveEntity(v) end end

	local function hotdogStop()
		RemoveHooks()
		StopTimers()
		RemoveModels()

		hotdogRainEnabled = false
	end

	local function hotdogRain()
		local FallingModels = {}
		local FloatingModels = {}
	  
		local Const = 1.2

		for i = 1, 300 do
			local floating = {
				"models/food/hotdog.mdl",
				"models/foodnhouseholditems/hotdog.mdl",
			}
		
			local e = CreateModel(floating[math.random(#floating)])
			e:SetModelScale(math.Rand(10, 30), 0)
			e:SetAngles(AngleRand())
		
			local vec = VectorRand() * 12000
			vec.z = math.abs(vec.z) / 3
			e:SetPos(LocalPlayer():GetPos() + vec)
			e:Spawn()

			e.RotDir = math.random(-1, 1)
			e.ZDist = math.Rand(1, 10)
			e.ZSpeed = math.Rand(0.3, 1.1)
		
			FloatingModels[i] = e
		end
	  
		NewTimerSimple(180, function()
			hotdogStop()
		end)
		
		NewHookAdd("Think", "counthotdog", function()
			if Const < 1.2 then 
				Const = math.Approach(Const, 1, 0.0015)
			else
				for i = 1, math.random(1, 3) do
					local newmdl = table.Random(floating)
					local e = CreateModel(newmdl)
					local scale = math.Rand(0.5, 2)

					e:SetModelScale(scale, 0)
					e:SetAngles(VectorRand():Angle())
				
					local vec = VectorRand() * 2000
					vec.z = vec.z / 2
					vec = LocalPlayer():GetPos() + vec + Vector(0, 0, 420)
					  
					e:SetPos(vec)
					e:Spawn()
					e.Speed = math.Rand(1, 3)

					--ParticleEffectAttach("skull_trail", PATTACH_ABSORIGIN_FOLLOW, e, 0)
					
					table.insert(FallingModels, e)
				end
			end
		
			for k, v in pairs(FallingModels) do
				if v:IsValid() then
					v:SetPos(v:GetPos() - Vector(0, 0, v.Speed))
					if v:GetPos().z <= LocalPlayer():GetPos().z then v:Remove() end
				end
			end
		
			for k, v in pairs(FloatingModels) do 
				local pos = v:GetPos()
				pos.z = pos.z + math.sin(CurTime() * v.ZSpeed) * v.ZDist
				
				v:SetPos(pos)
			  
				v:SetAngles(Angle(0, CurTime() * 15 * v.RotDir, 0))
			end
		end)
	end

	local function hotdogStart()
		if hotdogRainEnabled then return end
		hotdogRainEnabled = true
		
		hotdogRain()
	end

	concommand.Add("hotdogstart", hotdogStart)
	concommand.Add("hotdogstop", hotdogStop)
end

nut.command.add("hotdogstart", {
	adminOnly = true,
	syntax = "<string name>",
	onRun = function(client, arguments)
		for k, client in ipairs(player.GetAll()) do
			client:ConCommand("hotdogstart")
		end
	end
})

nut.command.add("hotdogstop", {
	adminOnly = true,
	syntax = "<string name>",
	onRun = function(client, arguments)
		for k, client in ipairs(player.GetAll()) do
			client:ConCommand("hotdogstop")
		end
	end
})