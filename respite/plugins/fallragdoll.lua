PLUGIN.name = "Fall Damage Fallover"
PLUGIN.author = "Chancer"
PLUGIN.desc = "When people take fall damage they fall over, it is very funny."

function PLUGIN:EntityTakeDamage(target, dmginfo)
	if(target:IsPlayer()) then
		if(dmginfo:IsFallDamage()) then
			dmginfo:ScaleDamage(0.5)
			
			timer.Simple(0.05, function()
				if(!IsValid(target.nutRagdoll)) then
					target:setRagdolled(true, 3)
				end
			end)
		end
	end
end