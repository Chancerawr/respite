local PLUGIN = PLUGIN

//
local ACT
ACT = {}
ACT.uid = "luck_good"
ACT.name = "Good Luck"
ACT.desc = "You're feeling particularly lucky today."
ACT.category = "Luck"
ACT.attackString = "is feeling lucky"
ACT.CD = 2
ACT.selfOnly = true
ACT.notarget = true
ACT.reqStats = {
	["luck"] = 10,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Lucky",
		effect = "luck",
		duration = 1,
		strength = 1,
		
		critC = 25,
		critM = 0.5,
		
		buff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "luck_bad"
ACT.name = "Bad Luck"
ACT.desc = "Your target is looking pretty unlucky today, at least you think so."
ACT.category = "Luck"
ACT.attackString = "thinks their target is a bit unlucky today"
ACT.CD = 3
ACT.reqStats = {
	["luck"] = 15,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Unlucky",
		effect = "luck",
		duration = 1,
		strength = 1,
		
		critC = -25,
		critM = -0.5,
		critF = 25,
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "fate"
ACT.name = "Fate"
ACT.desc = "Alter the fate of your target, something bad will happen to it and it will take damage."
ACT.category = "Luck"
ACT.attackString = "alters the fate of their target"
ACT.CD = 5
ACT.dmg = 10
ACT.mult = {
	["luck"] = 0.5,
}
ACT.reqStats = {
	["luck"] = 20,
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "dodge_luck"
ACT.name = "Evasion (Luck)"
ACT.desc = "Attacks targeting you become more likely to miss or graze for a turn."
ACT.category = "Luck"
ACT.attackString = "seems like they might be harder to hit for some reason"
ACT.CD = 4
ACT.selfOnly = true
ACT.notarget = true
ACT.reqStats = {
	["luck"] = 25,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Dodge",
		effect = "dodge",
		duration = 1,
		strength = 1,
		
		evasion = 80,
		
		selfApply = true,
		buff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "reroll"
ACT.name = "Reroll"
ACT.desc = "Force a target (ally or enemy) to reroll previous check (does not work on attacks that deal damage)."
ACT.category = "Luck"
ACT.attackString = "forces their target to reroll their latest check"
ACT.CD = 5
ACT.reqStats = {
	["luck"] = 30,
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "flail"
ACT.name = "Flail"
ACT.desc = "Attack randomly without really aiming and hope for the best."
ACT.category = "Luck"
ACT.attackString = "attacks randomly"
ACT.CD = 10
ACT.dmg = 1
ACT.weaponMult = 1
ACT.multi = 3
ACT.accuracy = -30
ACT.critC = 15
ACT.mult = {
	["luck"] = 0.25,
}
ACT.reqStats = {
	["luck"] = 35,
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "trickshot"
ACT.name = "Trickshot"
ACT.desc = "Fire a ranged weapon completely blindly, it will probably work out."
ACT.category = "Luck"
ACT.attackString = "attacks randomly"
ACT.CD = 5
ACT.dmg = 15
ACT.weaponMult = 1.5
ACT.multi = 1
ACT.accuracy = 30
ACT.critC = 30
ACT.notarget = true
ACT.mult = {
	["luck"] = 0.5,
}
ACT.reqStats = {
	["luck"] = 35,
}
ACT.onGetTargets = function(actionTbl, attacker, info)
	local trace = info.trace
	local entity = trace.Entity
	
	local pos = trace.HitPos--client:GetPos()
	
	local targets = {}
	local tempTargets = {}
	for k, v in pairs(ents.FindInSphere(pos, 500)) do
		if(!IsValid(v)) then continue end
		if(!v.combat and !v:IsPlayer()) then continue end
		if(v == client) then continue end
		if(v:GetMoveType() == MOVETYPE_NOCLIP and !v:InVehicle()) then continue end
		
		tempTargets[#tempTargets+1] = v
	end

	for i = 1, math.random(1,3) do
		local ranTarget = tempTargets[math.random(#tempTargets)]
		if(IsValid(ranTarget)) then
			targets[#targets+1] = ranTarget
		end
	end
	
	return targets
end
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "coinflip"
ACT.name = "Coinflip"
ACT.desc = "Give your target either a guaranteed crit, or a guaranteed crit fail (50% chance of either)."
ACT.category = "Luck"
ACT.attackString = "flips a coin"
ACT.CD = 5
ACT.reqStats = {
	["luck"] = 40,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Lucky",
		effect = "luck",
		duration = 1,
		strength = 1,
		
		chance = 50,
		
		critC = 100,
		
		buff = true,
	},
	[2] = {
		uid = ACT.uid,
		
		name = "Unlucky",
		effect = "luck",
		duration = 1,
		strength = 1,
		
		chance = 50,
		
		critF = 100,
		
		debuff = true,
	},
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "guess"
ACT.name = "Guess"
ACT.desc = "Make a guess about something, you're pretty lucky so maybe you'll get it."
ACT.category = "Luck"
ACT.attackString = "makes a guess about something"
ACT.CD = 10
ACT.selfOnly = true
ACT.notarget = true
ACT.reqStats = {
	["luck"] = 45,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Guess",
		effect = "guess",
		duration = 1,
		strength = 1,
		
		chance = 75,
		
		buff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "prophecy_good"
ACT.name = "Prophecy (Fortune)"
ACT.desc = "Give your target a randomized attribute buff that lasts for 4 turns."
ACT.category = "Luck"
ACT.attackString = "makes a prophecy of a bright future"
ACT.CD = 1
ACT.reqStats = {
	["luck"] = 45,
}
ACT.onEffect = function(actionTbl, action, attacker, info)
	local trace = info.trace
	local target = trace.Entity
	local client = info.client
	
	if(client.KeyDown and client:KeyDown(IN_WALK)) then --self targetting
		target = client
	end

	local counter = {
		uid = actionTbl.uid,
		
		name = "Good Vibe",
		effect = "buff",
		duration = 4,
		strength = 1,
		
		attrib = {
			["luck"] = math.random(0,7),
			["stm"] = math.random(0,7),
			["str"] = math.random(0,7),
			["end"] = math.random(0,7),
			["fortitude"] = math.random(0,7),
			["accuracy"] = math.random(0,7),
			["perception"] = math.random(0,7),
			["medical"] = math.random(0,7),
		},
		
		buff = true,
	}
	target:addBuff(counter)
end
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "prophecy_bad"
ACT.name = "Prophecy (Ruin)"
ACT.desc = "Give your target a randomized attribute debuff that lasts for 4 turns."
ACT.category = "Luck"
ACT.attackString = "makes a prophecy of ruin"
ACT.CD = 1
ACT.reqStats = {
	["luck"] = 45,
}
ACT.onEffect = function(actionTbl, action, attacker, info)
	local trace = info.trace
	local target = trace.Entity
	local client = info.client
	
	if(client.KeyDown and client:KeyDown(IN_WALK)) then --self targetting
		target = client
	end

	local counter = {
		uid = actionTbl.uid,
		
		name = "Bad Vibe",
		effect = "weak",
		duration = 4,
		strength = 1,
		
		attrib = {
			["luck"] = math.random(-13,0),
			["stm"] = math.random(-13,0),
			["str"] = math.random(-13,0),
			["end"] = math.random(-13,0),
			["fortitude"] = math.random(-13,0),
			["accuracy"] = math.random(-13,0),
			["perception"] = math.random(-13,0),
			["medical"] = math.random(-13,0),
		},
		
		debuff = true,
	}
	target:addBuff(counter)
end
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "disaster"
ACT.name = "Disaster"
ACT.desc = "Increase the chance of critical failures for every target in an AOE."
ACT.category = "Luck"
ACT.attackString = "feels like a disaster is about to unfold"
ACT.CD = 10
ACT.radius = 150
ACT.notarget = true
ACT.reqStats = {
	["luck"] = 45,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Disaster",
		effect = "weak",
		duration = 1,
		strength = 1,
		
		critF = 50,
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "fortune"
ACT.name = "Fortune"
ACT.desc = "Make something really incredibly lucky happen."
ACT.category = "Luck"
ACT.attackString = "bends fortune to their will"
ACT.CD = 10
ACT.reqStats = {
	["luck"] = 50,
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "curse_luck"
ACT.name = "Curse of Misfortune"
ACT.desc = "Reduce the luck of a target for 7 turns."
ACT.category = "Luck"
ACT.attackString = "brings a curse of bad luck upon their target"
ACT.CD = 7
ACT.reqStats = {
	["luck"] = 50,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Misfortune",
		effect = "weak",
		duration = 7,
		strength = 1,
		
		attrib = {
			["luck"] = -15,
		},
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "destiny"
ACT.name = "Destiny Derail"
ACT.desc = "Derails the destiny of your target with something that can only be described as 'bad luck'."
ACT.category = "Luck"
ACT.attackString = "alters destiny"
ACT.CD = 99
ACT.reqStats = {
	["luck"] = 77,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Destiny",
		effect = "weak",
		duration = 1,
		
		critC = -100,
		critF = 50,
		
		debuff = true,
	}
}
ACTS:Register(ACT)