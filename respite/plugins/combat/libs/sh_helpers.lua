local PLUGIN = PLUGIN

PLUGIN.helperFuncs = PLUGIN.helperFuncs or {}

--calculates hit chance with the accuracy of an attack and a target
function PLUGIN:hitCalc(accuracy, target)
	local evasion = target:getEvasion()
	
	evasion = math.max(evasion, 0.1) --don't want evasion at 0, probably not necessary if we don't multiple/divide
	
	local hit = accuracy - evasion --difference between accuracy and evasion
	
	if(hit > 0) then --if accuracy is higher than evasion, full hit.
		return 1
	else --if evasion is higher than accuracy, process a graze/dodge
		local roll = math.random(1,60)

		if((hit * -1) > roll) then --essentially (evasion - accuracy), higher evasion means it's more likely to be higher than the roll.
			local roll2 = math.random(1,100) --second roll for grazes
			local graze = roll2 + hit --adds the second roll to (accuracy - hit) to check damage reduction from dodge
			
			--lower graze is "better" for the person evading, lower roll2 + hit means less damage from attack
			if(graze > 45) then
				return 0.7
			elseif(graze > 40) then
				return 0.5
			elseif(graze > 30) then
				return 0.4
			elseif(graze > 20) then
				return 0.3
			elseif(graze > 10) then
				return 0.1
			else
				return 0
			end			
		else
			return 1
		end		
	end
end

--a dumb thing for printing, checks if it's a graze or an evade.
function PLUGIN:evadeCalc(target, accuracy, dmg)
	local evade
	local reduct
	
	if(target and accuracy) then
		reduct = PLUGIN:hitCalc(accuracy, target)
		
		if(reduct < 1 and reduct > 0) then
			evade = "Graze"
		elseif(reduct == 0) then
			evade = "Evaded"
		end
	end
	
	return evade, reduct
end

--checks if a player can cast a spell or not based on how much mana it costs
function PLUGIN:costCheck(client, spell)
	if(spell.costMP) then
		if(client:getMP() < spell.costMP) then
			return false
		end
	end
	
	if(spell.costHP) then
		if(client:getHP() < spell.costHP) then
			return false
		end
	end
	
	--[[
	if(spell.costAP) then
		if(client:getAP() < spell.costAP) then
			return false
		end
	end
	--]]
	
	return true
end

local function actionFormat(actionTbl, item)
	local action = {
		uid = actionTbl.uid,
		name = actionTbl.name,
		category = actionTbl.category,
		notarget = actionTbl.notarget,
		radius = actionTbl.radius,
		cone = actionTbl.cone,
		cone2 = actionTbl.cone2,
		box = actionTbl.box,
		selfOnly = actionTbl.selfOnly,
		--attackOverwrite = actionTbl.attackOverwrite,
		weapon = item, --ID of the weapon
	}

	return action
end

--function playerMeta:getActions()
PLUGIN.helperFuncs["getActions"] = function(self)
	local char = self:getChar()
	if(!char) then return {} end
	
	local actions = {}

	actions[#actions+1] = {
		name = "Attack",
		category = "Default",
	}	
	
	if(self.actions) then
		for k, v in pairs(self.actions) do
			local action = PLUGIN:actionFind(v)
			if(action) then
				actions[#actions+1] = actionFormat(action)
			end
		end
	end
	
	for k, actionData in pairs(ACTS.actions) do
		if(actionData.hidden) then continue end
	
		-- Default actions
		if(actionData.category == "Default") then
			actions[#actions+1] = actionFormat(v)
		end
	
		--if the ability requires stat thresholds to use
		if(actionData.reqStats) then
			local reqStats = true
			for attrib, reqVal in pairs(actionData.reqStats) do
				if(char:getAttrib(attrib, 0) < reqVal) then
					reqStats = false
				end
			end
			if(!reqStats) then continue end
		end

		actions[#actions+1] = actionFormat(actionData)
	end
	
	--actions from the inventory (equipment and consumables)
	if(char and char:getInv()) then
		for k, v in pairs(char:getInv():getItems()) do
			if(v:getData("equip") and v:getData("actions", v.actions)) then
				for _, action in pairs(v:getData("actions", v.actions)) do
					local actionData = ACTS.actions[action]
					if(!actionData) then continue end
					
					--checks if they have the required stats
					local reqStats = true
					if(actionData.reqStats) then
						if(!table.IsEmpty(actionData.reqStats)) then 
							for attrib, reqVal in pairs(actionData.reqStats) do
								if(char:getAttrib(attrib) < reqVal) then
									reqStats = false
								end
							end
						end
					end
					if(!reqStats) then continue end
				
					actions[#actions+1] = actionFormat(actionData, v.id)
				end
			elseif(v.action) then --consumables
				local action = v.action
				local actionData = ACTS.actions[action]
				if(!actionData) then continue end
				
				--checks if they have the required stats
				local reqStats = true
				if(actionData.reqStats) then
					if(!table.IsEmpty(actionData.reqStats)) then 
						for attrib, reqVal in pairs(actionData.reqStats) do
							if(char:getAttrib(attrib) < reqVal) then
								reqStats = false
							end
						end
					end
				end
				if(!reqStats) then continue end
				
				actions[#actions+1] = actionFormat(actionData, v)
			end
		end
	end

	return actions
end

--gets the damage a player does with a reegular attack
--function playerMeta:getDamage(weapon)
PLUGIN.helperFuncs["getDamage"] = function(self, weapon)
	local char = self:getChar()
	
	if(char) then
		local totalDam = {}
		local dualCheck = 0
		
		-- For CEnts
		if(self.dmg) then
			for dmgT, dmgV in pairs(self.dmg) do
				local dmg = dmgV
				
				--direct dmg buffs
				dmg = dmg + self:getBuffAttribute("dmg")
				
				local amp = self:getAmp()
				if(amp) then
					if(amp[dmgT]) then
						dmg = dmg * (1 + amp[dmgT])
					end
					
					--general damage amp
					if(amp["dmg"]) then 
						dmg = dmg * (1 + amp["dmg"])
					end
				end
				
				--critical hits
				local crit, critMsg, what = self:rollCrit()
				if(crit) then
					dmg = dmg * crit
				end
			
				totalDam[#totalDam + 1] = {
					dmg = dmg, 
					dmgT = dmgT,
					crit = critMsg,
					accuracy = self:getAccuracy()
				}
			end
		end
		
		for k, v in pairs(char:getInv():getItems()) do
			if(weapon and v.id != weapon) then continue end
			if(v:getData("equip")) then
				if(v:getData("dual", v.weapondual) and v:getData("slot", v.buffCategory) == "Weapon") then
					dualCheck = dualCheck + 1
				end
				
				local dmgTbl = v:getData("dmg", v.dmg)
				if(dmgTbl) then
					for dmgT, dmgV in pairs(dmgTbl) do
						local dmg = dmgV
					
						for name, mult in pairs(v:getData("scale", v.scaling) or {}) do
							local attrib = char:getAttrib(name, 0)
							local attribBonus = (attrib * mult)
							
							if(attribBonus > dmg) then
								dmg = dmg + dmg + (attribBonus - dmg)^(0.5)
							else
								dmg = dmg + attribBonus
							end
						end

						--damage amplification
						local amp = self:getAmp()
						if(amp) then
							if(amp[dmgT]) then
								dmg = dmg * (1 + amp[dmgT])
							end
							
							--general damage amp
							if(amp["dmg"]) then 
								dmg = dmg * (1 + amp["dmg"])
							end
						end
					
						--critical hits
						local crit, critMsg = self:rollCrit()
						if(crit) then
							dmg = dmg * crit
						end
						
						--direct dmg buffs
						dmg = dmg + self:getBuffAttribute("dmg")
					
						totalDam[#totalDam + 1] = {
							dmg = dmg, 
							dmgT = dmgT,
							weap = v:getName(),
							crit = critMsg,
							accuracy = self:getAccuracy()
						}
					end
				end
			end
		end
		
		for k, v in pairs(totalDam) do
			--reduces damage when dual wielding, gives a slight reason to only use one weapon
			if(dualCheck >= 2) then 
				v.dmg = v.dmg * 0.7
			end
			
			v.dmg = math.Round(v.dmg, 2) --just a little rounding.
		end
		
		--unarmed or this is a CEnt
		if(table.IsEmpty(totalDam)) then
			totalDam[1] = {
				dmg = char:getAttrib("str", 0) * 0.1 + self:getBuffAttribute("dmg"),
				dmgT = "Crush",
				weap = "Hands",
				accuracy = self:getAccuracy()
			}
		end
		
		return totalDam
	end
end

--function playerMeta:getRes()
PLUGIN.helperFuncs["getRes"] = function(self)
	local char = self:getChar()
	if(!char) then return {} end
	
	local inv = char:getInv()
	
	--resistance, start with resist from buffs
	local res = table.Copy(self.res or {})
	
	local buffRes = self:getBuffAttributeTbl("res") or {}
	-- adds the buff resistance to the other table
	for k, v in pairs(buffRes) do
		res[k] = (res[k] or 0) + v
	end
	
	res["dmg"] = (res["dmg"] or 0) + (char:getAttrib("end", 0) * 0.25)
	res["effect"] = (res["effect"] or 0) + (char:getAttrib("end", 0) * 0.25) + (char:getAttrib("fortitude", 0) * 0.25)
	
	for k, v in pairs(res) do
		res[k] = v * 0.01
	end
	
	--resist from items
	for k, v in pairs(inv:getItems()) do
		if(v:getData("equip")) then
			for k2, v2 in pairs(v:getData("res", {})) do
				if(res[k2]) then --lets round it to stop any funny business
					res[k2] = 1 - (1 - res[k2]) * (1 - v2 * 0.01)
				else
					res[k2] = 1 - (1 - v2 * 0.01)
				end
			end
		end
	end
	
	--rounds resistance so it isnt scary numbers
	for k, v in pairs(res) do
		res[k] = math.Round(v, 4)
	end

	return res
end

--function playerMeta:getAmp()
PLUGIN.helperFuncs["getAmp"] = function(self)
	local char = self:getChar()
	local inv = char:getInv()
	
	--amplifications, start with amp from buffs
	local amp = table.Copy(self.amp or {})
	
	local buffAmp = self:getBuffAttributeTbl("amp") or {}
	-- adds the buff amplifications to the other table
	for k, v in pairs(buffAmp) do
		amp[k] = (amp[k] or 0) + v
	end
	
	for k, v in pairs(amp) do
		amp[k] = v * 0.01
	end
	
	--amp from items
	for k, v in pairs(inv:getItems()) do
		if(v:getData("equip")) then
			for k2, v2 in pairs(v:getData("amp", {})) do
				if(amp[k2]) then
					amp[k2] = 1 - (1 - amp[k2]) * (1 - v2 * 0.01)
				else
					amp[k2] = 1 - (1 - v2 * 0.01)
				end
			end
		end
	end
	
	--rounds resistance so it isnt scary numbers
	for k, v in pairs(amp) do
		amp[k] = math.Round(v, 4)
	end
	
	return amp
end

--gets how much armor a player has from items, buffs, etc
--function playerMeta:getArmor()
PLUGIN.helperFuncs["getArmor"] = function(self)
	local char = self:getChar()
	
	local armor = self.armor or 0
	
	if(char) then
		local inv = char:getInv()
		
		for k, v in pairs(inv:getItems()) do
			if(v:getData("equip")) then
				local itemArmor = v:getData("armor", v.armor)
				if(itemArmor) then
					armor = armor + itemArmor
				
					for name, mult in pairs(v:getData("scale", v.scaling) or {}) do
						local attrib = char:getAttrib(name, 0)
						local attribBonus = (attrib * mult)
						
						if(attribBonus > itemArmor) then
							armor = armor + itemArmor + (attribBonus - itemArmor)^(0.5)
						else
							armor = armor + attribBonus
						end
					end
				end
			end
		end
		
		armor = armor + (char:getAttrib("end", 0) * 3)

		armor = armor + self:getBuffAttribute("armor")
		
		armor = math.Round(armor, 2)
	end
	
	return armor
end

--gets how much evasion a player has
--function playerMeta:getEvasion()
PLUGIN.helperFuncs["getEvasion"] = function(self)
	local char = self:getChar()
	
	local evasion = 0
	
	if(char) then
		evasion = evasion + (char:getAttrib("stm", 0) * 0.5)

		--evasion = evasion + (char:getAttrib("talent", 0) * 0.75)
		
		evasion = evasion + (char:getAttrib("luck", 0) * 0.25)
		
		--evasion = evasion - (self:getWeight() * 0.25)
		
		evasion = evasion + self:getBuffAttribute("evasion")
	end
	
	return evasion
end

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

--gets how much accuracy a player has
--function playerMeta:getAccuracy()
PLUGIN.helperFuncs["getAccuracy"] = function(self)
	local char = self:getChar()
	
	local accuracy = 1
	
	if(char) then
		accuracy = accuracy + (char:getAttrib("accuracy", 0) * 2)
		
		accuracy = accuracy + (char:getAttrib("perception", 0) * 2)
		
		accuracy = accuracy + (char:getAttrib("luck", 0) * 0.2)
		
		accuracy = accuracy + self:getBuffAttribute("accuracy")
	end
	
	return accuracy
end

--rolls for a crit
--function playerMeta:rollCrit()
PLUGIN.helperFuncs["rollCrit"] = function(self)
	local char = self:getChar()
	
	local mult = 1
	
	local critMsg = ""
	
	local critC, critM, critF = self:getCrit()
	
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

--[[
--gets a player's magic damage bonus
--function playerMeta:getMagic()
PLUGIN.helperFuncs["getMagic"] = function(self)
	local char = self:getChar()
	local inv = char:getInv()
	
	local intelligence = char:getAttrib("intelligence", 0)
	local magic = self.magic or 0.2
	local extra = 0
	
	for k, v in pairs(inv:getItems()) do
		if(v:getData("equip")) then
			local itemMagic = v:getData("magic", v.magic) or 0
			if(itemMagic < 1) then
				magic = 1 - (1 - magic) * (1 - itemMagic)
			elseif(itemMagic >= 1) then
				local remain = itemMagic
				while(remain >= 1) do
					extra = extra + 1
					remain = remain - 1
				end
				
				magic = 1 - (1 - magic) * (1 - remain)
			end
		end
	end
	
	if(extra > 1) then
		magic = (magic + extra) * 0.5
	end
	
	magic = magic * intelligence

	return magic
end
--]]

--function for when a player receives damage, handles armor, resistance, etc
--function playerMeta:receiveDamage(dmg, dmgT)
PLUGIN.helperFuncs["receiveDamage"] = function(self, dmg, dmgT)
	local res = self:getRes()

	--physical damage reduction (DR) from armor
	if(PLUGIN:armorReduction(dmgT)) then
		local armorThreshold = (self:getArmor() * 0.1 * PLUGIN:armorReduction(dmgT))
		
		if(armorThreshold > dmg * 0.75) then
			local remain = armorThreshold - (dmg * 0.75)
			dmg = dmg - (dmg * 0.75) - remain^(1/2)
		else
			dmg = dmg - armorThreshold
		end
	end	
	
	dmg = dmg * math.max(1 - (res[dmgT] or 0), 0)
	
	dmg = dmg * math.max(1 - (res["dmg"] or 0), 0) --general damage reduction
	
	dmg = math.Round(dmg, 2)
	
	return dmg
end

--function for when a player receives an effect, handles resistance, buff chance, etc
--function playerMeta:receiveEffect(effect)
PLUGIN.helperFuncs["receiveEffect"] = function(self, effect)
	local char = self:getChar()
	
	if(char) then
		local res = self:getRes()
	
		local success = false
		if(effect.debuff) then --debuffing spells
			local effectChance = effect.chance or 100 --spells base chance of activating
			local resist = (res[string.lower(effect.effect)] or 0) * 100 --resistance to this particular effect
			
			resist = resist + (res["effect"] or 0)*100 + (100 - effectChance)
		
			local roll = math.random(0,100)
			
			if(roll > resist) then
				success = true
			end
		elseif(effect.chance) then --spell that with chance to activate but isn't a debuff
			local effectChance = effect.chance --spells base chance of activating
			
			local roll = math.random(1,100)
			if(roll < effectChance) then
				success = true
			end
		else --guaranteed to activate
			success = true
		end	
	
		--local response = ""
		if(success) then
			if(effect.buff or effect.debuff) then
				self:addBuff(effect)
			end

			local effTable = EFFS.effects[effect.effect]
			if(effTable and effTable.func) then
				effTable.func(self, effect)
			end
			
			local responseTbl = {
				success = success,
				duration = effect.duration,
			}
			
			return responseTbl
		else
			--effect resisted
		end
	end
end

function PLUGIN:addHelpers()
	local playerMeta = FindMetaTable("Player")
	--local CEntMeta = baseclass.Get("nut_combat")
	local CEntMeta = PLUGIN.CEntBase
	
	for k, v in pairs(PLUGIN.helperFuncs) do
		playerMeta[k] = v
		CEntMeta[k] = v
	end
end

function PLUGIN:InitializedPlugins()
	PLUGIN:addHelpers()
end