local PLUGIN = PLUGIN
PLUGIN.helperFuncs = PLUGIN.helperFuncs or {}

hook.Add("nut_OnCombatDamageProcessPost", "nut_EvasionExhaust", function(target, dmgTbl, attackData)
	local buffs = target:getBuffs()
	local evasionDebuff = buffs["evasion_exhaust"] or {}
	evasionDebuff.uid = "evasion_exhaust"
	evasionDebuff.name = "Evasion Exhaustion"
	evasionDebuff.evasion = (evasionDebuff.evasion or 0)-5
	evasionDebuff.duration = 0

	target:addBuff(evasionDebuff)
end)