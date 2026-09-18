local PLUGIN = PLUGIN
PLUGIN.helperFuncs = PLUGIN.helperFuncs or {}

hook.Add("nut_OnCombatAttack", "nut_actionOnHit", function(action, attacker, info)
	if(action.onHit) then
		action:onHit(action, attacker, info)
	end
end)

hook.Add("nut_ActionEffectData", "nut_actionOnEffect", function(action, attacker, info)
	if(action.onEffect) then
		action:onEffect(action, attacker, info)
	end
end)