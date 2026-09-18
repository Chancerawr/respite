local PLUGIN = PLUGIN

//
local ACT
ACT = {}
ACT.uid = "piercing_gaze"
ACT.name = "Piercing Gaze"
ACT.desc = "???"
ACT.category = "Hybrid"
ACT.hidden = true
ACT.attackString = "sees right through you"
ACT.CD = 1
ACT.accuracy = 50
ACT.dmg = 0
ACT.dmgT = "Pierce"
ACT.weaponMult = 0.25
ACT.mult = {
	["accuracy"] = 0.25,
	["perception"] = 0.25,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Exposed",
		effect = "weak",
		duration = 1,
		strength = 1,
		
		armor = -500,
		evasion = -100,
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "question"
ACT.name = "Question"
ACT.desc = "???"
ACT.category = "Hybrid"
ACT.hidden = true
ACT.attackString = "questions"
ACT.CD = 1
ACT.dmg = 0
ACT.dmgT = "Unknown"
ACT.weaponMult = 1
ACT.mult = {
	["fortitude"] = 0.5,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Shaken",
		effect = "weak",
		duration = 1,
		strength = 1,
		
		attrib = {
			["end"] = -15,
			["fortitude"] = -15,
		},
		
		hitsAttack = 1,
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "question_evade"
ACT.name = "Evade Question"
ACT.desc = "???"
ACT.category = "Hybrid"
ACT.hidden = true
ACT.attackString = "dodges the question"
ACT.selfOnly = true
ACT.notarget = true
ACT.CD = 5
ACT.mult = {
	["fortitude"] = 0.5,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Evasive",
		effect = "dodge",
		duration = 1,
		strength = 1,
		
		evasion = 250,
		
		hitsDef = 1,
		
		buff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "answer"
ACT.name = "Answer"
ACT.desc = "???"
ACT.category = "Hybrid"
ACT.hidden = true
ACT.attackString = "answers"
ACT.CD = 1
ACT.dmg = 0
ACT.dmgT = "Unknown"
ACT.weaponMult = 2
ACT.mult = {
	["fortitude"] = 0.5,
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "cursed_ground"
ACT.name = "Cursed Ground"
ACT.desc = "???"
ACT.category = "Hybrid"
ACT.hidden = true
ACT.attackString = "rots the surrounding area"
ACT.CD = 1
ACT.dmg = 0
ACT.dmgT = "Rot"
ACT.weaponMult = 1
ACT.radius = 500
ACT.notarget = true
ACT.noSelf = true
ACTS:Register(ACT)