local PLUGIN = PLUGIN

--grok is this real

PLUGIN.AITree = {}

--gets the actions that can be used by the entity in auto turn based combat
PLUGIN.helperFuncs["getTurnAIActions"] = function(self, id)
	if(self.combat) then
		local actions = self:getNetVar("actionsAI", self.actionsAI) or self:getNetVar("actions", self.actions) or {}

		return actions
	else
		return {}
	end
end

function PLUGIN:FindMovePosition(entity, target, distance)
	local destination
	local range = entity:getAttackRange()
	
	local distance = distance or range*math.Rand(0.7, 0.85)

	--one ap circle (squared)
	local circle = 400
	local circleSqr = circle*circle

	local entityPos = entity:GetPos()
	local targetPos = target:GetPos()

	local direction = (targetPos - entityPos):GetNormalized()

	--where we would ideally like to be
	destination = targetPos - direction*distance
	
	--add some variation to NPCs dont get stuck in the same spot as much.
	--get rid of Z since we dont want them going up
	destination = destination + (VectorRand(-range*0.1, range*0.1) * Vector(1,1,0))

	if(entityPos:DistToSqr(destination) > circleSqr) then
		--if we cannot get right in front of them, then just move towards them
		destination = entity:GetPos() + direction*circle
	end

	return destination
end

function PLUGIN:GetClosestTarget(entity, targets)
	local pos = entity:GetPos()
	local closest
	local closestDist = math.huge
	
	for k, v in pairs(targets) do
		local dist = pos:DistToSqr(v:GetPos())
		if(closestDist > dist) then
			closest = v
			closestDist = dist
		end
	end

	return closest
end

function PLUGIN:GetNearTarget(entity, targets, range)
	local pos = entity:GetPos()
	
	local range2 = range*range
	
	local found = {}
	
	for k, v in pairs(targets) do
		local dist = pos:DistToSqr(v:GetPos())
		if(dist <= range2) then
			found[#found+1] = v
		end
	end
	
	local random = table.Random(found)

	return random
end

--whether or not the npc can see the supplied position (I didnt make this)
function PLUGIN:CanSeePos(pos1, pos2, filter, fraction)
	local trace = {}
	trace.start = pos1
	trace.endpos = pos2
	trace.filter = filter
	trace.mask = MASK_SOLID + CONTENTS_GRATE
	local tr = util.TraceLine(trace)
	
	if(tr.Fraction >= (fraction or 1)) then
		return true
	end
	
	return false
end

function PLUGIN:CheckLOS(entity, target, expensiveFilter)
	local canSee

	if(expensiveFilter) then
		canSee = PLUGIN:CanSeePos(entity:EyePos(), target:WorldSpaceCenter(), function(entity)
			if(entity.combat) then return false end
			if(entity == self) then return false end
			if(entity == target) then return false end
		end, 0.9)
	else
		canSee = PLUGIN:CanSeePos(entity:EyePos(), target:WorldSpaceCenter(), {entity, target}, 0.9)
	end

	return canSee
end

local function WeightedRandom(items)
	local sum = 0
	
	for part, chance in pairs(items) do
		sum = sum + (chance or 1)
	end

	local select = math.random() * sum

	for part, chance in pairs(items) do
		select = select - (chance or 1)
		if select < 0 then 
			return part 
		end
	end
end

function PLUGIN:ChooseAttack(entity, target, delay, enemies)
	if(!PLUGIN:CheckLOS(entity, target)) then
		local newTarget = false
	
		for k, v in pairs(enemies or {}) do
			if(v == target) then continue end --skip the one we already did
			
			if(PLUGIN:CheckLOS(entity, target, true)) then
				target = v
				newTarget = true
				break
			end
		end
		
		--checks if we found a new target or not
		--if we didn't then too bad i guess
		if(!newTarget) then 
			return
		end
	end

	--queued movement action
	entity:queueActionAfter((delay or 0) + math.Rand(0,1), function()
		if(!IsValid(target)) then return end
	
		if(entity.loco) then
			--makes sure the NPC is facing the target
			entity.loco:FaceTowards(target:GetPos())
			entity.loco:FaceTowards(target:GetPos())
			entity.loco:FaceTowards(target:GetPos())
		end
		
		local range = entity:getAttackRange()
		range = range^2
	
		local dist = entity:GetPos():DistToSqr(target:GetPos())
	
		local cooldowns = entity:getCooldowns()
		local actions = entity:getTurnAIActions()
		
		local possible = {}
		for _, actionID in pairs(actions) do
			local action = ACTS.actions[actionID]
			if(!action) then continue end
			
			if(cooldowns[actionID]) then continue end --cds
			
			local range2 = (action.range and action.range^2) or range
			local rangeMin2 = (action.rangeMin and action.rangeMin^2) or -1
			--cheaper to compare squared distance than normal distance

			if(range2 < dist) then continue end --range
			if(rangeMin2 > dist) then continue end --minimum range

			if(action) then
				possible[#possible+1] = PLUGIN:actionFormat(action)
			end
		end
		
		--basic attack
		if(dist <= range) then
			possible[#possible+1] = {
				action = {
					name = "Attack",
				}
			}
		end

		local action = table.Random(possible)

		if(action) then
			local data = {}
			data.start = entity:EyePos()
			data.endpos = target:GetPos()
			data.filter = {entity}
			local trace = util.TraceLine(data)
			trace.Entity = target --just make this easier i guess

			local actionTbl = (action.uid and ACTS.actions[action.uid]) or {}
		
			--local part = WeightedRandom(PLUGIN.partChance)
		
			local data = {
				attacker = entity,
				trace = trace,
				--partString = part,
				--weapon = weapon,
				action = action,
				actionTbl = actionTbl,
			}
		
			entity:Attack(target, actionTbl)
			PLUGIN:attackStart(entity, data)
			
			if(target.getHP and target:getNetVar("autodeath")) then
				local HP = target:getHP()
				if(HP <= 0) then
					target:die()
				end
			end
		end
	end)
end

PLUGIN.AITree["none"] = {
	name = "None",
	turnProcess = function(entity, turnData)
	end,
}

PLUGIN.AITree["simple"] = {
	name = "Simple",
	turnProcess = function(entity, turnData)
		if(!entity.combat) then return end
		if(!turnData) then return end

		local ourTeam = entity:getTurnTeam()
		
		local enemies = {}
		for target, teamName in pairs(turnData.entities) do
			if(!IsValid(target)) then continue end
			
			if(teamName == ourTeam) then continue end --no same team
			--may make an exception for if they have buffs or something
			if(target:GetMoveType() == MOVETYPE_NOCLIP) then continue end --no noclipping admins
			
			enemies[#enemies+1] = target
		end
		
		local target

		if(math.random(1,100) >= 75) then
			target = PLUGIN:GetNearTarget(entity, enemies, 300)
		else
			target = PLUGIN:GetClosestTarget(entity, enemies)
		end
		
		if(!target) then
			target = PLUGIN:GetClosestTarget(entity, enemies)
		end

		--replace with a function that better determines where to move
		if(IsValid(target)) then
			local movePos, delay = PLUGIN:FindMovePosition(entity, target)
		
			local distToSqr = entity:GetPos():DistToSqr(movePos)
			local delay = 0
			if(distToSqr > 25) then
				delay = entity:movementStart(movePos)
			end

			PLUGIN:ChooseAttack(entity, target, delay, enemies)
		end
	end,
}

PLUGIN.AITree["moveonly"] = {
	name = "Move Only",
	turnProcess = function(entity, turnData)
		if(!entity.combat) then return end
		if(!turnData) then return end

		local ourTeam = entity:getTurnTeam()
		
		local enemies = {}
		for target, teamName in pairs(turnData.entities) do
			if(!IsValid(target)) then continue end
			
			if(teamName == ourTeam) then continue end --no same team
			--may make an exception for if they have buffs or something
			if(target:GetMoveType() == MOVETYPE_NOCLIP) then continue end --no noclipping admins
			
			enemies[#enemies+1] = target
		end
		
		local target

		if(math.random(1,100) >= 75) then
			target = PLUGIN:GetNearTarget(entity, enemies, 300)
		else
			target = PLUGIN:GetClosestTarget(entity, enemies)
		end
		
		if(!target) then
			target = PLUGIN:GetClosestTarget(entity, enemies)
		end

		--replace with a function that better determines where to move
		if(IsValid(target)) then
			local movePos, delay = PLUGIN:FindMovePosition(entity, target)
		
			local distToSqr = entity:GetPos():DistToSqr(movePos)
			local delay = 0
			if(distToSqr > 25) then
				delay = entity:movementStart(movePos)
			end
		end
	end,
}

PLUGIN.AITree["nomove"] = {
	name = "Hold Position",
	turnProcess = function(entity, turnData)
		if(!entity.combat) then return end
		if(!turnData) then return end

		local ourTeam = entity:getTurnTeam()
		
		local enemies = {}
		for target, teamName in pairs(turnData.entities) do
			if(!IsValid(target)) then continue end
			
			if(teamName == ourTeam) then continue end --no same team
			--may make an exception for if they have buffs or something
			if(target:GetMoveType() == MOVETYPE_NOCLIP) then continue end --no noclipping admins
			
			enemies[#enemies+1] = target
		end

		local target = table.Random(enemies)

		--replace with a function that better determines where to move
		if(IsValid(target)) then
			local movePos = PLUGIN:FindMovePosition(entity, target)

			PLUGIN:ChooseAttack(entity, target, nil, enemies)
		end
	end,
}