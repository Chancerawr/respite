-- Most of this is currently unused, but it's here anyways
local PLUGIN = PLUGIN

local playerMeta = FindMetaTable("Player")

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

local function findTargetInBox(hitpos, boxMaxs)
	local centerOffset = -0.5 * Vector(boxMaxs[1],boxMaxs[2],0)

	local boxStart = hitpos + centerOffset
	local boxEnd = hitpos + Vector(boxMaxs[1],boxMaxs[2],boxMaxs[3]) + centerOffset

	local entities = ents.FindInBox(boxStart, boxEnd)
	local targets = {}
	
	for k, target in pairs(entities) do
		if(IsValid(target) and (target:IsPlayer() or target.combat)) then
			if(target:GetMoveType() == MOVETYPE_NOCLIP) then continue end --ignore noclipped people
		
			targets[#targets + 1] = target
		end
	end
	
	return targets
end

--finds targets for abilities
function PLUGIN:attackStart(client, attacker, trace, action)
	local target = trace.Entity
	local hitPos = client:GetEyeTrace().HitPos
	
	local selfOnly = action.selfOnly
	if(client:IsPlayer() and client:KeyDown(IN_WALK)) then --self targetting
		selfOnly = true
	end
	
	if(selfOnly) then --action that targets self
		if(action.radius) then --sphere around caster
			local targets = findTargetInRad(attacker:GetPos(), action.radius)

			PLUGIN:attack(attacker, targets, action.uid)
		elseif(action.box) then
			local targets = findTargetInBox(attacker:GetPos(), action.box)
			
			PLUGIN:attack(attacker, targets, action.uid)
		else --only affects the caster
			PLUGIN:attack(attacker, {attacker}, action.uid, hitPos)
		end
	elseif(action.notarget) then --action that requires no target
		if(action.radius) then --no targetted aoe
			local targets = findTargetInRad(hitPos, action.radius)
			
			PLUGIN:attack(attacker, targets, action.uid)
		elseif(action.cone) then --cone originating from attacker
			local forward = attacker:GetForward() * Vector(1,1,0)
			
			local targets = findTargetInCone(attacker:GetPos(), forward, action.cone, action.cone2)
			
			PLUGIN:attack(attacker, targets, action.uid)
		elseif(action.box) then
			local targets = findTargetInBox(hitPos, action.box)
			
			PLUGIN:attack(attacker, targets, action.uid)
		else --point on the ground, for summons and stuff
			PLUGIN:attack(attacker, nil, action.uid, hitPos)
		end	
	elseif(IsValid(target)) then--actions that requires a target
		if (target.combat or target:IsPlayer()) then
			if(IsValid(attacker) and attacker != target) then
				if(!action.uid) then --regular attack, not a action
					PLUGIN:attack(attacker, {target})
				else
					if(action.radius) then --sphere around entity
						local entities = ents.FindInSphere(target:GetPos(), action.radius)
						
						local targets = findTargetInRad(target:GetPos(), action.radius)
						
						PLUGIN:attack(attacker, targets, action.uid)
					elseif(action.cone) then --cone starting from target
						local forward = attacker:GetForward() * Vector(1,1,0)

						local targets = findTargetInCone(attacker:GetPos(), forward, action.cone, action.cone2)
						
						PLUGIN:attack(attacker, targets, action.uid)
					elseif(action.box) then
						local targets = findTargetInBox(attacker:GetPos(), action.box)
						
						PLUGIN:attack(attacker, targets, action.uid)
					else --single target
						PLUGIN:attack(attacker, {target}, action.uid)
					end
				end
				
				if(attacker.combat) then
					--attacker:attackAnim()
				end
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
		if(action.notarget) then
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
			
			if(action.weaponMult) then
				local weaponDmg = 0
				
				local highestDmg = 0
				for k, v in pairs(attacker:getDamage()) do
					weaponDmg = weaponDmg + v.dmg
					
					if(!action.dmgT and v.dmgT) then --just overwrite the damage type for now
						if(highestDmg < v.dmg) then
							highestDmg = v.dmg
							action.dmgT = v.dmgT
						end
					end
				end
				
				action.dmg = action.dmg + weaponDmg * action.weaponMult
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
	--use table.Copy just in case
	local action = table.Copy(actionOverwrite) or table.Copy(ACTS.actions[actionID])
	local attackInfo = PLUGIN:getAttackData(attacker, action, target)

	if(attackInfo.failed) then
		local response = attacker:Name().. "'s ability <" ..attackInfo.name.. "> has failed to activate!"
		
		nut.chat.send(attacker, "react_npc", response)
		
		nut.log.addRaw(response, 2)
		
		return false
	end
	
	attacker:buffOnHit() --for buffs that have charges reduced by hitting things

	--if it's a summoning action or summons something when it happens
	if(attackInfo.summon) then
		PLUGIN:summonAction(attacker, action, pos)
	end

	--local response = attackInfo.name.. " " ..(attackInfo.attackString or "")
	local responseTbl = {}

	--handles damage parts of the attack
	local damage = attackInfo.damage --damage table
	local effects = attackInfo.effects
	local special = attackInfo.special
	
	if(target) then
		for k, v in pairs(target) do
			if(attackInfo.noSelf and v == attacker) then continue end
			
			if(damage) then
				if(!responseTbl["dmg"]) then responseTbl["dmg"] = {} end
				responseTbl["dmg"][v] = PLUGIN:damageProcess(v, attackInfo)
			end
			
			if(effects) then
				if(!responseTbl["effect"]) then responseTbl["effect"] = {} end
				
				local effectResponse, extraResponse = PLUGIN:effectProcess(v, attackInfo)
				
				--effects affecting the target
				responseTbl["effect"][v] = effectResponse
				
				if(extraResponse) then
					responseTbl["effect"][attacker] = responseTbl["effect"][attacker] or {}
					--effects affecting the attacker (selfApply)
					table.Merge(responseTbl["effect"][attacker], extraResponse)
				end
			end
			
			if(special) then
				spell.special(attacker, v)
			end
		end
	end
	
	PLUGIN:combatStringCreate(attackInfo, responseTbl)
end

--processing damage and creates the chat message
function PLUGIN:damageProcess(target, attack, responseString)
local attackInfo = table.Copy(attack) --just in case

	local damage = attackInfo.damage
	
	local responseTbl = {} --for printed string later
	
	if(IsValid(target)) then
		if(!table.IsEmpty(damage)) then			
			local totalDam = 0
			
			for k, v in pairs(damage) do			
				if(!v.dmg) then	continue end
				
				--variance
				v.dmg = math.Round(math.Rand(v.dmg * 0.9, v.dmg * 1.1), 2)
				
				--evasion
				local evade, evaReduct
				evade, evaReduct = PLUGIN:evadeCalc(target, v.accuracy, v.dmg)
				
				v.dmg = v.dmg * (evaReduct or 1)
			
				v.dmg = target:receiveDamage(v.dmg, v.dmgT) --resistances handled in here
				
				--round it so there's no crazy decimals
				v.dmg = math.Round(math.max(v.dmg, 0), 2) 
				
				--set the target's hp
				target:addHP(v.dmg * -1)
				
				local lifesteal = attackInfo.attacker:getLifesteal()
				if(lifesteal != 0) then
					attackInfo.attacker:addHP(math.Round(v.dmg * lifesteal, 2))
				end
				
				if(v.lifesteal) then
					attackInfo.attacker:addHP(math.Round(v.dmg * v.lifesteal, 2))
				end
				
				responseTbl[#responseTbl+1] = {
					dmgT = v.dmgT,
					dmg = v.dmg,
					crit = v.crit,
					evade = evade,
					weapon = v.weap,
				}
				
				--for buffs that have charges reduced by getting hit
				target:buffGetHit()
			end
		end
	end
	
	return responseTbl
end

--processing effects and creates the chat message
function PLUGIN:effectProcess(target, attack)
	local attackInfo = table.Copy(attack) or {} --just in case
	local effects = attackInfo.effects

	local responseTbl = {}
	local extraTbl

	for k, effect in pairs(effects) do
		local effectName = effect.name or effect.effect or effect.uid
	
		if(effect.uid) then
			effect.uid = effect.uid..k
		end
	
		if(effect.selfApply) then --self effects from casting spell
			if(attackInfo.attacker) then	
				extraTbl = extraTbl or {}
				extraTbl[effectName] = attackInfo.attacker:receiveEffect(effect)
			end
		else --regular effects on target
			if(target) then
				responseTbl[effectName] = target:receiveEffect(effect)
			end
		end
	end
	
	return responseTbl, extraTbl
end

function PLUGIN:combatStringCreate(attackInfo, responseTbl)	
	local attacker = attackInfo.attacker

	local chatPrint = ""
	
	--start of the string, "Attacker "
	chatPrint = chatPrint..((attackInfo.name and attackInfo.name.. " ") or "Something ")
	
	local weaponString = ""
	if(attacker:IsPlayer()) then
		local char = attacker:getChar()
		for k, v in pairs(char:getInv():getItems()) do
			if(!v:getData("equip")) then continue end
			if(!v:getData("dmg", v.dmg)) then continue end

			weaponString = weaponString.. " {" ..v:getName().. "}"
		end
	end
	
	--attack's description
	if(attackInfo.attackString) then
		chatPrint = chatPrint..attackInfo.attackString.. "." ..weaponString
	else
		chatPrint = chatPrint.. "attempts to use {" ..(attackInfo.name or "Attack").."}"
	end
	
	--damage line
	local dmgPrint = ""
	local dmgTbl = responseTbl.dmg
	if(dmgTbl and !table.IsEmpty(dmgTbl)) then
		dmgPrint = "[DAMAGE]"
		
		for client, clientDMG in pairs(dmgTbl) do
			local totalDam = 0 --total damage
		
			dmgPrint = dmgPrint.. " " ..client:Name().. " {"
			for k, dmgTbl in pairs(clientDMG) do
				totalDam = totalDam + (dmgTbl.dmg or 0)
			
				local dmgS = (dmgTbl.dmg or 0).. " "
				local critS = ((dmgTbl.crit) or "")
				local evasionS = ((dmgTbl.evade and "[" ..dmgTbl.evade.. "] ") or "")
				--local weapS = (dmgTbl.weap and "{" ..dmgTbl.weap.. ": " or "")
				local dmgTS = (dmgTbl.dmgT or "Blunt")
				--local weap2S = (dmgTbl.weap and "}" or "")

				dmgPrint = dmgPrint..dmgS..critS..evasionS..dmgTS
				
				if(k != #clientDMG) then
					dmgPrint = dmgPrint.. " + "
				elseif(#clientDMG > 1) then
					dmgPrint = dmgPrint.. " [" ..totalDam.. "]"
				end
			end
			
			dmgPrint = dmgPrint.. "}"
		end
		
		chatPrint = chatPrint.. "\n" ..dmgPrint
	end

	--effect line
	local effectPrint = ""
	local effectTbl = responseTbl.effect
	
	if(effectTbl and !table.IsEmpty(effectTbl)) then
		effectPrint = "[EFFECT]"
		for client, clientEff in pairs(effectTbl) do
			effectPrint = effectPrint.. " " ..client:Name().. " ["
			
			local loop = 1
			for effName, effTbl in pairs(clientEff) do
				if(!effTbl.success) then continue end

				if(effTbl.duration > 1) then 
					effectPrint = effectPrint..effName.. ": " ..effTbl.duration.. "T"
				else
					effectPrint = effectPrint..effName.. ": Now"
				end
				
				if(loop != table.Count(clientEff)) then
					effectPrint = effectPrint.. ", "
				end
				
				loop = loop + 1 --stupid iterator
			end
			
			effectPrint = effectPrint.. "]"
		end
		
		chatPrint = chatPrint.. "\n" ..effectPrint
	end
	
	--nut.plugin.list["chatboxextra"]:ChatboxSend(attacker, "react_npc", chatPrint)
	nut.chat.send(attacker, "react_npc", chatPrint)
	nut.log.addRaw(chatPrint)
end