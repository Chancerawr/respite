local PLUGIN = PLUGIN

//
local ACT
ACT = {}
ACT.uid = "blind"
ACT.name = "Blind"
ACT.desc = "Distorts the vision of their target, preventing them from properly seeing. Lasts two turns."
ACT.category = "Fortitude"
ACT.attackString = "distorts the vision of their target"
ACT.CD = 5
ACT.reqStats = {
	["fortitude"] = 10,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Blind",
		effect = "blind",
		duration = 2,
		strength = 1,
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "enrage"
ACT.name = "Enrage"
ACT.desc = "Force an enemy to become enraged, it will be forced to do an attack every turn unless there are no targets to attack. Lasts three turns."
ACT.category = "Fortitude"
ACT.attackString = "enrages their target"
ACT.CD = 6
ACT.reqStats = {
	["fortitude"] = 15,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Enrage",
		effect = "mind",
		duration = 3,
		strength = 1,
		
		amp = {
			["dmg"] = 10,
		},
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "blightblast"
ACT.name = "Blight Blast"
ACT.desc = "Launches a blast of blight at your target."
ACT.category = "Fortitude"
ACT.attackString = "launches a blast of blight at their target"
ACT.CD = 1
ACT.dmg = 20
ACT.dmgT = "Blight"
ACT.mult = {
	["fortitude"] = 0.5,
}
ACT.reqStats = {
	["fortitude"] = 20,
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "blightchains"
ACT.name = "Blight Chains"
ACT.desc = "Create chains of blight that root an enemy. Root lasts 1 turn."
ACT.category = "Fortitude"
ACT.attackString = "creates blighted chains to root their target"
ACT.CD = 3
ACT.dmg = 15
ACT.dmgT = "Blight"
ACT.mult = {
	["fortitude"] = 0.25,
}
ACT.reqStats = {
	["fortitude"] = 25,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Root",
		effect = "root",
		duration = 2,
		strength = 1,
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "sleep"
ACT.name = "Sleep"
ACT.desc = "Put your target to sleep for two turns. They are woken up by taking any damage, or if an ally wakes them up."
ACT.category = "Fortitude"
ACT.attackString = "puts their target to sleep"
ACT.CD = 6
ACT.reqStats = {
	["fortitude"] = 30,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Sleep",
		effect = "sleep",
		duration = 2,
		strength = 1,
		
		hitLeft = 1,
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "dread"
ACT.name = "Dread"
ACT.desc = "Instill your foes with dread, weakening them."
ACT.category = "Fortitude"
ACT.attackString = "instills foes with dread"
ACT.CD = 6
ACT.radius = 200
ACT.notarget = true
ACT.reqStats = {
	["fortitude"] = 35,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Dread",
		effect = "weak",
		duration = 2,
		strength = 1,
		
		accuracy = -30,
		critC = -3,
		critF = 3,
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "blightbarrage"
ACT.name = "Blight Barrage"
ACT.desc = "Barrage your enemies with blight."
ACT.category = "Fortitude"
ACT.attackString = "unleashes a blight barrage"
ACT.CD = 3
ACT.multi = 3
ACT.dmgT = "Blight"
ACT.dmg = 20
ACT.radius = 100
ACT.notarget = true
ACT.mult = {
	["fortitude"] = 0.5,
}
ACT.reqStats = {
	["fortitude"] = 40,
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "teleport"
ACT.name = "Teleport"
ACT.desc = "Relocate yourself, cannot be done if an enemy is next to you."
ACT.category = "Fortitude"
ACT.attackString = "teleports"
ACT.CD = 5
ACT.selfOnly = true
ACT.notarget = true
ACT.reqStats = {
	["fortitude"] = 45,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Teleport",
		effect = "move",
		duration = 0,
		strength = 1,
		
		selfApply = true,
		buff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "betray"
ACT.name = "Betray"
ACT.desc = "Force a target to attack a target of your choice one time."
ACT.category = "Fortitude"
ACT.attackString = "tries to force their target to attack something"
ACT.CD = 6
ACT.reqStats = {
	["fortitude"] = 50,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Betray",
		effect = "mind",
		duration = 1,
		strength = 1,
		
		debuff = true,
	}
}
ACTS:Register(ACT)