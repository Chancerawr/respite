local PLUGIN = PLUGIN

//
local ACT
ACT = {}
ACT.uid = "heavyattack"
ACT.name = "Heavy Attack"
ACT.desc = "Unleash a heavy, debilitating attack upon an enemy. Scales off of weapon damage."
ACT.category = "Strength"
ACT.attackString = "swings their weapon with great force"
ACT.CD = 2
ACT.dmg = 0
ACT.weaponMult = 2
ACT.mult = {
	["str"] = 0.5,
}
ACT.reqStats = {
	["str"] = 10,
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "bash"
ACT.name = "Bash"
ACT.desc = "Smack an enemy in the head to stun them. Stun last 1 turn."
ACT.category = "Strength"
ACT.attackString = "bashes their target"
ACT.CD = 4
ACT.dmg = 0
ACT.dmgT = "Crush"
ACT.weaponMult = 1.5
ACT.reqStats = {
	["str"] = 15,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Stun",
		effect = "stun",
		duration = 1,
		strength = 1,
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "crush"
ACT.name = "Crush"
ACT.desc = "Apply immense force upon a downed foe (only works on an enemy that is knocked down)."
ACT.category = "Strength"
ACT.attackString = "uses all of their force to crush their target"
ACT.CD = 5
ACT.dmg = 0
ACT.dmgT = "Crush"
ACT.weaponMult = 2
ACT.mult = {
	["str"] = 1,
}
ACT.reqStats = {
	["str"] = 20,
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "charge"
ACT.name = "Charge"
ACT.desc = "Charge at your target from a long distance away."
ACT.category = "Strength"
ACT.attackString = "charges"
ACT.CD = 4
ACT.dmg = 20
ACT.dmgT = "Crush"
ACT.mult = {
	["str"] = 0.5,
}
ACT.reqStats = {
	["str"] = 25,
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "hurl"
ACT.name = "Hurl"
ACT.desc = "Pick up something heavy and throw it with great force (results may vary based on object)."
ACT.category = "Strength"
ACT.attackString = "hurls an object"
ACT.CD = 3
ACT.dmg = 25
ACT.dmgT = "Crush"
ACT.mult = {
	["str"] = 1,
}
ACT.reqStats = {
	["str"] = 30,
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "crash"
ACT.name = "Crash"
ACT.desc = "Use your brute strength to crash straight through walls, barricades, cover. Common sense will apply (slightly). You may take damage in some circumstances."
ACT.category = "Strength"
ACT.attackString = "crashes straight through something"
ACT.CD = 6
ACT.dmg = 25
ACT.dmgT = "Crush"
ACT.mult = {
	["str"] = 1,
}
ACT.reqStats = {
	["str"] = 35,
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "motivate_str"
ACT.name = "Motivating Flex"
ACT.desc = "Uh.. Flex your muscles, in a motivating way? Can be self targeted."
ACT.category = "Strength"
ACT.attackString = "flexes their muscles encouragingly, increasing the target's damage"
ACT.CD = 6
ACT.reqStats = {
	["str"] = 40,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Shout",
		effect = "shout",
		duration = 3,
		strength = 1,
		
		amp = {
			["dmg"] = 25,
		},
		
		buff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "display"
ACT.name = "Display of Strength"
ACT.desc = "Strike fear into your enemy by displaying your strength to them."
ACT.category = "Strength"
ACT.attackString = "displays their strength to their target"
ACT.CD = 7
ACT.reqStats = {
	["str"] = 45,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Fear",
		effect = "fear",
		duration = 2,
		strength = 1,
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "cleave"
ACT.name = "Cleave"
ACT.desc = "Cleave through multiple enemies with a wide swing."
ACT.category = "Strength"
ACT.attackString = "cleaves their weapon"
ACT.CD = 5
ACT.radius = 125
ACT.notarget = true
ACT.noSelf = true
ACT.dmg = 0
ACT.weaponMult = 2
ACT.mult = {
	["str"] = 1,
}
ACT.reqStats = {
	["str"] = 50,
}
ACTS:Register(ACT)