local PLUGIN = PLUGIN

//
local ACT
ACT = {}
ACT.uid = "aim"
ACT.name = "Aim"
ACT.desc = "When you aim, you have a higher chance to hit things, funny how that works."
ACT.category = "Accuracy"
ACT.attackString = "takes aim"
ACT.accuracy = 25
ACT.CD = 2
ACT.dmg = 0
ACT.weaponMult = 1.5
ACT.mult = {
	["accuracy"] = 0.5,
}
ACT.reqStats = {
	["accuracy"] = 10,
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "cripple"
ACT.name = "Cripple"
ACT.desc = "Hit an enemy's weakpoints and slow them for 3 turns."
ACT.category = "Accuracy"
ACT.attackString = "cripples their target"
ACT.CD = 5
ACT.dmg = 0
ACT.weaponMult = 1.5
ACT.reqStats = {
	["accuracy"] = 15,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Slow",
		effect = "slow",
		duration = 3,
		strength = 1,
		
		attrib = {
			["stm"] = -10,
		},
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "headshot"
ACT.name = "Headshot"
ACT.desc = "Aim for the head, high damage attack with a penalty to hit chance."
ACT.category = "Accuracy"
ACT.attackString = "aims for the head"
ACT.CD = 3
ACT.dmg = 0
ACT.weaponMult = 3
ACT.accuracy = -15
ACT.mult = {
	["accuracy"] = 0.5,
}
ACT.reqStats = {
	["accuracy"] = 20,
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "threadneedle"
ACT.name = "Thread the Needle"
ACT.desc = "Fire a shot that cannot miss with a decreased crit chance."
ACT.category = "Accuracy"
ACT.attackString = "fires the perfect shot"
ACT.CD = 3
ACT.dmg = 0
ACT.weaponMult = 1
ACT.accuracy = 100000
ACT.critC = -100
ACT.critF = -100
ACT.mult = {
	["accuracy"] = 1,
}
ACT.reqStats = {
	["accuracy"] = 20,
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "burst"
ACT.name = "Burst-fire"
ACT.desc = "Fire a quick burst of shots from a firearm or similar weapon. Some shot accuracy is lost in the process."
ACT.category = "Accuracy"
ACT.attackString = "fires a burst of shots"
ACT.CD = 2
ACT.accuracy = -10
ACT.dmg = 0
ACT.multi = 3
ACT.weaponMult = 1
ACT.reqStats = {
	["accuracy"] = 25,
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "runandgun"
ACT.name = "Run & Gun"
ACT.desc = "Allows you to fire a basic shot while dashing."
ACT.category = "Accuracy"
ACT.attackString = "runs and guns"
ACT.CD = 5
ACT.dmg = 0
ACT.multi = 1
ACT.weaponMult = 1
ACT.reqStats = {
	["accuracy"] = 25,
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "mark"
ACT.name = "Mark"
ACT.desc = "Mark a target for death, increasing the damage they take from all sources."
ACT.category = "Accuracy"
ACT.attackString = "marks a target"
ACT.CD = 4
ACT.reqStats = {
	["accuracy"] = 30,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Marked",
		effect = "res",
		duration = 3,
		strength = 1,
		
		res = {
			["dmg"] = -25,
		},
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "snipe"
ACT.name = "Snipe"
ACT.desc = "Fire an incredibly accurate, high damaging shot."
ACT.category = "Accuracy"
ACT.attackString = "snipes"
ACT.CD = 10
ACT.dmg = 0
ACT.weaponMult = 4
ACT.accuracy = 50
ACT.mult = {
	["accuracy"] = 1,
}
ACT.reqStats = {
	["accuracy"] = 35,
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "ricochet"
ACT.name = "Ricochet"
ACT.desc = "Fire a shot into an enemy that ricochets into a nearby target (this can hit allies)."
ACT.category = "Accuracy"
ACT.attackString = "fires a ricocheting shot"
ACT.CD = 6
ACT.dmg = 0
ACT.weaponMult = 1.5
ACT.mult = {
	["accuracy"] = 1,
}
ACT.reqStats = {
	["accuracy"] = 35,
}
ACT.onGetTargets = function(actionTbl, attacker, info)
	local trace = info.trace
	local entity = trace.Entity
	
	local targets = {entity}
	
	if(IsValid(entity)) then
		local pos = entity:GetPos()
		
		local nearest
		local dist = math.huge
		for k, v in pairs(ents.FindInSphere(pos, 300)) do
			if(!v.combat and !v:IsPlayer()) then continue end
			if(v == entity) then continue end --ignore self
			if(v:GetMoveType() == MOVETYPE_NOCLIP) then continue end --ignore noclipped admins
			
			if(dist > pos:DistToSqr(v:GetPos())) then
				nearest = v
			end
		end
		
		targets[#targets+1] = nearest
	end
	
	return targets
end
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "pierce"
ACT.name = "Pierce"
ACT.desc = "Fire a shot that pierces through multiple enemies in a straight line."
ACT.category = "Accuracy"
ACT.attackString = "fires a piercing shot"
ACT.CD = 6
ACT.dmg = 0
ACT.weaponMult = 1.5
ACT.mult = {
	["accuracy"] = 1,
}
ACT.reqStats = {
	["accuracy"] = 40,
}
ACT.onGetTargets = function(actionTbl, attacker, info)
	local trace = info.trace
	local entity = trace.Entity
	
	local targets = {entity}

	local eyePos = attacker:EyePos()
	local eyeTrace = (attacker.GetEyeTrace and attacker:GetEyeTrace()) or trace
	
	local endPos = eyePos + eyeTrace.Normal*10000
	
	local rayEnts = ents.FindAlongRay(eyePos, endPos, Vector(-1,-1,-1), Vector(1,1,1))
	
	for k, v in pairs(rayEnts) do
		if(!v.combat and !v:IsPlayer()) then continue end
		if(v == entity) then continue end --ignore target (already counted)
		if(v:GetMoveType() == MOVETYPE_NOCLIP) then continue end --ignore noclipped admins
		if(v == attacker) then continue end --ignore self

		targets[#targets+1] = v
	end
	
	return targets
end
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "spotter"
ACT.name = "Spotter"
ACT.desc = "Increase accuracy of an ally substantially. Can be used on self."
ACT.category = "Accuracy"
ACT.attackString = "improves the accuracy of their target"
ACT.CD = 6
ACT.reqStats = {
	["accuracy"] = 40,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Spotter",
		effect = "spotter",
		duration = 2,
		strength = 1,
		
		critC = 10,
		accuracy = 50,
		
		buff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "exploit"
ACT.name = "Exploit Weakness"
ACT.desc = "Apply a self buff that guarantees your next attack is a critical hit."
ACT.category = "Accuracy"
ACT.attackString = "prepares to fire upon an enemy's weakspot"
ACT.CD = 5
ACT.selfOnly = true
ACT.notarget = true
ACT.reqStats = {
	["accuracy"] = 45,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Exploit",
		effect = "exploit",
		duration = 1,
		strength = 1,
		
		hitsAttack = 1,
		
		critC = 100,
		critM = 0.5,
		
		buff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "barrage"
ACT.name = "Barrage"
ACT.desc = "Fire a whole ten times at an enemy with significantly decreased accuracy and damage. Can only be done with automatic weapons."
ACT.category = "Accuracy"
ACT.attackString = "fires many, many times"
ACT.CD = 7
ACT.dmg = 0
ACT.weaponMult = 0.5
ACT.accuracy = -50
ACT.multi = 10
ACT.mult = {
	["accuracy"] = 0.5,
}
ACT.reqStats = {
	["accuracy"] = 50,
}
ACTS:Register(ACT)