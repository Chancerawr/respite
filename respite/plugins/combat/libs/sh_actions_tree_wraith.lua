local PLUGIN = PLUGIN

//
local ACT
ACT = {}
ACT.uid = "ichor_stretch"
ACT.name = "Ichor Stretch"
ACT.desc = "Stretch your body, attacking an enemy with your weapon from melee range at unexpected angles."
ACT.category = "Ichor"
ACT.attackString = "stretches unnaturally, delivering an unexpected attack"
ACT.CD = 2
ACT.dmg = 0
ACT.weaponMult = 1.25
ACT.trait = "tree_wraith"
ACT.mult = {
	["end"] = 1,
	["str"] = 1,
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "ichor_superheat"
ACT.name = "Superheat"
ACT.desc = "Superheat a portion of your body, and attack an enemy with it. Increases your evasion for 2 turns."
ACT.category = "Ichor"
ACT.attackString = "superheats their body, delivering a scorching attack"
ACT.CD = 4
ACT.dmg = 0
ACT.dmgT = "Fire"
ACT.weaponMult = 2
ACT.trait = "tree_wraith"
ACT.mult = {
	["end"] = 2,
	["stm"] = 1,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Superheated",
		effect = "dodge",
		duration = 2,
		strength = 1,
		
		evasion = 50,
		
		selfApply = true,
		buff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "ichor_freeze"
ACT.name = "Solidify"
ACT.desc = "Freeze a portion of your body, and attack an enemy with it. Increases your armor for 2 turns."
ACT.category = "Ichor"
ACT.attackString = "freezes and solidifies their body, delivering a solid attack"
ACT.CD = 4
ACT.dmg = 0
ACT.dmgT = "Cold"
ACT.weaponMult = 2
ACT.trait = "tree_wraith"
ACT.mult = {
	["end"] = 2,
	["str"] = 1,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Solidify",
		effect = "armor",
		duration = 2,
		strength = 1,
		
		armor = 150,
		
		selfApply = true,
		buff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "ichor_host"
ACT.name = "Host"
ACT.desc = "Launch ichor into an enemy in an attempt to turn it into a berserk wraith. Will not be friendly to anything but other wraiths. Will not work on enemies that are larger than you. Lowers your max health by 20 for 2 turns."
ACT.category = "Ichor"
ACT.attackString = "launches berserking ichor"
ACT.CD = 5
ACT.dmg = 25
ACT.dmgT = "Ichor"
ACT.trait = "tree_wraith"
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Ichor Loss",
		effect = "weaken",
		duration = 3,
		strength = 1,
		
		maxHP = -20,
		
		selfApply = true,
		buff = true,
	},
	[2] = {
		uid = ACT.uid,
		
		name = "Ichor Host",
		effect = "weaken",
		duration = 10,
		strength = 1,

		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "ichor_grapple"
ACT.name = "Ichor Grapple"
ACT.desc = "If your target is larger than you, pull yourself to it. If your target is the same size or smaller than you, pull it to you. Does not end your turn, but counts as your movement."
ACT.category = "Ichor"
ACT.attackString = "pulls"
ACT.CD = 5
ACT.dmg = 20
ACT.dmgT = "Ichor"
ACT.trait = "tree_wraith"
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Ichor Grapple",
		effect = "move",
		duration = 0,
		strength = 1,
		
		selfApply = true,
		buff = true,
	},
	[2] = {
		uid = ACT.uid,
		
		name = "Ichor Grapple",
		effect = "move",
		duration = 0,
		strength = 1,

		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "ichor_explode"
ACT.name = "Ichor Excursion"
ACT.desc = "Launch all of the ichor in your body into your surroundings violently, dealing significant damage. Stuns self for one turn while body reforms."
ACT.category = "Ichor"
ACT.attackString = "explodes"
ACT.CD = 10
ACT.dmg = 50
ACT.dmgT = "Ichor"
ACT.radius = 200
ACT.notarget = true
ACT.noSelf = true
ACT.trait = "tree_wraith"
ACT.mult = {
	["end"] = 10,
	["str"] = 10,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Stun",
		effect = "stun",
		duration = 1,
		strength = 1,
		
		selfApply = true,
		debuff = true,
	}
}
ACTS:Register(ACT)