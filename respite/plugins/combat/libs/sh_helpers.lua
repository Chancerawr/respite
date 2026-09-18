local PLUGIN = PLUGIN

PLUGIN.helperFuncs = PLUGIN.helperFuncs or {}

--calculates hit chance with the accuracy of an attack and a target
function PLUGIN:hitCalc(accuracy, target)
	local evasion = target:getEvasion()
	
	--evasion = math.max(evasion, 0.1) --don't want evasion at 0, probably not necessary if we don't multiple/divide
	
	local hit = accuracy - evasion --difference between accuracy and evasion
	
	if(hit > 0) then --if accuracy is higher than evasion, full hit.
		return 1
	else --if evasion is higher than accuracy, process a graze/dodge
		local roll = math.random(1,10)

		if((hit * -1) > roll) then --essentially (evasion - accuracy), higher evasion means it's more likely to be higher than the roll.
			local roll2 = math.random(1,100) --second roll for grazes
			local graze = roll2 + hit --adds the second roll to (accuracy - evasion) to check damage reduction from dodge

			--lower graze is "better" for the person evading, lower roll2 + hit means less damage from attack
			if(graze > 50) then
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

--creates a table for targeting data for the cswep
function PLUGIN:actionFormat(actionTbl, item)
	local itemName = ""
	if(item) then
		itemName = " (" ..item:getName().. ")"
	end

	local action = {
		uid = actionTbl.uid,
		name = actionTbl.name..itemName,
		category = actionTbl.category,
		notarget = actionTbl.notarget,
		radius = actionTbl.radius,
		cone = actionTbl.cone,
		cone2 = actionTbl.cone2,
		box = actionTbl.box,
		selfOnly = actionTbl.selfOnly,
		itemUse = actionTbl.itemUse,
		weapon = item and item.id, --ID of the weapon
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
	
	local CEntActions = self:getNetVar("actions", self.actions)
	if(CEntActions) then
		for k, v in pairs(CEntActions) do
			local action = PLUGIN:actionFind(v)
			if(action) then
				actions[#actions+1] = PLUGIN:actionFormat(action)
			end
		end
	end
	
	for k, actionData in pairs(ACTS.actions) do
		if(actionData.hidden) then continue end
	
		-- Default actions
		--[[
		if(actionData.category == "Default") then
			actions[#actions+1] = PLUGIN:actionFormat(actionData)
			continue
		end
		--]]
		
		if(actionData.trait) then
			if(!self:hasTrait(actionData.trait)) then continue end
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

		actions[#actions+1] = PLUGIN:actionFormat(actionData)
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
				
					actions[#actions+1] = PLUGIN:actionFormat(actionData, v)
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
				
				actions[#actions+1] = PLUGIN:actionFormat(actionData, v)
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
		local CEntdmg = self:getNetVar("dmg", self.dmg)
		if(CEntdmg) then
			for dmgT, dmgV in pairs(CEntdmg) do
				local dmg = dmgV
				
				--direct dmg buffs
				dmg = dmg + self:getBuffAttribute("dmg")
			
				totalDam[#totalDam + 1] = {
					dmg = dmg, 
					dmgT = dmgT,
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
						local dmg = tonumber(dmgV)
					
						for name, mult in pairs(v:getData("scale", v.scaling) or {}) do
							local attrib = char:getAttrib(name, 0)
							local attribBonus = (attrib * mult)
							
							if(attribBonus > dmg) then
								dmg = dmg + dmg + (attribBonus - dmg)^(0.5)
							else
								dmg = dmg + attribBonus
							end
						end
						
						--direct dmg buffs
						dmg = dmg + self:getBuffAttribute("dmg")
					
						totalDam[#totalDam + 1] = {
							dmg = dmg, 
							dmgT = dmgT,
							weap = v:getName(),
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
				dmgT = "Blunt",
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
	local res = self:getNetVar("res", self.res or {})
	res = table.Copy(res)
	
	hook.Run("nut_OnGetRes", self, res)

	res["dmg"] = (res["dmg"] or 0) + (char:getAttrib("end", 0) * 0.25)
	res["effect"] = (res["effect"] or 0) + (char:getAttrib("end", 0) * 0.25) + (char:getAttrib("fortitude", 0) * 0.25)
	
	for k, v in pairs(res) do
		res[k] = v * 0.01
	end
	
	--resist from items
	for k, v in pairs(inv:getItems()) do
		if(v:getData("equip")) then
			for k2, v2 in pairs(v:getData("res", self.res) or {}) do
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

--gets how much armor a player has from items, buffs, etc
--function playerMeta:getArmor()
PLUGIN.helperFuncs["getArmor"] = function(self)
	local char = self:getChar()
	
	local armor = self:getNetVar("armor", self.armor or 0)
	
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
	
	local evasion = self:getNetVar("evasion", self.evasion or 0)
	evasion = tonumber(evasion)
	
	if(char) then
		evasion = evasion + (char:getAttrib("stm", 0) * 0.5)
		
		evasion = evasion + (char:getAttrib("luck", 0) * 0.25)
		
		--evasion = evasion - (self:getWeight() * 0.25)
		
		evasion = evasion + self:getBuffAttribute("evasion")
	end

	return evasion
end

--gets how much accuracy a player has
--function playerMeta:getAccuracy()
PLUGIN.helperFuncs["getAccuracy"] = function(self)
	local char = self:getChar()
	
	local accuracy = self:getNetVar("accuracy", self.accuracy or 1)
	accuracy = tonumber(accuracy)
	
	if(char) then
		accuracy = accuracy + (char:getAttrib("accuracy", 0) * 1)
		
		accuracy = accuracy + (char:getAttrib("perception", 0) * 1)
		
		accuracy = accuracy + (char:getAttrib("luck", 0) * 0.25)
		
		accuracy = accuracy + self:getBuffAttribute("accuracy")
	end
	
	return accuracy
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

	local data = {dmg = dmg, dmgT = dmgT}
	hook.Run("nut_OnCombatReceiveDamage", self, data)
	
	dmg = data.dmg
	dmgT = data.dmgT

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