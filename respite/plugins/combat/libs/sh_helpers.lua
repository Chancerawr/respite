local PLUGIN = PLUGIN

local playerMeta = FindMetaTable("Player")

local function addActionToTbl(actions, actionData, item)
	actions[#actions + 1] = {
		uid = actionData.uid,
		name = actionData.name,
		notarget = actionData.notarg,
		radius = actionData.radius,
		cone = actionData.cone,
		cone2 = actionData.cone2,
		selfOnly = actionData.selfOnly,
		attackOverwrite = actionData.attackOverwrite,
		weapon = (item and item.id) or false, --ID of the weapon
	}
end

--retrieves all the actions the player should have access to
function playerMeta:getActions()
	local char = self:getChar()
	if(!char) then return {} end --only on loaded characters please
	
	local actions = {}

	if(ACTS) then
		--abilities from equipment
		--[[
		local itemActions = {}
		if(char:getInv()) then
			for k, v in pairs(char:getInv():getItems()) do
				if(v:getData("equip") and v.actions) then
					for _, action in pairs(v.actions) do
						itemActions[#itemActions+1] = {
							action = action, 
							itemID = item.id,
						}
					end
				end
			end
		end
		--]]
	
		for k, action in pairs(ACTS.actions) do
			if(action.hidden) then continue end
		
			--if the ability requires stat thresholds to use
			if(action.reqStats) then
				local reqStats = true
				for attrib, reqVal in pairs(action.reqStats) do
					if(char:getAttrib(attrib) < reqVal) then
						reqStats = false
					end
				end
				if(!reqStats) then continue end
			end
			
			actions[#actions + 1] = {
				uid = action.uid,
				name = action.name,
				category = action.category,
				notarget = action.notarg,
				radius = action.radius,
				cone = action.cone,
				cone2 = action.cone2,
				selfOnly = action.selfOnly,
				attackOverwrite = action.attackOverwrite,
				--weapon = (item and item.id) or false, --ID of the weapon
			}
		end
	end

	return actions
end

--function for when a player receives damage, handles armor, resistance, etc
function playerMeta:receiveDamage(dmg, dmgT)
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
	
	dmg = dmg * math.max(1 - (res["end"] or 0), 0) --endurance reduction
	
	dmg = math.Round(dmg, 2)
	
	return dmg
end

--function for when a player receives an effect, handles resistance, buff chance, etc
function playerMeta:receiveEffect(effect, responseString)
	local char = self:getChar()
	
	local res = self:getRes()
	
	if(char) then
		local current = #responseString + 1
		responseString[current] = {}
	
		responseString[current].target = self
	
		local success = false
		if(effect.debuff) then --debuffing spells
			local effectChance = effect.chance or 100 --spells base chance of activating
			local resist = (res[string.lower(effect.effect)] or 0) * 100 --resistance to this particular effect
			
			resist = resist + res["end"] or 0
			
			local roll = math.random(1,100)
			if(roll < (effectChance - resist)) then
				success = true
			end
		elseif(effect.chance) then --spell that has a chance to activate but isn't a debuff
			local effectChance = effect.chance --spells base chance of activating
			
			local roll = math.random(1,100)
			if(roll < effectChance) then
				success = true
			end
		else --guaranteed to activate
			success = true
		end	
	
		--local response = ""
		responseString[current].name = effect.name or effect.effect
		if(success) then
			if(effect.buff or effect.debuff) then
				self:addBuff(effect)
			end
			
			local name = self.Name and self:Name() or ""
			--response = response.. "\n(" ..name.. ") [" ..(effect.name or effect.effect).. "]"
			
			
			if(effect.dmg) then
				--response = response.. " deals " ..effect.dmg.." " ..(effect.dmgT or "").. " damage"
				
				responseString[current].dmg = effect.dmg
				responseString[current].dmgT = effect.dmgT
			end
			
			if(effect.duration) then
				responseString[current].duration = effect.duration
				
				--[[
				if(effect.duration > 1) then
					response = response.. " for the next " ..effect.duration.. " turns"
				else
					response = response.. " for the current turn"
				end
				--]]
			end
			
			local effTable = EFFS.effects[effect.effect]
			if(effTable) then
				effTable.func(self, effect)
			end
			
			--response = response.. "."
		else
			--response = response.. "\n[" ..(effect.name or effect.effect).. " resisted]"
		end
		
		--return response
	end
end

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
				return 0.8
			elseif(graze > 40) then
				return 0.6
			elseif(graze > 30) then
				return 0.5
			elseif(graze > 20) then
				return 0.4
			elseif(graze > 10) then
				return 0.3
			else
				if(math.random(1,10) == 10) then
					return 0.2
				else
					return 0
				end
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
function PLUGIN:costCheck(client, action)
	--[[
	if(action.costMP and action.costMP > 0) then
		if(client:getMP() < action.costMP) then
			return false
		end
	end
	--]]
	
	return true
end

--gets the damage a player does with a reegular attack
function playerMeta:getDamage()
	local char = self:getChar()
	
	if(char) then
		local totalDam = {}
		local dualCheck = 0
		for k, v in pairs(char:getInv():getItems()) do
			if(v:getData("equip")) then
				if(v:getData("dual", v.weapondual) and v:getData("slot", v.buffCategory) == "Weapon") then
					dualCheck = dualCheck + 1
				end
				
				local dmg = v:getData("dmg", v.dmg)
				if(dmg) then
					for name, mult in pairs(v:getData("scale", v.scaling) or {}) do
						local attrib = char:getAttrib(name, 0)
						local attribBonus = (attrib * mult)
						
						if(attribBonus > dmg) then
							dmg = dmg + dmg + (attribBonus - dmg)^(0.5)
						else
							dmg = dmg + attribBonus
						end
					end
				
					local dmgT = v:getData("dmgT", v.dmgT)

					--damage amplification
					local amp = self:getAmp()
					if(amp) then
						if(amp[dmgT]) then
							dmg = dmg * (1 + amp[dmgT])
						end
					end
				
					--critical hits
					local crit = self:getCrit()
					if(crit) then
						dmg = dmg * crit
					end
					
					--direct dmg buffs
					dmg = dmg + self:getBuffAttribute("dmgAmp")
				
					totalDam[#totalDam + 1] = {
						dmg = dmg, 
						dmgT = dmgT,
						weap = v:getName(),
						crit = crit,
						accuracy = self:getAccuracy()
					}
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

function playerMeta:getRes()
	local char = self:getChar()
	if(!char) then return {} end
	
	local inv = char:getInv()
	
	--resistance, start with resist from buffs
	local res = self:getBuffAttributeTbl("res") or {}
	
	res["end"] = (char:getAttrib("end", 0) * 0.25)
	
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
	
	--magic resistance from intelligence
	local int = char:getAttrib("intelligence", 0) * 0.25
	if(int > 0) then
		local magicTypes = {
			["Arcane"] = true,
			["Fire"] = true,
			["Water"] = true,
			["Cold"] = true,
			["Lightning"] = true,
			["Dark"] = true,
			["Light"] = true,
		}
		
		for k, v in pairs(magicTypes) do
			if(res[k]) then
				res[k] = 1 - (1 - res[k]) * (1 - int * 0.01)
			else
				res[k] = 1 - (1 - int * 0.01)
			end
		end
	end
	
	--rounds resistance so it isnt scary numbers
	for k, v in pairs(res) do
		res[k] = math.Round(v, 4)
	end

	return res
end

--outgoing damage amplifications
function playerMeta:getAmp()
	local char = self:getChar()
	local inv = char:getInv()
	
	--resistance, start with resist from buffs
	local amp = self:getBuffAttributeTbl("amp") or {}
	
	for k, v in pairs(amp) do
		amp[k] = v * 0.01
	end
	
	--resist from items
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

--returns physical armor from all sources
function playerMeta:getArmor()
	local char = self:getChar()
	
	local armor = 0
	
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
		
		armor = armor + (char:getAttrib("end", 0) * 2)

		armor = armor + self:getBuffAttribute("armor")
		
		armor = math.Round(armor, 2)
	end
	
	return armor
end

--returns evasion from all sources
function playerMeta:getEvasion()
	local char = self:getChar()
	
	local evasion = 0
	
	if(char) then
		local inv = char:getInv()
		
		for k, v in pairs(inv:getItems()) do
			if(v:getData("equip")) then
				local itemEvasion = v:getData("evasion", v.evasion)
				if(itemEvasion) then
					evasion = evasion + itemEvasion
				end
			end
		end
	
		evasion = evasion + (char:getAttrib("stm", 0) * 1.5)

		evasion = evasion + (char:getAttrib("talent", 0) * 0.75)
		
		evasion = evasion + (char:getAttrib("luck", 0) * 0.5)
		
		evasion = evasion - (self:getWeight() * 0.25)
		
		evasion = evasion + self:getBuffAttribute("evasion")
	end
	
	return evasion
end

--returns accuracy from all sources
function playerMeta:getAccuracy()
	local char = self:getChar()
	
	local accuracy = 1
	
	if(char) then
		local inv = char:getInv()
	
		for k, v in pairs(inv:getItems()) do
			if(v:getData("equip")) then
				local itemAccuracy = v:getData("accuracy", v.accuracy)
				if(itemAccuracy) then
					accuracy = accuracy + itemAccuracy
				end
			end
		end
	
		accuracy = accuracy + (char:getAttrib("foresight", 0) * 2)

		accuracy = accuracy + (char:getAttrib("talent", 0) * 1)
		
		accuracy = accuracy + (char:getAttrib("luck", 0) * 0.2)
		
		accuracy = accuracy + self:getBuffAttribute("accuracy")
	end
	
	return accuracy
end

--returns player's crit chance and crit multiplier
function playerMeta:getCrit()
	local char = self:getChar()
	local mult
	
	if(char) then
		local inv = char:getInv()
	
		local itemCritC = 0
		local itemCritM = 0
		for k, v in pairs(inv:getItems()) do
			if(v:getData("equip")) then
				itemCritC = itemCritC + ((v:getData("critC", v.critC) or 0) * 10)
				itemCritM = itemCritM + (v:getData("critM", v.critM) or 0)
			end
		end
	
		local luck = char:getAttrib("luck", 0)
		local tal = char:getAttrib("talent", 0)
		
		--base crit chance is 1.5% (15)
		local critChance = 15 + (luck * 3) + itemCritC + self:getBuffAttribute("critC") * 10
		
		local roll = math.random(1, 1000)
		if(roll < critChance) then
			mult = 1.2 + luck * 0.05 + tal * 0.01 + itemCritM + self:getBuffAttribute("critM")
		end
	end
	
	return mult
end

--returns equipment weight from equipped items
function playerMeta:getWeight()
	local char = self:getChar()
	
	local weight = 0
	if(char) then
		for k, v in pairs(char:getInv():getItems()) do
			if(v:getData("equip")) then
				weight = weight + (v:getData("weight", v.weight) or 0)
			end
		end
	end
	
	return weight
end

--returns maximum weight capacity
function playerMeta:getMaxWeight()
	local char = self:getChar()
	
	local str = char:getAttrib("str", 0)
	local vit = char:getAttrib("vitality", 0)
	
	local maxWeight = 10 + (str * 0.6) + (vit * 1.1) + (self:getLevel() * 0.15)
	
	return maxWeight
end

--returns magic bonus from intelligence, unused
--[[
function playerMeta:getMagic()
	local char = self:getChar()
	local inv = char:getInv()
	
	local intelligence = char:getAttrib("intelligence", 0)
	local magic = 0.2
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