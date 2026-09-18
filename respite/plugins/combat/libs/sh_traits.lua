local PLUGIN = PLUGIN

hook.Add("nut_OnCombatAttack", "nut_TraitAttackModify", function(action, attacker, info)
	if(!attacker:IsPlayer()) then return end
	
	local traits = attacker:getTraitsData()
	
	for k, v in pairs(traits) do
		if(v.OnAttackData) then
			v:OnAttackData(action, attacker, info)
		end
	end
end)

hook.Add("nut_OnCombatDamageProcess", "nut_TraitDamageProcess", function(target, attack, dmgTbl)
	if(!target:IsPlayer()) then return end
	
	local traits = target:getTraitsData()
	
	for k, v in pairs(traits) do
		if(v.OnDamageProcess) then
			v:OnDamageProcess(attack, dmgTbl)
		end
	end
end)

hook.Add("nut_OnCombatReceiveDamage", "nut_TraitDamageProcess", function(target, data)
	if(!target:IsPlayer()) then return end
	
	local traits = target:getTraitsData()
	
	for k, v in pairs(traits) do
		if(v.OnReceiveDamage) then
			v:OnReceiveDamage(target, data.dmg, data.dmgT)
		end
	end
end)

hook.Add("nut_OnGetRes", "nut_TraitGetRes", function(client, res)
	if(!client:IsPlayer()) then return end
	
	local traits = client:getTraitsData()
	
	for _, v in pairs(traits) do
		if(v.res) then
			for dmgT, v in pairs(v.res) do
				res[dmgT] = (res[dmgT] or 0) + v
			end
		end
	end
end)