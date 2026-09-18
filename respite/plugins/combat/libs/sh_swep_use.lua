if(CLIENT) then return end

local PLUGIN = PLUGIN
PLUGIN.helperFuncs = PLUGIN.helperFuncs or {}

hook.Add("nut_OnCombatDamageProcessPost", "nut_SwepAutoUse", function(target, dmgTbl, attackData)
	--only do this for combat entities otherwise players will get shot in the face
	if(!target.combat) then return end
	
	local attacker = attackData.attacker
	if(IsValid(attacker) and attacker:IsPlayer()) then
		local damage = attackData.damage
		local weapon
		
		for k, v in pairs(damage) do
			if(v.weap) then
				weapon = v.weap
				break
			end
		end
		
		if(weapon) then
			local weapons = attacker:GetWeapons()
			local swep

			for k, v in pairs(weapons) do
				if(v.PrintName == weapon) then
					swep = v
				end
			end
			
			if(IsValid(swep)) then
				attacker:SelectWeapon(swep:GetClass())
				
				timer.Simple(1.5, function()
					if(IsValid(swep)) then
						swep:PrimaryAttack()
						
						attacker:setWepRaised(true)
						
						timer.Simple(0, function()
							attacker:SelectWeapon("nut_cswep")
						end)
					end
				end)
			end
		end
	end
end)