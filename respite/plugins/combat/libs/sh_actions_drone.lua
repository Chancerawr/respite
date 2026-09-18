local PLUGIN = PLUGIN

//
local ACT --self buff
ACT = {}
ACT.uid = "drone_discharge"
ACT.name = "Discharge"
ACT.desc = "Shock an enemy, lowering their accuracy and dodge."
ACT.category = "Drone"
ACT.hidden = true
ACT.attackString = "discharges electricity"
ACT.dmg = 0
ACT.dmgT = "Electric"
ACT.weaponMult = 1
ACT.CD = 1
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Shocked",
		effect = "weaken",
		duration = 1,
		strength = 1,
		
		evasion = -50,
		accuracy = -50,

		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT --self buff
ACT = {}
ACT.uid = "drone_scan"
ACT.name = "Scan"
ACT.desc = "Lower a targets armor and evasion for a turn."
ACT.category = "Drone"
ACT.hidden = true
ACT.attackString = "scans a target, opening them up to attack"
ACT.CD = 1
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Scan",
		effect = "weaken",
		duration = 1,
		strength = 1,
		
		evasion = -100,
		armor = -100,

		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "drone_lacerate"
ACT.name = "Lacerate"
ACT.desc = "Slices an enemy."
ACT.category = "Drone"
ACT.hidden = true
ACT.attackString = "lacerates their target"
ACT.CD = 1
ACT.dmg = 0
ACT.dmgT = "Pierce"
ACT.weaponMult = 0.5
ACT.multi = 2
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Bleed",
		effect = "bleed",
		duration = 3,
		strength = 1,
		
		dmg = 10,
		dmgT = "Pierce",
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT --self buff
ACT = {}
ACT.uid = "learning_str"
ACT.name = "Analyze (Strength)"
ACT.desc = "Increase your strength by 50 for a turn."
ACT.category = "Meld"
ACT.hidden = true
ACT.attackString = "analyzes strength"
ACT.selfOnly = true
ACT.notarget = true
ACT.CD = 1
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Analysis (Strength)",
		effect = "buff",
		duration = 1,
		strength = 1,
		
		attrib = {
			["str"] = 50,
		},
		
		selfApply = true,
		buff = true,
	}
}
ACTS:Register(ACT)
//
local ACT --self buff
ACT = {}
ACT.uid = "learning_agi"
ACT.name = "Analyze (Agility)"
ACT.desc = "Increase your agility by 50 for a turn."
ACT.category = "Meld"
ACT.hidden = true
ACT.attackString = "analyzes agility"
ACT.selfOnly = true
ACT.notarget = true
ACT.CD = 1
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Analysis (Agility)",
		effect = "buff",
		duration = 1,
		strength = 1,
		
		attrib = {
			["stm"] = 50,
		},
		
		selfApply = true,
		buff = true,
	}
}
ACTS:Register(ACT)
//
local ACT --self buff
ACT = {}
ACT.uid = "learning_end"
ACT.name = "Analyze (Endurance)"
ACT.desc = "Increase your endurance by 50 for a turn."
ACT.category = "Meld"
ACT.hidden = true
ACT.attackString = "analyzes endurance"
ACT.selfOnly = true
ACT.notarget = true
ACT.CD = 1
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Analysis (Endurance)",
		effect = "buff",
		duration = 1,
		strength = 1,
		
		attrib = {
			["end"] = 50,
		},
		
		selfApply = true,
		buff = true,
	}
}
ACTS:Register(ACT)
//
local ACT --self buff
ACT = {}
ACT.uid = "learning_fort"
ACT.name = "Analyze (Fortitude)"
ACT.desc = "Increase your fortitude by 50 for a turn."
ACT.category = "Meld"
ACT.hidden = true
ACT.attackString = "analyzes fortitude"
ACT.selfOnly = true
ACT.notarget = true
ACT.CD = 1
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Analysis (Fortitude)",
		effect = "buff",
		duration = 1,
		strength = 1,
		
		attrib = {
			["fortitude"] = 50,
		},
		
		selfApply = true,
		buff = true,
	}
}
ACTS:Register(ACT)
//
local ACT --self buff
ACT = {}
ACT.uid = "learning_perc"
ACT.name = "Analyze (Perception)"
ACT.desc = "Increase your perception by 50 for a turn."
ACT.category = "Meld"
ACT.hidden = true
ACT.attackString = "analyzes perception"
ACT.selfOnly = true
ACT.notarget = true
ACT.CD = 1
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Analysis (Perception)",
		effect = "buff",
		duration = 1,
		strength = 1,
		
		attrib = {
			["perception"] = 50,
		},
		
		selfApply = true,
		buff = true,
	}
}
ACTS:Register(ACT)
//
local ACT --self buff
ACT = {}
ACT.uid = "learning_acc"
ACT.name = "Analyze (Accuracy)"
ACT.desc = "Increase your accuracy by 50 for a turn."
ACT.category = "Meld"
ACT.hidden = true
ACT.attackString = "analyzes accuracy"
ACT.selfOnly = true
ACT.notarget = true
ACT.CD = 1
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Analysis (Accuracy)",
		effect = "buff",
		duration = 1,
		strength = 1,
		
		attrib = {
			["accuracy"] = 50,
		},
		
		selfApply = true,
		buff = true,
	}
}
ACTS:Register(ACT)
//
local ACT --self buff
ACT = {}
ACT.uid = "learning_craft"
ACT.name = "Analyze (Craftiness)"
ACT.desc = "Increase your craftiness by 50 for a turn."
ACT.category = "Meld"
ACT.hidden = true
ACT.attackString = "analyzes craftiness"
ACT.selfOnly = true
ACT.notarget = true
ACT.CD = 1
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Analysis (Craftiness)",
		effect = "buff",
		duration = 1,
		strength = 1,
		
		attrib = {
			["medical"] = 50,
		},
		
		selfApply = true,
		buff = true,
	}
}
ACTS:Register(ACT)
//
local ACT --self buff
ACT = {}
ACT.uid = "learning_luck"
ACT.name = "Analyze (Luck)"
ACT.desc = "Increase your luck by 50 for a turn."
ACT.category = "Meld"
ACT.hidden = true
ACT.attackString = "analyzes luck"
ACT.selfOnly = true
ACT.notarget = true
ACT.CD = 1
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Analysis (Luck)",
		effect = "buff",
		duration = 1,
		strength = 1,
		
		attrib = {
			["luck"] = 50,
		},
		
		selfApply = true,
		buff = true,
	}
}
ACTS:Register(ACT)
local ACT
ACT = {}
ACT.uid = "repair_meld"
ACT.name = "Repair (Meld)"
ACT.desc = "Repair another Melded creature."
ACT.category = "Meld"
ACT.hidden = true
ACT.attackString = "repairs an ally"
ACT.CD = 1
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "drone_bone_barrage"
ACT.name = "Bone Barrage"
ACT.desc = "Unleash a barrage of bone-like shards"
ACT.category = "Meld"
ACT.hidden = true
ACT.attackString = "fires a barrage of bone-like shards."
ACT.CD = 3
ACT.dmg = 10
ACT.dmgT = "Pierce"
ACT.multi = 4
ACT.mult = {
	["accuracy"] = 0.1,
	["perception"] = 0.1,
}
ACTS:Register(ACT)
// 
local ACT
ACT = {}
ACT.uid = "drone_missile"
ACT.name = "Missile"
ACT.desc = "Launch a missile."
ACT.category = "Meld"
ACT.hidden = true
ACT.attackString = "launches a missile"
ACT.CD = 3
ACT.radius = 100
ACT.dmg = 0
ACT.dmgT = "Explosion"
ACT.notarget = true
ACT.noSelf = true
ACT.weaponMult = 1.5
ACT.mult = {
	["medical"] = 0.5,
}
ACTS:Register(ACT)