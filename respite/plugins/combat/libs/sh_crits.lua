local PLUGIN = PLUGIN

--rolls for a crit
--function playerMeta:rollCrit()
PLUGIN.helperFuncs["rollCrit"] = function(self, bonusC, bonusM, bonusF)
	local char = self:getChar()
	
	local mult = 1
	
	local critMsg = ""
	
	local critC, critM, critF = self:getCrit()
	
	critC = critC + (bonusC or 0)
	critM = critM + (bonusM or 0)
	critF = critF + (bonusF or 0)
	
	local luck = char:getAttrib("luck", 0)
	
	local critRoll = math.Rand(1, 100)
	if(critRoll < critC) then
		mult = critM
		critMsg = "(Crit!) "
	else -- Fails can only happen on non-crits
		local failRoll = math.Rand(1, 100)
		if(failRoll < critF) then
			mult = 0.25
			critMsg = "(Fail!) "
		end
	end

	return mult, critMsg
end

--gets a player's crit chance and crit multiplier
--function playerMeta:getCrit()
PLUGIN.helperFuncs["getCrit"] = function(self)
	local char = self:getChar()

	--base crit chance is 5% (50)
	local critC = 5
	
	--base crit multiplier is 1.2x
	local critM = 1.2
	
	--base crit fail chance is 5% (50)
	local critF = 5

	if(char) then
		local luck = char:getAttrib("luck", 0)
		
		critC = critC + (luck * 0.4) + self:getBuffAttribute("critC")
		critM = critM + (luck * 0.04) + self:getBuffAttribute("critM")
		critF = critF - (luck * 0.05) + self:getBuffAttribute("critF")

		local inv = char:getInv()
		
		local itemCritC = 0
		local itemCritM = 0
		local itemCritF = 0
		for k, v in pairs(inv:getItems()) do
			if(v:getData("equip")) then
				itemCritC = itemCritC + (v:getData("critC", v.critC) or 0)
				itemCritM = itemCritM + (v:getData("critM", v.critM) or 0)
				itemCritF = itemCritF + (v:getData("critF", v.critF) or 0)
			end
		end
		
		critC = critC + itemCritC
		critM = critM + itemCritM
		critF = critF + itemCritF
	end
	
	return critC, critM, critF
end

hook.Add("nut_OnCombatAttack", "nut_CritModify", function(action, attacker, info)
	local weapon = info.weapon or (info.action and info.action.weapon)
	local weaponItem
	if(weapon) then
		weaponItem = nut.item.instances[weapon]
	end

	local crit, critMsg = attacker:rollCrit(action.critC, action.critM, action.critF)
	if(crit) then
		action.dmg = action.dmg * crit
		action.accuracy = action.accuracy * crit
		
		action.crit = critMsg
	end
end)