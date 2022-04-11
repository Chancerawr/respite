local PLUGIN = PLUGIN

//
local ACT
ACT = {}
ACT.uid = "aim"
ACT.name = "Aim"
ACT.desc = "When you aim, you have a higher chance to hit things, funny how that works."
ACT.category = "Accuracy"
ACT.attackString = "takes aim"
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
ACT.weaponMult = 2
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
			["dmg"] = -30,
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