PLUGIN.name = "Item Defense"
PLUGIN.author = "Chancer"
PLUGIN.desc = "When people get hit by a stray flying item, they won't take any damage."

function PLUGIN:EntityTakeDamage(target, dmginfo)
	if(target:IsPlayer()) then
		local inflictor = dmginfo:GetInflictor()

		if(IsValid(inflictor) and (inflictor:GetClass() == "nut_item")) then
			if(!IsValid(target:GetVehicle())) then
				local damage = dmginfo:GetDamage()
				
				dmginfo:ScaleDamage(0)
				
				if(damage > 5) then
					if(!IsValid(target.nutRagdoll)) then
						target:setRagdolled(true, 2)
					end
				end
			end
		end
		
		if(IsValid(inflictor) and ((inflictor:GetClass() == "prop_physics") or (inflictor:GetClass() == "nut_storage"))) then
			if(!IsValid(target:GetVehicle())) then
				local damage = dmginfo:GetDamage()
				
				dmginfo:ScaleDamage(0.1)
				
				if(damage > 5) then
					if(!IsValid(target.nutRagdoll)) then
						target:setRagdolled(true, 2)
						
						local ragdoll = target.nutRagdoll
						local num = ragdoll:GetPhysicsObjectCount()-1
						local v = target:GetVelocity()
						
						if(dmginfo) then
							v = v + (dmginfo:GetDamageForce()/20)
						end

						for i=0, num do
							local bone = ragdoll:GetPhysicsObjectNum(i)

							if IsValid(bone) then
								local bp, ba = target:GetBonePosition(ragdoll:TranslatePhysBoneToBone(i))
								if bp and ba then
									bone:SetPos(bp)
									bone:SetAngles(ba)
								end
								
								bone:SetVelocity(v)
							end
						end						
					end
				end
			end
		end
	end
end