PLUGIN.name = "Player Damage Reducer"
PLUGIN.author = "Neon"
PLUGIN.desc = "Reduces the damage players do to one another."

function PLUGIN:ScalePlayerDamage(client, hitGroup, dmgInfo)
	local attacker = dmgInfo:GetAttacker()
	
	if(attacker and attacker:IsPlayer()) then
		if(dmgInfo:GetDamageType() == DMG_SLASH) then --melee weapons
			dmgInfo:ScaleDamage(.1)
		else --everything else
			dmgInfo:ScaleDamage(.5)
		end
	else
		if (hitGroup == HITGROUP_HEAD) then --head
			dmgInfo:ScaleDamage(nut.config.get("dmgScaleHead", 7))
		elseif (LIMB_GROUPS[hitGroup]) then --limbs
			dmgInfo:ScaleDamage(nut.config.get("dmgScaleLimb", 0.5))
		else --everything else
			dmgInfo:ScaleDamage(nut.config.get("dmgScale", 1.5))
		end
	end
end