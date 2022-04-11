local PLUGIN = PLUGIN

//
local ACT
ACT = {}
ACT.uid = "dodge_agi"
ACT.name = "Predictive Evasion"
ACT.desc = "Prepare to dodge an incoming attack."
ACT.category = "Agility"
ACT.attackString = "prepares to dodge a single incoming attack"
ACT.CD = 3
ACT.selfOnly = true
ACT.notarget = true
ACT.reqStats = {
	["stm"] = 10,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Dodge",
		effect = "dodge",
		duration = 1,
		strength = 1,
		
		evasion = 100,
		
		hitsDef = 1,
		
		selfApply = true,
		buff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "multistrike"
ACT.name = "Multi-strike"
ACT.desc = "Attack an enemy multiple times in quick succession."
ACT.category = "Agility"
ACT.attackString = "unleashes multiple strikes upon their target"
ACT.CD = 2
ACT.dmg = 0
ACT.multi = 3
ACT.weaponMult = 0.9
ACT.reqStats = {
	["stm"] = 15,
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "dash"
ACT.name = "Dash"
ACT.desc = "Move a great distance in a short amount of time."
ACT.category = "Agility"
ACT.attackString = "dashes"
ACT.CD = 4
ACT.selfOnly = true
ACT.notarget = true
ACT.reqStats = {
	["stm"] = 20,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Dash",
		effect = "move",
		duration = 1,
		strength = 1,
		
		selfApply = true,
		buff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "trip"
ACT.name = "Trip"
ACT.desc = "Quickly kick out an enemy's legs and send them to the ground."
ACT.category = "Agility"
ACT.attackString = "fires a burst of shots"
ACT.CD = 2
ACT.dmg = 15
ACT.dmgT = "Crush"
ACT.mult = {
	["stm"] = 0.5,
}
ACT.reqStats = {
	["stm"] = 25,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Knockdown",
		effect = "knockdown",
		duration = 1,
		strength = 1,
		
		debuff = true,
	}
}
ACTS:Register(ACT)