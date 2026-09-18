-- Most of this is currently unused, but it's here anyways
local PLUGIN = PLUGIN

local playerMeta = FindMetaTable("Player")

local function findTargetInRad(startPos, radius)
	local entities = ents.FindInSphere(startPos, radius)
	local targets = {}

	for k, target in pairs(entities) do
		if(target:GetClass() == "prop_ragdoll" and target.nutPlayer) then
			target = target.nutPlayer
		end
	
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
		if(target:GetClass() == "prop_ragdoll" and target.nutPlayer) then
			target = target.nutPlayer
		end
	
		if(IsValid(target) and (target:IsPlayer() or target.combat)) then
			if(target:GetMoveType() == MOVETYPE_NOCLIP) then continue end --ignore noclipped people
		
			targets[#targets + 1] = target
		end
	end
	
	return targets
end

local function findTargetInBox(position, mins, maxs)
	local boxMins = position + mins
	local boxMaxs = position + maxs
	
	local entities = ents.FindInBox(boxMins, boxMaxs)
	local targets = {}
	
	for k, target in pairs(entities) do
		if(target:GetClass() == "prop_ragdoll" and target.nutPlayer) then
			target = target.nutPlayer
		end
	
		if(IsValid(target) and (target:IsPlayer() or target.combat)) then
			if(target:GetMoveType() == MOVETYPE_NOCLIP) then continue end --ignore noclipped people
		
			targets[#targets + 1] = target
		end
	end
	
	return targets
end

--finds targets for abilities
function PLUGIN:attackStart(client, info)
	local attacker = info.attacker
	local trace = info.trace
	local action = info.action
	local actionTbl = info.actionTbl
	local partString = info.partString
	local weapon = info.weapon
	
	local entity = trace.Entity
	local target = entity
	local selfOnly = action.selfOnly
	local hitPos = trace.HitPos
	
	if(target:IsRagdoll() and target.nutPlayer) then
		target = target.nutPlayer
	end
	
	info.client = client

	if(actionTbl.onCanAct) then
		if(!actionTbl:onCanAct(attacker, info)) then
			return false
		end
	end

	if(client:IsPlayer() and client:KeyDown(IN_WALK)) then --self targetting
		selfOnly = true
	end
	
	local targets
	
	if(actionTbl.onGetTargets) then
		targets = actionTbl:onGetTargets(attacker, info)
	elseif(selfOnly) then --action that targets self
		if(action.radius) then --sphere around caster
			targets = findTargetInRad(attacker:GetPos(), action.radius)
		elseif(action.box) then
			targets = findTargetInBox(attacker:GetPos(), action.box)
		else --only affects the caster
			targets = {attacker}
		end
	elseif(action.notarget) then --action that requires no target
		if(action.radius) then --no targetted aoe
			targets = findTargetInRad(hitPos, action.radius)
		elseif(action.cone) then --cone originating from attacker
			local forward = attacker:GetForward() * Vector(1,1,0)
			
			targets = findTargetInCone(attacker:GetPos(), forward, action.cone, action.cone2)
		elseif(action.box) then
			targets = findTargetInBox(hitPos, action.box)
		end
	elseif(IsValid(target)) then--actions that requires a target
		if(target:GetClass() == "prop_ragdoll" and target.nutPlayer) then
			targets = target.nutPlayer
		elseif (target.combat or target:IsPlayer()) then
			if(IsValid(attacker) and attacker != target) then
				if(!action.uid) then --regular attack, not a action
					targets = {target}
				else
					if(action.radius) then --sphere around entity
						local entities = ents.FindInSphere(target:GetPos(), action.radius)
						
						targets = findTargetInRad(target:GetPos(), action.radius)
					elseif(action.cone) then --cone starting from target
						local forward = attacker:GetForward() * Vector(1,1,0)

						targets = findTargetInCone(attacker:GetPos(), forward, action.cone, action.cone2)
					elseif(action.box) then
						targets = findTargetInBox(attacker:GetPos(), action.box)
					else --single target
						targets = {target}
					end
				end
				
				if(attacker.combat) then
					--attacker:attackAnim()
				end
			end
		end
	end
	
	if(targets or action.notarget) then
		PLUGIN:attack(attacker, targets, info)
	end
end

--sets up an attack table with info from the attacker and action
function PLUGIN:getAttackData(attacker, info)
	local action = table.Copy(info.actionTbl or {})
	local partString = info.partString
	local weapon = info.weapon or (info.action and info.action.weapon)
	local trace = info.trace

	local data = {}
	
	data.attacker = attacker
	data.name = attacker:Name()
	data.attackString = (action and action.attackString) or "attacks"
	
	if(action and !table.IsEmpty(action)) then
		local weaponItem = nut.item.instances[weapon]
		
		if(action.onGetAccuracy) then
			action.accuracy = action:onGetAccuracy(attacker, info)
		else
			action.accuracy = (attacker:getAccuracy(weaponItem) + (action.accuracy or 0)) * (action.accuracyMult or 1)
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
			
			if(action.costAP) then
				attacker:addAP(action.costAP * -1)
			end
			
			if(action.CD) then
				attacker:addCooldown(action.uid, action.CD)
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
		
		local weaponItem = weapon and nut.item.instances[weapon]
		if(weaponItem) then
			if(weaponItem.itemUse) then
				action.itemUse = weaponItem.itemUse
			end
		end
		
		--deletes consumable items upon use, should probably be moved elsewhere
		if(action.itemUse) then
			if(IsValid(attacker) and attacker:getChar()) then
				local inventory = attacker:getChar():getInv()
				
				local item = inventory:getFirstItemOfType(action.itemUse)
				if(item) then
					local amount = item:getData("Amount", 1)
					if(amount > 1) then
						item:setData("Amount", amount - 1)
					else
						item:remove()
					end
				end
			end
		end
		
		--if the action does damage we worry about damage bonuses and etc
		if(action.dmg) then
			--damage from attributes
			if(action.mult) then 
				for attrib, mult in pairs(action.mult) do
					action.dmg = action.dmg + (attacker:getChar():getAttrib(attrib, 0) * mult)
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

			hook.Run("nut_ActionAttackData", action, attacker, info)
			
			--damage table
			data.damage = {}
			
			for i = 1, (action.multi or 1) do --multiple hits
				--this prevents the loop from decreasing/increasing things the more hits there are
				local subAction = table.Copy(action)
			
				hook.Run("nut_OnCombatAttack", subAction, attacker, info)
			
				data.damage[i] = {
					dmg = subAction.dmg,
					dmgT = subAction.dmgT,
					accuracy = subAction.accuracy,
					crit = subAction.crit,
					special = subAction.special,
				}
			end
		else
			data.damage = {}
		end
		
		hook.Run("nut_ActionEffectData", action, attacker, info)
		--action effects
		data.effects = action.effects
		
		--summons
		data.summon = action.summon
		
		--special things
		data.special = action.special

		data.notarget = action.notarget

		data.noSelf = action.noSelf
	else
		--basic attack
		local dmgTbl = attacker:getDamage()
		
		for k, v in pairs(dmgTbl) do
			hook.Run("nut_ActionAttackData", v, attacker, info)
			hook.Run("nut_OnCombatAttack", v, attacker, info)
		end

		data.damage = dmgTbl
	end
	
	data.text = nil

	return data	
end

--main attack function, handles mostly everything
function PLUGIN:attack(attacker, target, info)
	local action = info.action
	local actionTbl = info.actionTbl
	
	local actionID = action and action.uid
	local name = attacker:Name() --name of attacker
	
	local attackData = PLUGIN:getAttackData(attacker, info)
	if(attackData.failed) then
		local response = attacker:Name().. "'s ability <" ..attackData.name.. "> has failed to activate!"
		
		nut.chat.send(attacker, "react_npc", response)
		
		nut.log.addRaw(response, 2)
		
		return false
	end

	--if it's a summoning action or summons something when it happens
	if(attackData.summon) then
		PLUGIN:summonAction(attacker, info)
	end

	--local response = attackData.name.. " " ..(attackData.attackString or "")
	local responseTbl = {}

	--handles damage parts of the attack
	local damage = attackData.damage --damage table
	local effects = attackData.effects
	local special = attackData.special
	
	if(target) then
		for k, v in pairs(target) do
			if(attackData.noSelf and v == attacker) then continue end
			
			if(damage) then
				if(!responseTbl["dmg"]) then responseTbl["dmg"] = {} end
				local dmgProcess = PLUGIN:damageProcess(v, attackData)
				
				if(!table.IsEmpty(dmgProcess)) then
					responseTbl["dmg"][v] = dmgProcess
				end
			end
			
			if(effects) then
				if(!responseTbl["effect"]) then responseTbl["effect"] = {} end
				
				local effectResponse, extraResponse = PLUGIN:effectProcess(v, attackData)
				
				--effects affecting the target
				responseTbl["effect"][v] = effectResponse
				
				if(extraResponse) then
					responseTbl["effect"][attacker] = responseTbl["effect"][attacker] or {}
					--effects affecting the attacker (selfApply)
					table.Merge(responseTbl["effect"][attacker], extraResponse)
				end
			end
			
			if(special) then
				action.special(attacker, v)
			end
		end
	end
	
	PLUGIN:combatStringCreate(attackData, responseTbl)
end

--processing damage and creates the chat message
function PLUGIN:damageProcess(target, attack, responseString)
	local attackInfo = table.Copy(attack) --just in case

	local damage = attackInfo.damage

	local responseTbl = {} --for printed string later
	
	if(IsValid(target) and !table.IsEmpty(damage)) then		
		local totalDam = 0
			
		hook.Run("nut_OnCombatDamageProcess", target, damage, attackInfo)
		
		for k, v in pairs(damage) do			
			if(!v.dmg) then	continue end
			
			--variance
			v.dmg = math.Round(math.Rand(v.dmg * 0.9, v.dmg * 1.1), 2)
			
			--evasion
			local evade, evaReduct = PLUGIN:evadeCalc(target, v.accuracy, v.dmg)
			v.dmg = v.dmg * (evaReduct or 1)
		
			--reduce damage by target's resistances
			v.dmg = target:receiveDamage(v.dmg, v.dmgT) --resistances handled in here
			
			--round it so there's no crazy decimals
			v.dmg = math.Round(math.max(v.dmg, 0), 2) 
			
			--set the target's hp
			target:addHP(v.dmg * -1)
			
			responseTbl[#responseTbl+1] = {
				dmgT = v.dmgT,
				dmg = v.dmg,
				crit = v.crit,
				evade = evade,
				weapon = v.weap,
			}
		end
		
		hook.Run("nut_OnCombatDamageProcessPost", target, damage, attackInfo)
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

	--who all will receive the chat message
	local receivers = {}

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
	
	local dmgHeader
	
	if(dmgTbl and !table.IsEmpty(dmgTbl)) then
		dmgPrint = "[DAMAGE]"
	
		for client, clientDMG in pairs(dmgTbl) do
			receivers[#receivers+1] = client
		
			if(table.IsEmpty(clientDMG)) then continue end
		
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
			receivers[#receivers+1] = client
		
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

	if(attackInfo.attacker) then
		local turnOrder = attackInfo.attacker:getTurnData()

		if(turnOrder.entities) then
			for entity, v in pairs(turnOrder.entities) do
				receivers[#receivers+1] = entity
			end
		else
			receivers[#receivers+1] = attackInfo.attacker
		end
	end

	local entities = ents.FindInSphere(attackInfo.attacker:GetPos(), nut.config.get("chatRange", 280) * 5)
	for k, v in pairs(entities) do
		if(v:IsPlayer()) then
			receivers[#receivers+1] = v
		end
	end

	nut.chat.send(attacker, "react_npc", chatPrint, false, receivers)
	
	--nut.plugin.list["chatboxextra"]:ChatboxSend(attacker, "react_npc", chatPrint)
	nut.log.addRaw(chatPrint)
end

function PLUGIN:summonAction(attacker, info)
	local actionTbl = info.actionTbl
	local trace = info.trace
	local pos = trace.HitPos

	local summon = ents.Create(actionTbl.summon)
	if(IsValid(summon)) then
		summon:SetPos(pos)
		summon:SetCreator(attacker)
		summon.playerControlled = true
		summon:Spawn()
		
		if(summon.Name) then
			local name = summon:Name()
			summon:setNetVar("name", attacker:Name().. "'s " ..(name or ""))
		end
			
		if(attacker:IsPlayer()) then
			attacker:Give("nut_cmover")
		end
		
		if(attacker.turnData) then
			local id = attacker.turnData[1] or 1
			local team = attacker.turnData[2] or 1
		
			PLUGIN:turnAdd(id, summon, team)
		end
		
		if(actionTbl.onSummon) then
			actionTbl:onSummon(attacker, info, summon)
		end
	end
end