nut.command.add("charselectskin", {
	syntax = "[number skin]",
	onRun = function(client, arguments)
		local skin = tonumber(arguments[1])
		local target = client

		if (IsValid(target) and target:getChar()) then
			target:getChar():setData("skin", skin)
			target:SetSkin(skin or 0)

			--nut.util.notifyLocalized("cChangeSkin", nil, client:Name(), target:Name(), skin or 0)
		end
	end
})

nut.command.add("charselectbodygroup", {
	syntax = "<string bodyGroup> [number value]",
	onRun = function(client, arguments)
		local value = tonumber(arguments[2])
		local target = client

		if (IsValid(target) and target:getChar()) then
			local index = target:FindBodygroupByName(arguments[1])

			if (index > -1) then
				if (value and value < 1) then
					value = nil
				end

				local groups = target:getChar():getData("groups", {})
					groups[index] = value
				target:getChar():setData("groups", groups)
				target:SetBodygroup(index, value or 0)

				--nut.util.notifyLocalized("cChangeGroups", nil, client:Name(), target:Name(), arguments[2], value or 0)
			else
				return "@invalidArg", 2
			end
		end
	end
})

nut.command.add("roll", {
	syntax = "[number maximum]",
	onRun = function(client, arguments)
		local rolled = math.random(0, math.min(tonumber(arguments[1]) or 100, 100))
		nut.log.add(client:Name().." rolled \""..rolled.."\"")	
		nut.chat.send(client, "roll", rolled)
	end
})

nut.command.add("sccircle", {
	adminOnly = true,
	syntax = "<string name> [num radius] [num mannequins] [num rings] [num chance]",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
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
	end
})

function flashlightFlicker(target, times)
	if(times > 0) then
		timer.Simple(math.random(1, 3),
			function()
				if (target:FlashlightIsOn()) then
					target:Flashlight(false)
				else
					target:Flashlight(true)
				end
				flashlightFlicker(target, times-1)
			end
		)
	end
end

nut.command.add("scflicker", {
	adminOnly = true,
	syntax = "<string name> [num times]",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		local times = tonumber(arguments[2]) or 10
		if(target:getChar() and !target:getChar():getInv():hasItem("flashlight_shard")) then
			client:notifyLocalized("Flickering.")
			flashlightFlicker(target, times)
		else
			client:notifyLocalized("Not flickering.")
		end
	end
})

nut.command.add("scwhisper", {
	adminOnly = true,
	syntax = "<string name>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1]) or client
		--local times = tonumber(arguments[2]) or 10
		local whispers = {}
		whispers[0] = "chorror/emily_reversed1.wav"
		whispers[1] = "chorror/emily_reversed3.wav"
		whispers[2] = "chorror/emily_reversed5.wav"
		whispers[3] = "chorror/emily_reversed9.wav"
		whispers[4] = "chorror/psstleft.wav"
		whispers[5] = "chorror/psstright.wav"
		
		target:ConCommand( "play " .. whispers[math.random(0,5)] )
	end
})

nut.command.add("scemit", {
	adminOnly = true,
	syntax = "<string soundpath> <int soundlevel=70 (50-100)> <int pitch=100 (30-255)>",
	onRun = function(client, arguments)
	local soundLevel = tonumber(arguments[2] or 70)	
	local pitch = tonumber(arguments[3] or 100)
	if( pitch > 29 and pitch < 256  ) then
		client:EmitSound(arguments[1], soundLevel, pitch);
		client:notifyLocalized("Emitting a sound: " .. arguments[1] )
	else
		client:notifyLocalized("The pitch needs to be between 30 and 255!")
	end
	end
})

nut.command.add("scsound", {
	adminOnly = true,
	syntax = "<string name> <string soundpath>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1]) or client	
		target:ConCommand( "play " .. arguments[2] )		
	end
})

nut.command.add("scdummy", {
	adminOnly = true,
	syntax = "<string name>",
	onRun = function(client, arguments)
	
		local target = nut.command.findPlayer(client, arguments[1]) or client		
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
   end
})

nut.command.add("sccircle2", {
	adminOnly = true,
	syntax = "<string name> [num radius] [num mannequins] [num rings] [num chance] [num removedelay]",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
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
	end
   
})

nut.command.add("plasticdust", {
	syntax = "<string attribute>",
	onRun = function(client, arguments)
		local char = client:getChar()
		if(char:getFaction() != FACTION_PLASTIC) then
			client:notifyLocalized("Only Plastics can do this.")
			return false
		end

		local lastDust = char:getData("lastDust")
			
		if(!lastDust) then
			char:setData("lastDust", 0)
			lastDust = 0
		end
			
		if(lastDust and math.abs(tonumber(lastDust) - tonumber(os.date("%d"))) >= 3) then -- harvest once every 3 days.
			nut.item.spawn("medical_plastic", client:getItemDropPos())
			client:notifyLocalized("You have harvested plastic dust from yourself.")
		else
			client:notifyLocalized("You can only harvest plastic from yourself once every 3 days.")
		end
	end
})