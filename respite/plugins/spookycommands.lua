PLUGIN.name = "Spooky Commands"
PLUGIN.author = "Luna & Chancer"
PLUGIN.desc = "Some commands that do spooky things to people."

--this is global and that's annoying
function flashlightFlicker(target, times)
	if(times > 0) then
		timer.Simple(math.random(1, 3), function()
			if (target:FlashlightIsOn()) then
				target:Flashlight(false)
			else
				target:Flashlight(true)
			end
			flashlightFlicker(target, times-1)
		end)
	end
end

nut.command.add("scflicker", {
	adminOnly = true,
	syntax = "<string name> [num times]",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		local times = tonumber(arguments[2]) or 10
		if(target:getChar() and !target:getChar():getInv():getFirstItemOfType("flashlight_shard")) then
			client:notify("Flickering.")
			flashlightFlicker(target, times)
		else
			client:notify("Not flickering.")
		end
	end
})

nut.command.add("scwhisper", {
	adminOnly = true,
	syntax = "<string name>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1]) or client
		
		if(target) then
			--local times = tonumber(arguments[2]) or 10
			local whispers = {}
			whispers[0] = "chorror/emily_reversed1.wav"
			whispers[1] = "chorror/emily_reversed3.wav"
			whispers[2] = "chorror/emily_reversed5.wav"
			whispers[3] = "chorror/emily_reversed9.wav"
			whispers[4] = "chorror/psstleft.wav"
			whispers[5] = "chorror/psstright.wav"
			
			target:ConCommand( "play " .. whispers[math.random(0,5)] )
		else
			client:notify("Invalid target")
		end
	end
})

nut.command.add("scemit", {
	adminOnly = true,
	syntax = "<string soundpath> <int soundlevel=70 (50-100)> <int pitch=100 (30-255)>",
	onRun = function(client, arguments)
		local soundLevel = tonumber(arguments[2] or 70)	
		local pitch = math.Clamp(tonumber(arguments[3] or 100), 30, 256)
		client:EmitSound(arguments[1], soundLevel, pitch)
		client:notify("Emitting a sound: " .. arguments[1])
	end
})

nut.command.add("scsound", {
	adminOnly = true,
	syntax = "<string name> <string soundpath>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		
		if(target) then
			target:ConCommand( "play " .. arguments[2] )
		else
			client:notify("Invalid target")
		end
	end
})

nut.command.add("scteleport", {
	adminOnly = true,
	syntax = "<string name> <string soundpath>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		
		if(target) then
			target:ScreenFade(SCREENFADE.IN, Color(0, 0, 0, 255), 1, 5)
			
			--From Evolve admin mod
			local size = Vector( 32, 32, 72 )
			local tr = {}
			tr.start = client:GetShootPos()
			tr.endpos = client:GetShootPos() + client:GetAimVector() * 100000000
			tr.filter = client
			local trace = util.TraceEntity(tr, client)
			
			local EyeTrace = client:GetEyeTraceNoCursor()
			if (trace.HitPos:Distance(EyeTrace.HitPos) > size:Length()) then -- It seems the player wants to teleport through a narrow spot... Force them there even if there is something in the way.
				trace = EyeTrace
				trace.HitPos = trace.HitPos + trace.HitNormal * size * 1.2
			end
			
			target:SetPos(trace.HitPos + trace.HitNormal * size)
			target:SetLocalVelocity(Vector(0,0,0))
		else
			client:notify("Invalid target")
		end
	end
})

nut.command.add("scdummy", {
	adminOnly = true,
	syntax = "<string name>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		
		if(!target) then
			local dummyPos, dummyDirection = target:GetPos() + target:GetForward() * 60 + Vector(0, 0, 40), target:GetForward() * -1
			local dummy = ents.Create("prop_physics")
			dummy:SetModel("models/nh2_gmn/dave_the_dummy_on_stand.mdl")
			dummy:SetAngles(dummyDirection:Angle() + Angle(0, 90, 0))
			dummy:SetPos(dummyPos)
			dummy:SetSkin(2)
			dummy:Spawn()
			dummy:EmitSound("respite/scare2.wav", 100, 100)
			ParticleEffectAttach("Advisor_Pod_Explosion_Smoke", 1, dummy, 1)
		   
			local phys = dummy:GetPhysicsObject()
	 
			if phys and phys:IsValid() then
			phys:EnableMotion(false) -- Freezes the object in place.
			end
			
			target:Freeze( true )
			target:SetFOV( 50, 0.2 )
			
			timer.Simple(1.6, function()
				dummy:Remove()
				target:SetFOV( 0, 1 )
				target:Freeze( false )
			end)
		else
			client:notify("Invalid target")
		end
   end
})

nut.command.add("sccircle", {
	adminOnly = true,
	syntax = "<string name> [num radius] [num mannequins] [num rings] [num chance]",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		
		if(target) then
			local position = target:GetPos() + Vector(0,0,40)
			local radius = tonumber(arguments[2]) or 100
			local mannNum = tonumber(arguments[3]) or 10
			local rings = tonumber(arguments[4]) or 1
			local chance = tonumber(arguments[5]) or 100

			local sngInc
			local yang
			
			for j = 1, rings do
				mannNum = mannNum + (j - 1)*2
				radius = radius + 30
				for i = 1, mannNum do
					if(math.random(0,100) <= chance) then
						local mannequin = ents.Create("prop_physics")
						
						angInc = 360/mannNum
						yang = i*angInc
						
						local x = (radius) * math.cos(((yang)/180) * math.pi)
						local y = (radius) * math.sin(((yang)/180) * math.pi)
						
						mannequin:SetPos(position + Vector(x,y,0))
						mannequin:SetAngles(Angle(0,yang - 90,0))
						
						mannequin:SetModel("models/nh2_gmn/dave_the_dummy_on_stand_phys.mdl")
						mannequin:Spawn()
						mannequin:SetSolid(SOLID_VPHYSICS)
						mannequin:PhysicsInit(SOLID_VPHYSICS)
					end
				end
			end
		else
			client:notify("Invalid target")
		end
	end
})

nut.command.add("sccircle2", {
	adminOnly = true,
	syntax = "<string name> [num radius] [num mannequins] [num rings] [num chance] [num removedelay]",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		
		if(target) then
			local position = target:GetPos() + Vector(0,0,40)
			local radius = tonumber(arguments[2]) or 100
			local mannNum = tonumber(arguments[3]) or 10
			local rings = tonumber(arguments[4]) or 1
			local chance = tonumber(arguments[5]) or 100
			local removedelay = tonumber(arguments[6]) or 2

			local sngInc
			local yang
			
			for j = 1, rings do
				mannNum = mannNum + (j - 1)*2
				radius = radius + 30
				for i = 1, mannNum do
					if(math.random(0,100) <= chance) then
						local mannequin = ents.Create("prop_physics")
						
						angInc = 360/mannNum
						yang = i*angInc
						
						local x = (radius) * math.cos(((yang)/180) * math.pi)
						local y = (radius) * math.sin(((yang)/180) * math.pi)
						
						mannequin:SetPos(position + Vector(x,y,0))
						mannequin:SetAngles(Angle(0,yang - 90,0))
						ParticleEffectAttach("Advisor_Pod_Explosion_Smoke", 1, mannequin, 1)
						mannequin:SetModel("models/nh2_gmn/dave_the_dummy_on_stand_phys.mdl")
						mannequin:Spawn()
						mannequin:SetSolid(SOLID_VPHYSICS)
						mannequin:PhysicsInit(SOLID_VPHYSICS)
								local whispers = {}
			whispers[0] = "chorror/emily_reversed1.wav"
			whispers[1] = "chorror/emily_reversed3.wav"
			whispers[2] = "chorror/emily_reversed5.wav"
			whispers[3] = "chorror/emily_reversed9.wav"
			whispers[4] = "chorror/psstleft.wav"
			whispers[5] = "chorror/psstright.wav"
			
			mannequin:EmitSound( whispers[math.random(0,5)] )
					timer.Simple(removedelay, function()
						mannequin:Remove()
					   end)
					end
				end
			end
		else
			client:notify("Invalid target")
		end		
	end
})

sound.Add({
	name = "spook1",
	channel = CHAN_AUTO,
	volume = 1.0,
	level = 70,
	pitch = { 80, 100 },
	sound = "respite/scarerhang.wav"
})

nut.command.add("sccircle3", {
	adminOnly = true,
	syntax = "<string name> [num radius] [num mannequins] [num rings] [num chance] [num removedelay]",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		
		if(target) then
			local position = target:GetPos() + Vector(0,0,40)
			local radius = tonumber(arguments[2]) or 20
			local mannNum = tonumber(arguments[3]) or 6
			local rings = tonumber(arguments[4]) or 1
			local chance = tonumber(arguments[5]) or 100
			local removedelay = tonumber(arguments[6]) or 1

			local sngInc
			local yang
			
			for j = 1, rings do
				mannNum = mannNum + (j - 1)*2
				radius = radius + 30
				for i = 1, mannNum do
					if(math.random(0,100) <= chance) then
						local mannequin = ents.Create("prop_physics")
						
						angInc = 360/mannNum
						yang = i*angInc
						
						local x = (radius) * math.cos(((yang)/180) * math.pi)
						local y = (radius) * math.sin(((yang)/180) * math.pi)
						
						mannequin:SetPos(position + Vector(x,y,0))
						mannequin:SetAngles(Angle(0,yang - 90,0))
						mannequin:SetModel("models/nh2_gmn/dave_the_dummy_on_stand_phys.mdl")
						mannequin:Spawn()
						mannequin:PhysicsDestroy()
						mannequin:SetSolid(SOLID_VPHYSICS)
						-- mannequin:PhysicsInit(SOLID_VPHYSICS)
						
						util.ScreenShake( mannequin:GetPos(), 5, 5, removedelay + 1, 300 )	
						mannequin:EmitSound( "spook1" )
						
					timer.Simple(removedelay, function()
						mannequin:Remove()
						mannequin:StopSound( "spook1" )
					   end)
					end
				end
			end
		else
			client:notify("Invalid target")
		end
	end 
})