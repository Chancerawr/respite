local PLUGIN = PLUGIN

//
local ACT
ACT = {}
ACT.uid = "blood_shield"
ACT.name = "Blood Shield"
ACT.desc = "Creates a shield of blood, levitated by some unknown force."
ACT.category = "Fiend"
ACT.hidden = true
ACT.attackString = "creates a shield of blood"
ACT.notarget = true
ACT.selfOnly = true
ACT.CD = 5
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Shield",
		effect = "armor",
		duration = 3,
		strength = 1,

		armor = 250,
		hitsDef = 2,
		
		selfApply = true,
		buff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "blood_spike"
ACT.name = "Blood Spike"
ACT.desc = "Launches a spike of hardened blood, levitated by some unknown force."
ACT.category = "Fiend"
ACT.hidden = true
ACT.attackString = "launches a spike of living blood"
ACT.CD = 2
ACT.accuracy = 50
ACT.dmg = 0
ACT.dmgT = "Pierce"
ACT.weaponMult = 1.2
ACT.mult = {
	["accuracy"] = 0.25,
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "blood_pool"
ACT.name = "Blood Pool"
ACT.desc = "Controls a pool of blood to restrict a target's movements."
ACT.category = "Fiend"
ACT.hidden = true
ACT.attackString = "controls a pool of blood, using it to root a target in place"
ACT.CD = 2
ACT.accuracy = 50
ACT.dmg = 0
ACT.dmgT = "Acid"
ACT.weaponMult = 0.25
ACT.mult = {
	["accuracy"] = 0.25,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Blood Rooted",
		effect = "root",
		duration = 2,
		strength = 1,
		
		armor = -50,
		dmg = 5,
		dmgT = "Acid",
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "blood_torrent"
ACT.name = "Blood Torrent"
ACT.desc = "Launches several bullet-like projectiles."
ACT.category = "Fiend"
ACT.hidden = true
ACT.attackString = "fires several bullet-like projectiles"
ACT.CD = 3
ACT.multi = 3
ACT.dmg = 0
ACT.dmgT = "Pierce"
ACT.weaponMult = 0.7
ACT.mult = {
	["accuracy"] = 0.25,
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "blood_shredder"
ACT.name = "Shredder"
ACT.desc = "Uses existing blood to eviscerate a target. (Only works on blood rooted targets)"
ACT.category = "Fiend"
ACT.hidden = true
ACT.attackString = "transforms a pool of blood into a cyclone of shredding blades"
ACT.CD = 3
ACT.multi = 6
ACT.accuracy = 50
ACT.dmg = 0
ACT.dmgT = "Slash"
ACT.weaponMult = 0.2
ACT.mult = {
	["fortitude"] = 0.1,
	["accuracy"] = 0.1,
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "blood_martyr"
ACT.name = "Blood Martyr"
ACT.desc = "Transform a fiend into a living bomb."
ACT.category = "Fiend"
ACT.hidden = true
ACT.attackString = "bursts a targeted Fiend from the inside"
ACT.CD = 2
ACT.accuracy = 100
ACT.dmg = 0
ACT.dmgT = "Acid"
ACT.radius = 100
ACT.mult = {
	["accuracy"] = 0.25,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Blood Rooted",
		effect = "root",
		duration = 1,
		strength = 1,
		
		armor = -50,
		dmg = 5,
		dmgT = "Acid",
		
		debuff = true,
	}
}
ACT.attackOverwrite = function(actionTbl, client, trace)
	local target = trace.Entity
	if(IsValid(target) and target.combat) then
		actionTbl.dmg = target:getHP()*0.5

		PLUGIN:attackStart(client, client, trace, actionTbl)
	end
end
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "blood_sacrifice"
ACT.name = "Blood Sacrifice"
ACT.desc = "Explode."
ACT.category = "Fiend"
ACT.hidden = true
ACT.attackString = "bursts from the inside"
ACT.CD = 2
ACT.accuracy = 100
ACT.dmg = 0
ACT.dmgT = "Pierce"
ACT.radius = 125
ACT.selfOnly = true
ACT.mult = {
	["accuracy"] = 0.25,
}
ACT.attackOverwrite = function(actionTbl, client, trace)
	local target = trace.Entity
	if(IsValid(target) and target.combat) then
		actionTbl.dmg = target:getHP()

		PLUGIN:attackStart(client, client, trace, actionTbl)
	end
end
ACTS:Register(ACT)