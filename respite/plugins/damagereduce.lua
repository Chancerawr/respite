PLUGIN.name = "Player Damage Reducer"
PLUGIN.author = "Neon"
PLUGIN.desc = "Reduces the damage players do to one another."

function PLUGIN:ScalePlayerDamage(client, hitGroup, dmgInfo)
	local attacker = dmgInfo:GetAttacker()
	if(attacker and attacker:IsPlayer()) then
		if(dmgInfo:GetDamageType() == DMG_SLASH) then
			dmgInfo:ScaleDamage(.1)
		else
			dmgInfo:ScaleDamage(.5)
		end
	else
		dmgInfo:ScaleDamage(1.5)

		if (hitGroup == HITGROUP_HEAD) then
			dmgInfo:ScaleDamage(7)
		elseif (LIMB_GROUPS[hitGroup]) then
			dmgInfo:ScaleDamage(0.5)
		end
	end
end