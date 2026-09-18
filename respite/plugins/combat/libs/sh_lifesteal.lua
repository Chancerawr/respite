local PLUGIN = PLUGIN
PLUGIN.helperFuncs = PLUGIN.helperFuncs or {}

--gets how much lifesteal a player has
--function playerMeta:getLifesteal()
PLUGIN.helperFuncs["getLifesteal"] = function(self)
	local char = self:getChar()
	
	local lifesteal = 0
	
	if(char) then
		lifesteal = lifesteal + self:getBuffAttribute("lifesteal")
	end
	
	return lifesteal
end

hook.Add("nut_OnCombatDamageProcessPost", "nut_CombatLifesteal", function(target, damage, attackInfo)
	if(!IsValid(target)) then return end
	if(table.IsEmpty(damage)) then return end
	
	local lifesteal = attackInfo.attacker:getLifesteal()
	
	for k, v in pairs(damage) do
		if(lifesteal != 0) then
			attackInfo.attacker:addHP(math.Round(v.dmg * lifesteal, 2))
		end
		
		if(v.lifesteal) then
			attackInfo.attacker:addHP(math.Round(v.dmg * v.lifesteal, 2))
		end
	end
end)