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
ACT.onHit = function(actionTbl, attacker, info)
	local trace = info.trace

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
ACT.summon = "nut_combat_doll"
ACT.onSummon = function(actionTbl, attacker, info, summon)
	summon:setNetVar("name", "Recurrence")
end
ACTS:Register(ACT)

//
local ACT
ACT = {}
ACT.uid = "forest_heal"
ACT.name = "Healing Word of Nature"
ACT.desc = "Heals a target for 50 HP."
ACT.category = "Forest"
ACT.hidden = true
ACT.attackString = "heals with the power of gentle words"
ACT.CD = 5
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Heal",
		effect = "heal",
		duration = 0,

		buff = true,
	}
}
ACT.onEffect = function(actionTbl, action, attacker, info)
	local trace = info.trace
	local target = trace.Entity
	local client = info.client
	
	if(client.KeyDown and client:KeyDown(IN_WALK)) then --self targetting
		target = attacker
	end

	target:addHP(50)
end
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "forest_fire"
ACT.name = "Forest Fire"
ACT.desc = "Hits an area with a large fireball."
ACT.category = "Forest"
ACT.hidden = true
ACT.attackString = "attacks with a large fireball"
ACT.CD = 3
ACT.weaponMult = 1.5
ACT.radius = 200
ACT.dmg = 0
ACT.dmgT = "Fire"
ACT.notarget = true
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "forest_song"
ACT.name = "Song of the Forest"
ACT.desc = "Sing and provide a motivational buff to allies."
ACT.category = "Forest"
ACT.hidden = true
ACT.attackString = "sings"
ACT.CD = 3
ACT.radius = 200
ACT.notarget = true
ACT.noSelf = true
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Song",
		effect = "amp",
		duration = 3,
		strength = 1,

		attribs = {
			["str"] = 5,
			["stm"] = 5,
			["luck"] = 5,
			["fortitude"] = 5,
			["medical"] = 5,
			["accuracy"] = 5,
			["perception"] = 5,
			["end"] = 5,
		},

		res = {
			["dmg"] = 10,
		},
		
		buff = true,
	}
}
ACTS:Register(ACT)
local ACT
ACT = {}
ACT.uid = "forest_root"
ACT.name = "Entangle"
ACT.desc = "Root a target, preventing it from moving for 1 turn, if the enemy is very large or strong, it may have reduced effect."
ACT.category = "Forest"
ACT.hidden = true
ACT.attackString = "causes roots to sprout from the ground"
ACT.CD = 3
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Song",
		effect = "root",
		duration = 1,
		strength = 1,

		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "rat_chaos"
ACT.name = "Chaos"
ACT.desc = "The target of this action will be forced to do the most chaotic thing they can think of, immediately, even if it is not their turn."
ACT.category = "Rat"
ACT.hidden = true
ACT.attackString = "instigates chaos"
ACT.CD = 20
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Chaos",
		effect = "curse",
		duration = 1,
		strength = 1,
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "rat_dice_ally"
ACT.name = "Roll the Dice (Ally)"
ACT.desc = "Target ally will receive random buffs."
ACT.category = "Rat"
ACT.hidden = true
ACT.attackString = "rolls the dice"
ACT.CD = 5
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Rat Accuracy",
		effect = "stat",
		duration = 2,
		strength = 1,
		
		accuracy = 30,
		
		chance = 33,
		
		buff = true,
	},
	[2] = {
		uid = ACT.uid,
		
		name = "Rat Crit",
		effect = "stat",
		duration = 2,
		strength = 1,

		critC = 5,
		critF = -1,
		
		chance = 33,
		
		buff = true,
	},
	[3] = {
		uid = ACT.uid,
		
		name = "Rat Dodge",
		effect = "stat",
		duration = 2,
		strength = 1,

		evasion = 15,
		
		chance = 33,
		
		buff = true,
	},
	[4] = {
		uid = ACT.uid,
		
		name = "Rat Armor",
		effect = "stat",
		duration = 2,
		strength = 1,

		armor = 100,
		
		chance = 33,
		
		buff = true,
	},
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "rat_dice_enemy"
ACT.name = "Roll the Dice (Enemy)"
ACT.desc = "Target enemy will receive random debuffs."
ACT.category = "Rat"
ACT.hidden = true
ACT.attackString = "rolls the dice"
ACT.CD = 5
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Rat Accuracy",
		effect = "weak",
		duration = 2,
		strength = 1,
		
		accuracy = -30,
		
		chance = 33,
		
		debuff = true,
	},
	[2] = {
		uid = ACT.uid,
		
		name = "Rat Misfortune",
		effect = "weak",
		duration = 2,
		strength = 1,

		critC = -5,
		critF = 1,
		
		chance = 33,
		
		debuff = true,
	},
	[3] = {
		uid = ACT.uid,
		
		name = "Rat Slow",
		effect = "slow",
		duration = 2,
		strength = 1,

		evasion = -15,
		
		chance = 33,
		
		debuff = true,
	},
	[4] = {
		uid = ACT.uid,
		
		name = "Rat Weaken",
		effect = "weaken",
		duration = 2,
		strength = 1,

		armor = -100,
		
		chance = 33,
		
		buff = true,
	},
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "rat_hero"
ACT.name = "Rodent Inspiration"
ACT.desc = "Target rodent will gain absurd buffs for two turns. Only works on rodents (not including self)."
ACT.category = "Rat"
ACT.hidden = true
ACT.attackString = "inspires a rodent"
ACT.CD = 5
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Rat Hero",
		effect = "hero",
		duration = 2,
		strength = 1,
		
		accuracy = 50,
		critM = 0.2,
		critC = 15,
		critF = -5,
		armor = 500,

		attrib = {
			["luck"] = 5,
			["stm"] = 5,
			["str"] = 5,
			["end"] = 5,
			["fortitude"] = 5,
			["accuracy"] = 5,
			["perception"] = 5,
			["medical"] = 5,
		},

		amp = {
			["dmg"] = 50,
		},

		buff = true,
	},
}
ACTS:Register(ACT)
local ACT
ACT = {}
ACT.uid = "rat_erasure"
ACT.name = "Extremely Bad Idea"
ACT.desc = "99% chance to do nothing, 1% chance to mark target for erasure."
ACT.category = "Rat"
ACT.hidden = true
ACT.attackString = "tries to mark a target for erasure"
ACT.CD = 5
ACT.effects = {
	[1] = {
		uid = ACT.uid,

		effect = "curse",
		name = "ERASURE TARGET",
		effect = "hero",
		duration = 99,
		strength = 1,
		
		chance = 1,

		debuff = true,
	},
}
ACTS:Register(ACT)