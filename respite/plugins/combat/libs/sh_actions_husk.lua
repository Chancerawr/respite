local PLUGIN = PLUGIN

//
local ACT --self buff
ACT = {}
ACT.uid = "husk_stare"
ACT.name = "Stare"
ACT.desc = "Stares at an enemy."
ACT.category = "Husk"
ACT.hidden = true
ACT.attackString = "stares"
ACT.CD = 2
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Stare",
		effect = "weaken",
		duration = 2,
		strength = 1,
		
		evasion = -25,
		armor = -25,
		accuracy = -25,

		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "husk_scream"
ACT.name = "Scream"
ACT.desc = "Screams in a particularly human way."
ACT.category = "Husk"
ACT.hidden = true
ACT.attackString = "releases an unearthly scream"
ACT.notarget = true
ACT.CD = 4
ACT.dmg = 0
ACT.dmgT = "Time"
ACT.weaponMult = 0.25
ACT.radius = 150
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "husk_fossilize"
ACT.name = "Fossilize"
ACT.desc = "Fossilize, gaining a lot of armor, but losing the ability to move."
ACT.category = "Husk"
ACT.hidden = true
ACT.attackString = "fossilizes, losing the ability to move"
ACT.CD = 3
ACT.selfOnly = true
ACT.notarget = true
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Fossilized",
		effect = "buff",
		duration = 1,
		strength = 1,
		
		armor = 2000,
		
		selfApply = true,
		buff = true,
	}
}
ACTS:Register(ACT)