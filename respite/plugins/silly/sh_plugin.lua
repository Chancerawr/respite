local PLUGIN = PLUGIN
PLUGIN.name = "Silly Items"
PLUGIN.author = " "
PLUGIN.desc = "What"

--jusagi yourself
if(CLIENT) then
	concommand.Add("jusagi", function(ply, cmd, args)
		if(!ply:Alive()) then return end
		
		netstream.Start("jusagi_yourself")
	end)
	
	concommand.Add("jusagi_shotgun", function(ply, cmd, args)
		if(!ply:Alive()) then return end
		
		netstream.Start("jusagi_shotgun")
	end)
	
	concommand.Add("jusagi_explode", function(ply, cmd, args)
		if(!ply:Alive()) then return end
		
		netstream.Start("jusagi_explode")
	end)
	
	concommand.Add("jusagi_rocket", function(ply, cmd, args)
		if(!ply:Alive()) then return end
		
		netstream.Start("jusagi_rocket")
	end)
	
	concommand.Add("jusagi_hotdog", function(ply, cmd, args)
		if(!ply:Alive()) then return end
		
		netstream.Start("jusagi_hotdog")
	end)
end

if(SERVER) then
	netstream.Hook("jusagi_yourself", function(client)
		local randomEvent = PLUGIN:GetRandomDeath(client)
		
		randomEvent(_, client)
	end)
	
	netstream.Hook("jusagi_shotgun", function(client)
		PLUGIN:Bullets(client)
	end)
	
	netstream.Hook("jusagi_rocket", function(client)
		PLUGIN:Rocket(client)
	end)
	
	netstream.Hook("jusagi_explode", function(client)
		PLUGIN:Dynamite(client)
	end)
	
	netstream.Hook("jusagi_hotdog", function(client)
		PLUGIN:HotDog(client)
	end)
end

function PLUGIN:Dynamite(client)
	for i = 1, 4 do
		local dynamite = ents.Create("gmod_dynamite")
		dynamite:SetPos(client:GetPos() + client:GetUp()*25 + VectorRand()*20)
		
		dynamite:SetModel("models/dav0r/tnt/tnttimed.mdl")
		
		dynamite:SetDamage(25)
		dynamite:SetShouldRemove(true)
		dynamite:SetDelay(math.Rand(2,2.5))
		dynamite:Spawn()
		
		dynamite:Explode()
	end
end

function PLUGIN:Rocket(client)
	local rocketVelo = Vector(0,0,5000)
	client:SetVelocity(rocketVelo)
	
	timer.Simple(1.5, function()
		local explode=EffectData()
		explode:SetOrigin(client:GetPos())
		explode:SetScale(1)
		explode:SetRadius(1)
		--explode:SetNormal(vector_up)
		util.Effect("explosion", explode, true, true)
		
		client:TakeDamage(5000, self, self)
	end)
end

function PLUGIN:Bullets(client)
	local gunPos = client:GetPos()+client:GetUp()*55
	gunPos = gunPos + client:GetForward()*40
	
	local dummy = ents.Create("prop_physics")
	dummy:SetPos(gunPos)
	dummy:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
	dummy:SetModel("models/weapons/w_shotgun.mdl")
	dummy:SetAngles(client:GetAngles())
	dummy:Spawn()
	
	dummy:EmitSound("weapons/shotgun/shotgun_cock.wav", 75, math.random(95,105))

	local physObj = dummy:GetPhysicsObject()
	if(IsValid(physObj)) then
		physObj:EnableMotion(false)
	end

	local direction = VectorRand()
	direction.z = math.abs(direction.z)

	timer.Simple(2, function()
		dummy:EmitSound("weapons/shotgun/shotgun_dbl_fire.wav", 75, math.random(95,105))
	
		local bullet = {}
		bullet.Attacker = dummy
		bullet.Damage = 100
		bullet.Force = 100
		bullet.Num = 40
		bullet.Spread = VectorRand()*5
		bullet.Tracer = "AR2Tracer"
		bullet.Dir = dummy:GetForward()*-1
		bullet.Src = dummy:GetPos()+dummy:GetForward()*10

		bullet.Distance = 200
		bullet.IgnoreEntity = dummy
		
		dummy:FireBullets(bullet)
		
		local physObj = dummy:GetPhysicsObject()
		if(IsValid(physObj)) then
			physObj:EnableMotion(true)
			physObj:Wake()
			
			physObj:ApplyForceOffset(dummy:GetForward()*5000, dummy:GetPos()+dummy:GetForward()*10)
		end
	
		timer.Simple(1, function()
			SafeRemoveEntity(dummy)
		end)
	end)
end

function PLUGIN:HotDog(client)
	local position = client:GetPos()+client:GetUp()*35
	
	--kill the player immediately
	local dmg = DamageInfo()
	dmg:SetDamage(1000)
	dmg:SetAttacker(client)
	dmg:SetInflictor(client)
	dmg:SetDamageType(DMG_BUCKSHOT)
	client:TakeDamageInfo(dmg)

	--shoot 35 hot dogs out of him
	for i = 1, 35 do
		local dog = ents.Create("prop_physics")
		dog:SetPos(position+VectorRand()*10)
		dog:SetModel("models/food/hotdog.mdl")
		dog:SetCollisionGroup(COLLISION_GROUP_INTERACTIVE_DEBRIS)
		dog:Spawn()
		
		local physObj = dog:GetPhysicsObject()
		if(IsValid(physObj)) then
			physObj:SetVelocityInstantaneous(VectorRand()*math.random(500, 1000))
			physObj:EnableGravity(false)
		end
		
		timer.Simple(10, function()
			if(IsValid(dog)) then
				SafeRemoveEntity(dog)
			end
		end)
	end
end

function PLUGIN:GetRandomDeath()
	local deaths = {
		PLUGIN.Dynamite,
		PLUGIN.Rocket,
		PLUGIN.Bullets,
		PLUGIN.HotDog,
	}
	
	local death = table.Random(deaths)
	
	return death
end