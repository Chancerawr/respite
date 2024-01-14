local PLUGIN = PLUGIN
PLUGIN.name = "Fall Damage Fallover"
PLUGIN.author = "Chancer"
PLUGIN.desc = "When people take explosion damage they fall over, it is very funny."

function PLUGIN:EntityTakeDamage(target, dmginfo)
	if(target:IsPlayer() and target:Alive()) then
		if(target:GetMoveType() == MOVETYPE_NOCLIP) then return end
		
		if(dmginfo:IsExplosionDamage()) then
			dmginfo:ScaleDamage(0.5)
			
			local dmgPos = dmginfo:GetDamagePosition()
			local direction = (target:GetPos() - dmgPos):GetNormalized()

			target:SetVelocity(direction*60*dmginfo:GetDamage())
			
			timer.Simple(0.05, function()
				if(!IsValid(target.nutRagdoll)) then
					target:setRagdolled(true, 3)
				end
			end)
		end
	end
end