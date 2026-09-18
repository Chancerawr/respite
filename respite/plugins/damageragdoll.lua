local PLUGIN = PLUGIN
PLUGIN.name = "Damage Fallover"
PLUGIN.author = " "
PLUGIN.desc = "Ragdolls players when they take types of damage (configurable)."

nut.config.add("ragdollExplode", true, "Explosions cause ragdolling.", nil, {
	category = "Damage Ragdolling"
})

nut.config.add("ragdollVehicle", true, "Vehicles cause ragdolling.", nil, {
	category = "Damage Ragdolling"
})

nut.config.add("ragdollDoor", true, "Doors crushing people cause ragdolling.", nil, {
	category = "Damage Ragdolling"
})

nut.config.add("ragdollFall", true, "Fall damage causes ragdolling.", nil, {
	category = "Damage Ragdolling"
})

nut.config.add("ragdollPVP", false, "Player vs Player damage causes ragdolling.", nil, {
	category = "Damage Ragdolling"
})

nut.config.add("ragdollPhys", true, "Physics damage causes ragdolling.", nil, {
	category = "Damage Ragdolling"
})

if(SERVER) then
	--from BGO
	PLUGIN.HitGroupBones = {
		[HITGROUP_GENERIC] = "ValveBiped.Bip01_Pelvis",
		[HITGROUP_HEAD] = "ValveBiped.Bip01_Head1",
		[HITGROUP_CHEST] = "ValveBiped.Bip01_Spine4",
		[HITGROUP_STOMACH] = "ValveBiped.Bip01_Spine",
		[HITGROUP_LEFTARM] = "ValveBiped.Bip01_L_Forearm",
		[HITGROUP_RIGHTARM] = "ValveBiped.Bip01_R_Forearm",
		[HITGROUP_LEFTLEG] = "ValveBiped.Bip01_L_Thigh",
		[HITGROUP_RIGHTLEG] = "ValveBiped.Bip01_R_Thigh",
		[HITGROUP_GEAR] = "ValveBiped.Bip01_Pelvis",
	}

	--used to get the hitgroup that was hit
	--more expensive, used when normal methods fail
	function PLUGIN:GetHitGroup(dmginfo)
		local attacker = dmginfo:GetAttacker()
		local trace = {}
		if(attacker:IsPlayer()) then
			trace.start = attacker:GetShootPos()
				
			trace.endpos = trace.start + ( ( dmginfo:GetDamagePosition() - trace.start ) * 2 )  
			trace.mask = MASK_SHOT
			trace.filter = attacker
				
			local tr = util.TraceLine(trace)

			return tr.HitGroup
		else
			return false
		end
	end
	
	function PLUGIN:BoneImpactStandard(client, dmginfo)
		local hitGroup = PLUGIN:GetHitGroup(dmginfo) or -1
		local hitBone = PLUGIN.HitGroupBones[hitGroup]
		local ragdoll = client:setRagdolled(true, 3)
		
		if(!IsValid(ragdoll)) then return end

		local num = ragdoll:GetPhysicsObjectCount()-1
		local v = client:GetVelocity()
		
		if(dmginfo) then
			v = v + (dmginfo:GetDamageForce()/20)
		end

		for i=0, num do
			local bone = ragdoll:GetPhysicsObjectNum(i)

			if IsValid(bone) then
				local boneID = ragdoll:TranslatePhysBoneToBone(i)
				local boneName = ragdoll:GetBoneName(boneID)
				
				if(hitBone) then
					if(hitBone == boneName) then
						bone:SetVelocity(v*5)
					else
						bone:SetVelocity(v*0.5)
					end
				else
					bone:SetVelocity(v)
				end
			end
		end			
	end
	
	function PLUGIN:BoneImpactDirectional(client, dmginfo)
		local hitGroup = PLUGIN:GetHitGroup(dmginfo) or -1
		--local hitBone = PLUGIN.HitGroupBones[hitGroup]
		local ragdoll = client:setRagdolled(true, 3)
		
		--find way to get closest bone to the explosion
		--might be better to draw a line to each bone and do distance stuff
		--probably expensive though
		
		--[[
		local dmgPos = dmginfo:GetDamagePosition()
		local direction = (client:GetPos() - dmgPos):GetNormalized()
		local forceMult = dmginfo:GetDamage()
		local directForce = direction*forceMult
		--]]
		
		local directForce = dmginfo:GetDamageForce()*0.013

		local num = ragdoll:GetPhysicsObjectCount()-1
		local v = client:GetVelocity()
		
		if(dmginfo) then
			v = v + (directForce)
		end

		for i=0, num do
			local bone = ragdoll:GetPhysicsObjectNum(i)

			if IsValid(bone) then
				local boneID = ragdoll:TranslatePhysBoneToBone(i)
				local boneName = ragdoll:GetBoneName(boneID)
			
				if(hitBone) then
					if(hitBone == boneName) then
						bone:SetVelocity(v*5)
					else
						bone:SetVelocity(v*0.5)
					end
				else
					bone:SetVelocity(v)
				end
			end
		end			
	end

	PLUGIN.damageProcess = {
		{ --explosion damage
			check = function(target, dmginfo)
				if(!nut.config.get("ragdollExplode", true)) then return false end
				if(!dmginfo:IsExplosionDamage()) then return false end

				return true
			end,
			result = function(client, dmginfo)
				PLUGIN:BoneImpactDirectional(client, dmginfo)
			end,
			dmgMult = 0.25,
		},
		{ --vehicle ragdoll
			check = function(target, dmginfo)
				if(!nut.config.get("ragdollVehicle", true)) then return false end

				local inflictor = dmginfo:GetInflictor()
				if(!IsValid(inflictor)) then return false end
				if(!(inflictor:IsVehicle() or inflictor.LVS or inflictor.lvsProjectile)) then return false end
				if(IsValid(target:GetVehicle())) then return false end
				
				return true
			end,
			result = function(client, dmginfo)
				client:setRagdolled(true, 5)
			end,
			dmgMult = 0,
		},
		{ --door ragdoll
			check = function(target, dmginfo)
				if(!nut.config.get("ragdollDoor", true)) then return false end

				local attacker = dmginfo:GetAttacker()
				if(!IsValid(attacker)) then return false end
				if(attacker:GetClass() != "func_door") then return false end

				return true
			end,
			result = function(client, dmginfo)
				client:setRagdolled(true, 3)
			end,
			dmgMult = 0,
		},
		{ --fall ragdoll
			check = function(target, dmginfo)
				if(!nut.config.get("ragdollFall", true)) then return false end

				if(!dmginfo:IsFallDamage()) then return false end
				if(TRAITS and target:hasTrait("nofall")) then return end

				return true
			end,
			result = function(client, dmginfo)
				client:setRagdolled(true, 3)
			end,
			dmgMult = 0.5,
		},
		{ --player ragdoll
			check = function(target, dmginfo)
				if(!nut.config.get("ragdollPVP", true)) then return false end

				local attacker = dmginfo:GetAttacker()
				if(!IsValid(attacker)) then return end
				if(!attacker:IsPlayer()) then return end
				if(dmginfo:IsExplosionDamage()) then return false end
				
				local damage = dmginfo:GetDamage()
				if(damage <= 0) then return end

				return true
			end,
			result = function(client, dmginfo)
				PLUGIN:BoneImpactStandard(client, dmginfo)
			end,
			dmgMult = 0.5,
		},
		{ --phys ragdoll
			check = function(target, dmginfo)
				if(!nut.config.get("ragdollPhys", true)) then return false end
				
				local inflictor = dmginfo:GetInflictor()
				if(!IsValid(inflictor)) then return end
				
				local damage = dmginfo:GetDamage()
				if(damage < 5) then return end

				local dmgType = dmginfo:GetDamageType()
				if(dmgType != DMG_CRUSH) then return false end

				--[[
				local classes = {
					["nut_item"] = true,
					["prop_physics"] = true,
					["prop_physics_multiplayer"] = true,
					["nut_storage"] = true,
				}
				local knockdown = classes[inflictor:GetClass()] or inflictor.NutKnockDown
				if(!knockdown) then return end
				--]]
			
				return true
			end,
			result = function(client, dmginfo)
				PLUGIN:BoneImpactStandard(client, dmginfo)
			end,
			dmgMult = 0.1,
		},
	}

	function PLUGIN:EntityTakeDamage(target, dmginfo)
		if(target:IsPlayer() and target:Alive()) then
			if(target:GetMoveType() == MOVETYPE_NOCLIP) then return end
			if(IsValid(target.nutRagdoll)) then return end
			
			for k, v in ipairs(PLUGIN.damageProcess) do
				if(v.check(target, dmginfo)) then
					v.result(target, dmginfo)
					
					if(v.dmgMult) then
						dmginfo:ScaleDamage(v.dmgMult)
					end
					
					--break out of for loop, only one of these should happen at a time
					break
				end
			end
		end
	end
end