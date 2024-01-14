local PLUGIN = PLUGIN

//
local ACT
ACT = {}
ACT.uid = "weapon_stab"
ACT.name = "Stab (Weapon)"
ACT.desc = "Use your weapon to stab."
ACT.category = "Weapon"
ACT.hidden = true
ACT.attackString = "stabs"
ACT.CD = 1
ACT.dmg = 0
ACT.dmgT = "Pierce"
ACT.weaponMult = 0.8
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "weapon_whack"
ACT.name = "Whack (Weapon)"
ACT.desc = "Use your weapon to whack."
ACT.category = "Weapon"
ACT.hidden = true
ACT.attackString = "whacks"
ACT.CD = 1
ACT.dmg = 0
ACT.dmgT = "Crush"
ACT.weaponMult = 0.8
ACTS:Register(ACT)

//
local ACT
ACT = {}
ACT.uid = "weapon_slash"
ACT.name = "Slash (Weapon)"
ACT.desc = "Use your weapon to slash."
ACT.category = "Weapon"
ACT.hidden = true
ACT.attackString = "slashes"
ACT.CD = 1
ACT.dmg = 0
ACT.dmgT = "Slash"
ACT.weaponMult = 0.8
ACTS:Register(ACT)

//
local ACT
ACT = {}
ACT.uid = "shield_hunker"
ACT.name = "Hunker Down"
ACT.desc = "Hunker down and protect yourself with your shield."
ACT.category = "Weapon"
ACT.hidden = true
ACT.attackString = "hunkers down"
ACT.CD = 3
ACT.selfOnly = true
ACT.notarget = true
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Shield",
		effect = "shield",
		duration = 1,
		strength = 1,
		
		armor = 100,
		
		hitsDef = 1,
		
		selfApply = true,
		buff = true,
	}
}
ACTS:Register(ACT)


//
local ACT
ACT = {}
ACT.uid = "charged_armor"
ACT.name = "Charged Armor Release"
ACT.desc = "Release the electrical charge in your armor onto an enemy. This can be done as a reaction to a melee attack. Can also be used in melee range on any target."
ACT.category = "Weapon"
ACT.hidden = true
ACT.attackString = "releases an electric charge from their armor"
ACT.CD = 50
ACT.dmg = 50
ACT.dmgT = "Electric"
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
ACT.uid = "violet_lmg"
ACT.name = "M249 SAW"
ACT.desc = "Fire a burst from an M249 SAW."
ACT.category = "Weapon"
ACT.hidden = true
ACT.attackString = "fires a burst from an M249"
ACT.CD = 3
ACT.dmg = 14
ACT.dmgT = "Rifle"
ACT.multi = 3
ACT.mult = {
	["stm"] = 0.1,
}
ACTS:Register(ACT)

//
local ACT
ACT = {}
ACT.uid = "violet_flamethrower"
ACT.name = "Flamethrower"
ACT.desc = "Shoots fire from a flamethrower."
ACT.category = "Weapon"
ACT.hidden = true
ACT.attackString = "sprays fire"
ACT.CD = 1
ACT.dmg = 10
ACT.dmgT = "Fire"
ACT.mult = {
	["stm"] = 0.5,
}
ACTS:Register(ACT)