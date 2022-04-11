local PLUGIN = PLUGIN

//
local ACT
ACT = {}
ACT.uid = "ichor_spit"
ACT.name = "Ichor Spit"
ACT.desc = "Spit ichor."
ACT.category = "Monster"
ACT.hidden = true
ACT.attackString = "spits a burning glob of ichor at"
ACT.CD = 1
ACT.dmg = 0
ACT.dmgT = "Ichor"
ACT.weaponMult = 1.2
ACTS:Register(ACT)