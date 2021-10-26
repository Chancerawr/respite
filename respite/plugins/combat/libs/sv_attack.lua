-- Most of this is currently unused, but it's here anyways
local PLUGIN = PLUGIN

local playerMeta = FindMetaTable("Player")

--targets in radius, used for casting aoe actions
local function findTargetInRad(startPos, radius)
	local entities = ents.FindInSphere(startPos, radius)
	local targets = {}

	for k, target in pairs(entities) do
		if(IsValid(target) and (target:IsPlayer() or target.combat)) then
			if(target:GetMoveType() == MOVETYPE_NOCLIP) then continue end --ignore noclipped people
		
			targets[#targets + 1] = target
		end
	end
	
	return targets
end

--targets in cone, used for aoe actions
local function findTargetInCone(startPos, forward, cone, cone2)
	local entities = ents.FindInCone(startPos, forward * cone, cone, cone2 or 90)
	local targets = {}
	
	for k, target in pairs(entities) do
		if(IsValid(target) and (target:IsPlayer() or target.combat)) then
			if(target:GetMoveType() == MOVETYPE_NOCLIP) then continue end --ignore noclipped people
		
			targets[#targets + 1] = target
		end
	end
	
	return targets
end

--starts the command
function PLUGIN:attackStart(client, attacker, trace, action)
	local entity = trace.Entity
	local target = entity
	local selfOnly = action.selfOnly
	
	if(client:IsPlayer() and client:KeyDown(IN_WALK)) then --self targetting
		selfOnly = true
		--target = client
	end
	
	--local attacker = self:getNetVar("selected", client)
	
	if(selfOnly) then --action that targets self
		if(action.radius) then --sphere around user
			local startPos = attacker:GetPos()

			local targets = findTargetInRad(startPos, action.radius)

			PLUGIN:attack(attacker, targets, action.special)
		else --only affects the user
			PLUGIN:attack(attacker, attacker, action.special, client:GetEyeTrace().HitPos)
		end
	elseif(action.notarget) then --action that requires no target
		if(action.radius) then --no targetted aoe
			local startPos = client:GetEyeTrace().HitPos

			local targets = findTargetInRad(startPos, action.radius)
			
			PLUGIN:attack(attacker, targets, action.special)
		elseif(action.cone) then --cone originating from attacker
			local forward = attacker:GetForward() * Vector(1,1,0)
			
			local targets = findTargetInCone(attacker:GetPos(), forward, action.cone, action.cone2)
			
			PLUGIN:attack(attacker, targets, action.special)
		else --point on the ground, for summons and stuff
			PLUGIN:attack(attacker, nil, action.special, client:GetEyeTrace().HitPos)
		end	
	elseif(IsValid(entity)) then--actions that requires a target
		if (entity.combat or entity:IsPlayer()) then--  and self:canAttackPlayer())) then
			if(IsValid(attacker) and attacker != entity) then
				if(!action.special) then --regular attack, not anything special
					PLUGIN:attack(attacker, target)
				else
					if(action.radius) then --sphere around entity
						local entities = ents.FindInSphere(entity:GetPos(), action.radius)
						
						local targets = findTargetInRad(entity:GetPos(), action.radius)
						
						PLUGIN:attack(attacker, targets, action.special)
					elseif(action.cone) then --cone starting from entity
						local forward = attacker:GetForward() * Vector(1,1,0)

						local targets = findTargetInCone(attacker:GetPos(), forward, action.cone, action.cone2)
						
						PLUGIN:attack(attacker, targets, action.special)	
					else --single target
						PLUGIN:attack(attacker, target, action.special)
					end
				end
				
				if(attacker.combat) then
					--attacker:attackAnim()
				end
			elseif(attacker and !IsValid(attacker)) then
				self:selectTarget() --resets target to nothing
			end
		end
	end
end

--sets up an attack table with info from the attacker and action
function PLUGIN:getAttackData(attacker, action)
	local data = {}
	
	data.attacker = attacker
	data.name = attacker:Name()
	data.attackString = (action and action.attackString) or "attacks"
	
	if(action) then
		if(action.notarg) then
			data.notarget = true
		end
	
		--check costs when they try to do the action
		if(PLUGIN:costCheck(attacker, action)) then
			--mana costs
			if(action.costMP) then
				attacker:addMP(action.costMP * -1)
			end

			if(action.costHP) then
				attacker:addHP(action.costHP * -1)
			end
		else
			--attacker:notify("You do not have enough mana to use " ..action.name.. ".")
			data.failed = true --tell it that it failed
			data.actionName = action.name
			return data
		end
		
		--chance of action activation
		if(action.chance) then
			local roll = math.random(1,100)
			if(roll > tonumber(action.chance)) then --action failed
				data.failed = true --tell it that it failed
				data.actionName = action.name
				return data
			end
		end
		
		--if the action does damage we worry about damage bonuses and etc
		if(action.dmg) then
			--magic grade scaling from items/buffs
			--[[
			if(!action.martial) then
				local magicBonus = attacker:getMagic()

				if(magicBonus > action.dmg) then
					action.dmg = action.dmg + action.dmg + (magicBonus - action.dmg)^(0.75)
				else
					action.dmg = action.dmg + magicBonus
				end
			end
			--]]
		
			--damage from attributes
			if(action.mult) then 
				if(attacker:IsPlayer()) then --players
					for attrib, mult in pairs(action.mult) do
						action.dmg = action.dmg + (attacker:getChar():getAttrib(attrib, 0) * mult)
					end
				else --combat entities
					for attrib, mult in pairs(action.mult) do
						action.dmg = action.dmg + ((attacker.attribs[attrib] or 0) * mult)
					end
				end
			end
			
			if(action.useWeapon) then
				local weaponDmg = 0
				for k, v in pairs(attacker:getDamage()) do
					weaponDmg = weaponDmg + v.dmg
				end
				
				action.dmg = action.dmg + weaponDmg * action.useWeapon
			end

			local amp = attacker:getAmp()
			if(amp) then
				if(amp[action.dmgT]) then
					action.dmg = action.dmg * (1 + amp[action.dmgT])
				end
			end

			local accuracy = attacker:getAccuracy() + (action.accuracy or 0)
			
			--damage table
			data.damage = {}
			
			for i = 1, (action.multi or 1) do --multiple hits
				data.damage[i] = {
					dmg = action.dmg,
					dmgT = action.dmgT,
					accuracy = accuracy,
					special = action.special,
				}
			end
		else
			data.damage = {}
		end
		
		--action effects
		data.effects = action.effects
		
		--summons
		data.summon = action.summon
		
		--special things
		data.special = action.special
	else
		--basic attack
		data.damage = attacker:getDamage()
	end
	
	data.text = nil

	return data	
end

--main attack function, handles mostly everything
function PLUGIN:attack(attacker, target, actionID, pos, actionOverwrite)
	local name = attacker:Name() --name of attacker
	local action = actionOverwrite or table.Copy(ACTS.actions[actionID] or nut.plugin.list["actions"].actionList[actionID])

	local attackInfo = PLUGIN:getAttackData(attacker, action)

	if(attackInfo.failed) then
		local response = name.. "'s ability <" ..attackInfo.actionName.. "> has failed to activate!"
		
		nut.chat.send(attacker, "react_npc", response)

		nut.log.addRaw(response, 2)
		
		return false --just stop here we dont need to do anything else
	end

	--if it's a summoning action or summons something when it happens
	if(attackInfo.summon) then
		PLUGIN:summonAction(attacker, action, pos)
	end

	--if the action does something special
	if(attackInfo.special) then
		if(istable(target)) then
			for k, v in pairs(target) do
				action.special(attacker, v)
			end
		elseif(target) then
			action.special(attacker, target)
		end
	end

	local responseString = {}

	--handles damage parts of the attack
	local damage = attackInfo.damage --damage table
	if(damage) then
		if(istable(target)) then
			for k, v in pairs(target) do
				if(action.noSelf and v == attacker) then continue end
			
				PLUGIN:damageProcess(v, attackInfo, responseString)
			end
		--elseif(target) then
		else
			if(action and action.noSelf and target == attacker) then return end
			
			PLUGIN:damageProcess(target, attackInfo, responseString)
		end
	end
	
	PLUGIN:combatStringCreate(attackInfo, responseString, target)
end

--processing damage and creates the chat message
function PLUGIN:damageProcess(target, attack, responseString)
	local attackInfo = table.Copy(attack) --just in case

	local damage = PLUGIN:tagsEffects(target, attackInfo) or attackInfo.damage
	
	local current = #responseString + 1
	responseString[current] = {}
	
	if(target and target.Name) then
		responseString[current].target = target
	end
	
	if(!table.IsEmpty(damage)) then			
		local totalDam = 0
		
		responseString[current].dmg = {}
		for k, v in pairs(damage) do			
			if(!v.dmg) then	continue end
			
			--variance
			v.dmg = math.Round(math.Rand(v.dmg * 0.9, v.dmg * 1.1), 2)
			
			--evasion
			local evade, evaReduct
			if(target) then
				evade, evaReduct = PLUGIN:evadeCalc(target, v.accuracy, v.dmg)
				
				v.dmg = v.dmg * (evaReduct or 1)
			
				v.dmg = target:receiveDamage(v.dmg, v.dmgT) --resistances handled in here
			end
			
			--round it so there's no crazy decimals
			v.dmg = math.Round(math.max(v.dmg, 0), 2) 
			
			if(target) then
				--set the target's hp
				target:addHP(v.dmg * -1)
			end
			
			--string compilation
			local dmgS = (v.dmg or 0).. " "
			local critS = ((v.crit and "(Crit!) ") or "")
			local evasionS = ((evade and "[" ..evade.. "] ") or "")
			local weapS = (v.weap and "{" ..v.weap.. ": " or "")
			local dmgTS = (v.dmgT or "Crush")
			local weap2S = (v.weap and "}" or "")
			
			responseString[current].dmg[#responseString[current].dmg + 1] = {
				target = target,
				dmg = v.dmg,
				dmgT = v.dmgT,
				crit = v.crit,
				evade = evade,
				weapon = v.weap,
			}

			totalDam = totalDam + (v.dmg or 0)
		end
	end
	
	if(attackInfo.effects) then
		responseString[current].effects = {}
		
		for k, effect in pairs(attackInfo.effects) do
			if(!effect.selfApply) then --regular effects on target
				if(target) then
					target:receiveEffect(effect, responseString[current].effects)
				end
			else --self effects from action
				if(attackInfo.attacker) then
					attackInfo.attacker:receiveEffect(effect, responseString[current].effects)
				end
			end
		end
	end

	if(IsValid(target)) then
		local remainHP = "[" ..target:getHP().. "]"
		--nut.log.addRaw(response.. " HP: " ..remainHP, 2)
	else
		--nut.log.addRaw(response, 2)
	end
end

--strap in, this is a nightmare
function PLUGIN:combatStringCreate(attackInfo, responseString, targets)	
	local chatPrint = ""
	
	--source of the attack
	if(attackInfo.attacker) then
		chatPrint = chatPrint..attackInfo.attacker:Name().. " "
	else
		chatPrint = chatPrint.. "Something "
	end
	
	--attack's description
	if(attackInfo.attackString) then
		chatPrint = chatPrint..attackInfo.attackString
	else
		chatPrint = chatPrint.. "attempts to use {" ..(attackInfo.actionName or "Attack").."}"
	end
	
	--list of targets
	local targetList
	if(targets) then
		targetList = ""
		if(istable(targets)) then
			for k, v in pairs(targets) do
				if(k > 1) then
					targetList = targetList.. ", "
				end
			
				targetList = targetList..v:Name()
			end
		else
			targetList = targets:Name()
		end
		
		chatPrint = chatPrint.. " " ..targetList
	end
	
	chatPrint = chatPrint.. "."
	--first line done by now
	
	--second and further lines here
	local targetPrints = {} --this is necessary for effects/attacks that hit the attackers and stuff like that
	for k, response in pairs (responseString) do
		local dmgPrint = ""
		if(response.dmg) then --all damage that's been done with this action
			local totalDmg = 0
			
			for k, v in pairs(response.dmg) do
				if(!targetPrints[v.target]) then
					targetPrints[v.target] = {}
				end
				
				dmgPrint = targetPrints[v.target].dmg or " | " --this ensures that things properly get set to the right targets
			
				local dmgS = (v.dmg or 0).. " "
				local dmgTS = (v.dmgT or "Crush")
				local critS = ((v.crit and "(Crit!) ") or "")
				local evasionS = ((v.evade and "[" ..v.evade.. "] ") or "")
				local weapS = (v.weapon and "{" ..v.weapon.. ": " or "")
				local weap2S = (v.weapon and "}" or "")
				
				--anything but first in table
				if(k > 1) then
					dmgPrint = dmgPrint.. " + "
				end
				
				--{dmg {weapon: dmgT}} + {dmg {weapon: dmgT}} [totalDmg]
				dmgPrint = dmgPrint.. "{" ..dmgS..critS..evasionS..weapS..dmgTS.. "}" ..weap2S
				
				totalDmg = totalDmg + v.dmg
				
				if(k == #response.dmg and k > 1) then --last in table
					dmgPrint = dmgPrint.. " [" ..totalDmg.. "]"
				end
				
				targetPrints[v.target].dmg = dmgPrint
			end
		end
		
		local effectPrint = ""
		if(response.effects) then
			for k, effect in pairs(response.effects) do
				if(!targetPrints[effect.target]) then
					targetPrints[effect.target] = {}
				end
				
				effectPrint = targetPrints[effect.target].eff or " | " --this ensures that things properly get set to the right targets
			
				if(!effect.resist) then --not resisted				
					effectPrint = effectPrint.. "[" ..effect.name
				
					if(effect.dmg) then
						effectPrint = effectPrint.. " {" ..effect.dmg.." " ..(effect.dmgT or "").. "}"
					end
					
					if(effect.duration) then
						effectPrint = effectPrint.. " " ..effect.duration.. "T"
					end
					
					effectPrint = effectPrint.. "] "
				else --resisted
					effectPrint = effectPrint.. "[" ..effect.name.. " resisted] "
				end
				
				targetPrints[effect.target].eff = effectPrint
			end
		end
	end
	
	--this is how we put everything together
	local subPrint = ""
	for k, v in pairs(targetPrints) do
		subPrint = subPrint.. "\n" .. "[" ..k:Name().. "]"
		
		if(v.dmg) then
			subPrint = subPrint..v.dmg.. " damage"
		end
		
		if(v.eff) then
			subPrint = subPrint..v.eff
		end
	end
	
	local finalPrint = chatPrint..subPrint --finally we have everything
	
	PLUGIN:sendCombatMessage(finalPrint, attackInfo.attacker, targets)
	
	--[[
	if(IsValid(target)) then
		local remainHP = "[" ..target:getHP().. "]"
		--nut.log.addRaw(response.. " HP: " ..remainHP, 2)
	else
		--nut.log.addRaw(response, 2)
	end
	--]]
end

function PLUGIN:sendCombatMessage(finalPrint, source, targets)
	--who all will receive the chat message
	local receivers = {}
	if(source) then
		receivers[source] = 1
	end

	if(targets and istable(targets)) then
		for k, v in pairs(targets) do
			if(v:IsPlayer()) then
				receivers[v] = 2
			end
		end
	else
		receivers[targets] = 2
	end

	if(source) then
		local entities = ents.FindInSphere(source:GetPos(), nut.config.get("chatRange", 280) * 5)
		for k, v in pairs(entities) do
			if(v:IsPlayer()) then
				receivers[v] = 3
			end
		end
	end

	for k, v in pairs(receivers) do
		if(v < 3) then
			nut.chat.send(k, "react_npc", finalPrint, false, {k}) --print it
		else
			nut.chat.send(source, "react_npc", finalPrint, false, {k}) --print it
		end
	end
	
	nut.log.addRaw(finalPrint, 2)
end