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
ACT.uid = "coinflip"
ACT.name = "Coinflip"
ACT.desc = "Give you target either a guaranteed crit, or a guaranteed crit fail (50% chance of either)."
ACT.category = "Luck"
ACT.attackString = "flips a coin"
ACT.CD = 5
ACT.reqStats = {
	["luck"] = 40,
}
ACT.special = function(client, target)
end
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Lucky",
		effect = "luck",
		duration = 1,
		strength = 1,
		
		chance = 75,
		
		critC = 100,
		
		buff = true,
	},
	[2] = {
		uid = ACT.uid,
		
		name = "Unlucky",
		effect = "luck",
		duration = 1,
		strength = 1,
		
		chance = 25,
		
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