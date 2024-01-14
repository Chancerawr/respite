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
ACT.attackString = "trips"
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
//
local ACT
ACT = {}
ACT.uid = "feint"
ACT.name = "Feint"
ACT.desc = "Take an enemy by surprise with a feint attack, leaving them wide open to attacks and boosting your own evasion temporarily. Can be used without ending your turn."
ACT.category = "Agility"
ACT.attackString = "creates an opening with a feint"
ACT.CD = 4
ACT.reqStats = {
	["stm"] = 30,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Dodge",
		effect = "dodge",
		duration = 1,
		strength = 1,
		
		evasion = 50,
		
		hitsDef = 1,
		
		selfApply = true,
		buff = true,
	},
	[2] = {
		uid = ACT.uid,
		
		name = "Wide Open",
		effect = "armor",
		duration = 1,
		strength = 1,
		
		armor = -100,
		
		hitsDef = 1,
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "agility_blind"
ACT.name = "Blind"
ACT.desc = "Throw dust into the enemies eyes (only if they have them). The dust can be sand, dirt, or anything powdery. It will blind them for a turn, reducing their accuracy. This action does not end your turn."
ACT.category = "Agility"
ACT.attackString = "blinds their target with something powdery"
ACT.CD = 6
ACT.reqStats = {
	["stm"] = 35,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Blind",
		effect = "blind",
		duration = 2,
		strength = 1,
		
		accuracy = -200,
		
		debuff = true,
	},
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "steal_weapon"
ACT.name = "Steal Weapon"
ACT.desc = "Steal a target's weapon (if they have one)."
ACT.category = "Agility"
ACT.attackString = "steals their target's weapon"
ACT.CD = 7
ACT.reqStats = {
	["stm"] = 40,
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "whirlwind"
ACT.name = "Whirlwind"
ACT.desc = "Rapidly spin in place, hitting enemies with your weapon in a small area."
ACT.category = "Agility"
ACT.attackString = "spins in place, dealing damage to enemies in an area"
ACT.weaponMult = 1
ACT.dmg = 0
ACT.radius = 100
ACT.notarget = true
ACT.noSelf = true
ACT.CD = 3
ACT.mult = {
	["stm"] = 0.5,
}
ACT.reqStats = {
	["stm"] = 45,
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "onslaught"
ACT.name = "Onslaught"
ACT.desc = "Unleash an onslaught of weaker attacks on an enemy."
ACT.category = "Agility"
ACT.attackString = "unleashes an onslaught of attacks"
ACT.weaponMult = 0.6
ACT.accuracy = -20
ACT.multi = 10
ACT.CD = 7
ACT.dmg = 0
ACT.mult = {
	["stm"] = 0.15,
}
ACT.reqStats = {
	["stm"] = 50,
}
ACTS:Register(ACT)
//
--[[
local ACT
ACT = {}
ACT.uid = "slash_dash"
ACT.name = "Slashing Dash"
ACT.desc = "Dash forward and stab every enemy in a line forward."
ACT.category = "Agility"
ACT.attackString = "dashes forward, hitting any enemy in the path"
ACT.weaponMult = 1
ACT.box = {40,100}
ACT.CD = 7
ACT.dmg = 0
ACT.mult = {
	["stm"] = 0.1,
}
ACT.reqStats = {
	["stm"] = 55,
}
ACTS:Register(ACT)
--]]