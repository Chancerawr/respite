local PLUGIN = PLUGIN

--copyright free ogre
// 
local ACT
ACT = {}
ACT.uid = "ogre_swing"
ACT.name = "Ogre Swing"
ACT.desc = "Swing in a wide area, knocking enemies to the left or right."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "swings its club in a wide arc"
ACT.CD = 3
ACT.radius = 125
ACT.dmg = 0
ACT.dmgT = "Blunt"
ACT.weaponMult = 1
ACT.notarget = true
ACT.noSelf = true
ACT.mult = {
	["str"] = 0.5,
}
ACTS:Register(ACT)
// 
local ACT
ACT = {}
ACT.uid = "ogre_kick"
ACT.name = "Ogre Kick"
ACT.desc = "Kick an enemy very far backwards."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "kicks a target, knocking them backwards"
ACT.CD = 2
ACT.dmg = 0
ACT.dmgT = "Blunt"
ACT.weaponMult = 1
ACT.mult = {
	["str"] = 0.5,
}
ACTS:Register(ACT)
// 
local ACT
ACT = {}
ACT.uid = "ogre_punch"
ACT.name = "Ogre Punch"
ACT.desc = "Punch an enemy into the ground, applies knockdown."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "punches a target off of their feet"
ACT.CD = 2
ACT.dmg = 0
ACT.dmgT = "Blunt"
ACT.weaponMult = 1
ACT.mult = {
	["str"] = 0.5,
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
ACT.uid = "ogre_now"
ACT.name = "It's All Ogre Now"
ACT.desc = "Body slams a target, stunning them and dealing damage."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "body slams their target"
ACT.CD = 10
ACT.dmg = 0
ACT.dmgT = "Blunt"
ACT.weaponMult = 4
ACT.mult = {
	["str"] = 2,
}
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

--the harbinger (harbie)
// 
local ACT
ACT = {}
ACT.uid = "blade_nightmare"
ACT.name = "Nightmare Blade"
ACT.desc = "Swing a nightmarish sword."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "swings a purple, nightmarish blade"
ACT.CD = 2
ACT.dmg = 40
ACT.dmgT = "Time"
ACT.mult = {
	["stm"] = 0.4,
	["fortitude"] = 0.4,
}
ACTS:Register(ACT)
// 
local ACT
ACT = {}
ACT.uid = "todust"
ACT.name = "To Dust"
ACT.desc = "Launch a missile."
ACT.category = "Boss"
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
//
local ACT
ACT = {}
ACT.uid = "toash"
ACT.name = "To Ash"
ACT.desc = "Create fire."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "shoots fire out of its body"
ACT.CD = 3
ACT.radius = 50
ACT.dmg = 0
ACT.dmgT = "Fire"
ACT.weaponMult = 1
ACT.mult = {
	["medical"] = 0.5,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Burning",
		effect = "fire",
		duration = 3,
		strength = 1,
		
		dmg = 15,
		dmgT = "Fire",
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "death_decay"
ACT.name = "Death & Decay"
ACT.desc = "Continously deal rot damage to everything in a circle."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "creates an area of decay"
ACT.CD = 3
ACT.dmg = 0
ACT.dmgT = "Rot"
ACT.radius = 100
ACT.weaponMult = 1
ACT.notarget = true
ACT.mult = {
	["fortitude"] = 1,
}
ACT.attackOverwrite = function(actionTbl, attacker, trace)
	local disc = ents.Create("prop_physics")
	disc:SetModel("models/props_phx/construct/plastic/plastic_angle_360.mdl")
	disc:SetMaterial("models/player/player_chrome1")
	disc:SetPos(trace.HitPos)
	disc:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
	disc:SetModelScale(actionTbl.radius/47)
	disc:Spawn()

	local physObj = disc:GetPhysicsObject()

	if(IsValid(physObj)) then
		physObj:EnableMotion(false)
	end

	PLUGIN:attackStart(attacker, attacker, trace, actionTbl)
end
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "dream_exist"
ACT.name = "Dreamy Existence"
ACT.desc = "Gives evasion, armor, damage resistance?"
ACT.category = "Boss"
ACT.hidden = true
ACT.notarget = true
ACT.selfOnly = true
ACT.attackString = "shifts in reality, becoming dreamy"
ACT.CD = 3
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Dreamy",
		effect = "dodge",
		duration = 1,
		strength = 1,
		
		amp = {
			["dmg"] = 10,
		},
		
		armor = 100,
		evasion = 200,
		critC = 2,
		critM = 0.5,
		
		hitsDef = 2,
		
		selfApply = true,
		buff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "prophecy_self"
ACT.name = "Self-Fulfilling Prophecy"
ACT.desc = "Damage output buff for one turn, removed if hit enough times?"
ACT.category = "Boss"
ACT.hidden = true
ACT.notarget = true
ACT.selfOnly = true
ACT.attackString = "prepares for a massive attack"
ACT.CD = 3
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Prophecy",
		effect = "charge",
		duration = 1,
		strength = 1,

		accuracy = 1000,
		attribs = {
			["medical"] = 100,
			["fortitude"] = 50,
		},

		hitsDef = 4,
		hitsAttack = 1,
		
		selfApply = true,
		buff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "dream_harbinger"
ACT.name = "Dream"
ACT.desc = "Overwrite reality in the surrounding area with a dream."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "overwrites the surrounding area"
ACT.CD = 3
ACT.dmg = 0
ACT.dmgT = "Time"
ACT.weaponMult = 0.5
ACT.radius = 500
ACT.notarget = true
ACT.noSelf = true
ACT.mult = {
	["fortitude"] = 0.5,
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "recurring_nightmare"
ACT.name = "Recurring Nightmare"
ACT.desc = "Create a weaker copy of yourself (with no spells)."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "creates a copy of itself"
ACT.CD = 2
ACT.notarget = true
ACT.attackOverwrite = function(actionTbl, attacker, trace)
	local copy = ents.Create("nut_combat_doll")
	copy:SetPos(trace.HitPos)
	copy:Spawn()
	
	copy:setNetVar("name", "Recurrence")

	PLUGIN:attackStart(attacker, attacker, trace, actionTbl)
end
ACTS:Register(ACT)