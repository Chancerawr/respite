local PLUGIN = PLUGIN

//
local ACT
ACT = {}
ACT.uid = "slash"
ACT.name = "Slash"
ACT.desc = "A simple slash."
ACT.category = "Monster"
ACT.hidden = true
ACT.attackString = "slashes"
ACT.CD = 1
ACT.dmg = 0
ACT.dmgT = "Slash"
ACT.weaponMult = 1
ACT.mult = {
	["stm"] = 0.25,
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "smack"
ACT.name = "Smack"
ACT.desc = "A simple smack."
ACT.category = "Monster"
ACT.hidden = true
ACT.attackString = "smacks"
ACT.CD = 1
ACT.dmg = 0
ACT.dmgT = "Blunt"
ACT.weaponMult = 1
ACT.mult = {
	["str"] = 0.25,
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "Stab"
ACT.name = "Stab"
ACT.desc = "A simple stab."
ACT.category = "Monster"
ACT.hidden = true
ACT.attackString = "stabs"
ACT.CD = 1
ACT.dmg = 0
ACT.dmgT = "Pierce"
ACT.weaponMult = 1
ACT.mult = {
	["accuracy"] = 0.25,
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "maw_bite"
ACT.name = "Mawed Bite"
ACT.desc = "Bite with big mouth."
ACT.category = "Monster"
ACT.hidden = true
ACT.attackString = "uses their maw to bite"
ACT.CD = 1
ACT.dmg = 0
ACT.weaponMult = 1
ACT.mult = {
	["str"] = 0.2,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Pain",
		effect = "pain",
		duration = 1,
		strength = 1,
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "acid_spit"
ACT.name = "Spit Acid"
ACT.desc = "Spit acid."
ACT.category = "Monster"
ACT.hidden = true
ACT.attackString = "spits acid at"
ACT.CD = 1
ACT.dmg = 0
ACT.dmgT = "Acid"
ACT.weaponMult = 0.9
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Acid",
		effect = "acid",
		duration = 2,
		strength = 1,
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "throw_meat"
ACT.name = "Throw Meat"
ACT.desc = "Throw meat."
ACT.category = "Monster"
ACT.hidden = true
ACT.attackString = "throws a chunk of boiling hot meat."
ACT.CD = 1
ACT.dmg = 0
ACT.dmgT = "Fire"
ACT.weaponMult = 1
ACT.mult = {
	["str"] = 0.3,
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "poison_release"
ACT.name = "Poison Release"
ACT.desc = "Poison stuff"
ACT.category = "Monster"
ACT.hidden = true
ACT.attackString = "unleashes a blast of poison from its body"
ACT.CD = 1
ACT.dmg = 0
ACT.dmgT = "Poison"
ACT.weaponMult = 0.8
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Poison",
		effect = "poison",
		duration = 3,
		strength = 1,
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "claw_decay"
ACT.name = "Decaying Claw"
ACT.desc = "Claw that decays."
ACT.category = "Monster"
ACT.hidden = true
ACT.attackString = "slashes with a decaying claw"
ACT.CD = 1
ACT.dmg = 0
ACT.dmgT = "Disease"
ACT.weaponMult = 0.5
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Decay",
		effect = "disease",
		duration = 5,
		strength = 1,
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "claw_poison"
ACT.name = "Poisonous Claw"
ACT.desc = "Claw that poisons."
ACT.category = "Monster"
ACT.hidden = true
ACT.attackString = "slashes with a poisonous claw"
ACT.CD = 1
ACT.dmg = 0
ACT.dmgT = "Poison"
ACT.weaponMult = 0.7
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Poison",
		effect = "poison",
		duration = 3,
		strength = 1,
		
		chance = 50,
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "claw_electric"
ACT.name = "Electric Claw"
ACT.desc = "Claw that electifies."
ACT.category = "Monster"
ACT.hidden = true
ACT.attackString = "slashes with an electric claw"
ACT.CD = 1
ACT.dmg = 0
ACT.dmgT = "Electric"
ACT.weaponMult = 1
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Stun",
		effect = "stun",
		duration = 1,
		strength = 1,
		
		chance = 25,
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "flail"
ACT.name = "Flail"
ACT.desc = "Flail your limbs, all of them."
ACT.category = "Monster"
ACT.hidden = true
ACT.attackString = "flails recklessly"
ACT.CD = 1
ACT.dmg = 0
ACT.dmgT = "Blunt"
ACT.weaponMult = 0.4
ACT.multi = 3
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Slow",
		effect = "slow",
		duration = 1,
		strength = 1,
		
		chance = 50,
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "constrict"
ACT.name = "Constrict"
ACT.desc = "Grab ahold of target with something, and squish."
ACT.category = "Monster"
ACT.hidden = true
ACT.attackString = "constricts"
ACT.CD = 1
ACT.dmg = 0
ACT.dmgT = "Blunt"
ACT.weaponMult = 1
ACT.mult = {
	["str"] = 0.25,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Root",
		effect = "root",
		duration = 1,
		strength = 1,
		
		chance = 50,
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "repair_doll"
ACT.name = "Repair (Doll)"
ACT.desc = "Repair another Doll-like creature."
ACT.category = "Monster"
ACT.hidden = true
ACT.attackString = "repairs"
ACT.CD = 1
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "bone_burst"
ACT.name = "Bone Burst"
ACT.desc = "Fire a jagged bone at an enemy."
ACT.category = "Monster"
ACT.hidden = true
ACT.attackString = "fires a burst of jagged bones at"
ACT.CD = 1
ACT.dmg = 0
ACT.dmgT = "Pierce"
ACT.weaponMult = 0.5
ACT.multi = 3
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Bleed",
		effect = "bleed",
		duration = 1,
		strength = 1,
		
		chance = 25,
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "smog"
ACT.name = "Smog"
ACT.desc = "Release a blast of burning smog."
ACT.category = "Monster"
ACT.hidden = true
ACT.attackString = "releases a blast of burning smog at"
ACT.CD = 1
ACT.dmg = 0
ACT.dmgT = "Fire"
ACT.weaponMult = 1
ACTS:Register(ACT)