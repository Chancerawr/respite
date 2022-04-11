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