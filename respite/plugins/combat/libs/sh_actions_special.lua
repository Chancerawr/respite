local PLUGIN = PLUGIN

--boss 1
// 
local ACT
ACT = {}
ACT.uid = "erasure"
ACT.name = "Erasure"
ACT.desc = "Erases a target enemy (requires prolonged sight)."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "erases a target from existence"
ACT.CD = 10
ACT.dmg = 0
ACT.dmgT = "Erasure"
ACT.weaponMult = 10
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "dist_slice"
ACT.name = "Distortion Slice"
ACT.desc = "Slice through space, dealing damage."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "slices through space itself"
ACT.CD = 1
ACT.dmg = 0
ACT.dmgT = "Distort"
ACT.weaponMult = 1
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "shard_beam"
ACT.name = "Light of Creation"
ACT.desc = "Fire a concentrated beam of shard light at a target."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "fires a concentrated beam of shard light"
ACT.CD = 1
ACT.dmg = 0
ACT.dmgT = "Shard"
ACT.weaponMult = 1
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "blight_shadow"
ACT.name = "Shadow of the Mind"
ACT.desc = "Fire a wave a shadows that creates a blight copy of the target that has 1 health."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "unleashes a wave of darkness"
ACT.CD = 3
ACT.dmg = 0
ACT.dmgT = "Blight"
ACT.weaponMult = 0.5
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Copied",
		effect = "mind",
		duration = 1,
		strength = 1,
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "ichor_glimpse"
ACT.name = "Glimpse of the Soul"
ACT.desc = "Unleash the screaming souls upon a target, terrifying them and putting them through agony."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "unleashes a torrent of screaming ichor"
ACT.CD = 3
ACT.dmg = 0
ACT.dmgT = "Ichor"
ACT.weaponMult = 0.5
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Terrified",
		effect = "fear",
		duration = 1,
		strength = 1,
		
		debuff = true,
	},
	[2] = {
		uid = ACT.uid,
		
		name = "Agony",
		effect = "pain",
		duration = 1,
		strength = 1,
		
		debuff = true,
	},
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "boss_disarm"
ACT.name = "Disarmament"
ACT.desc = "Disable target's weapon for 2 turns."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "disables their target's weapon."
ACT.CD = 3
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Disarm",
		effect = "disarm",
		duration = 2,
		strength = 1,
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "peace_judgement"
ACT.name = "Peace's Judgement"
ACT.desc = "Judge's target based on amount of violence nad chaos they have caused."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "judges the target based on their past actions"
ACT.CD = 5
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Judgement",
		effect = "judgement",
		duration = 2,
		strength = 1,
		chance = 75,
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT --self buff
ACT = {}
ACT.uid = "peace_dream"
ACT.name = "Peace's Dream"
ACT.desc = "Pacify all targets in an AOE."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "pacifies all targets in an AOE."
ACT.radius = 300
ACT.notarget = true
ACT.CD = 10
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Pacified",
		effect = "disarm",
		duration = 1,
		strength = 1,
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT --self buff
ACT = {}
ACT.uid = "peace_determination"
ACT.name = "Peace's Determination"
ACT.desc = "Greatly increase defenses for a single turn."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "greatly increases its defenses"
ACT.selfOnly = true
ACT.notarget = true
ACT.CD = 6
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Determination",
		effect = "armor",
		duration = 1,
		strength = 1,
		
		armor = 1000,
		
		selfApply = true,
		buff = true,
	}
}
ACTS:Register(ACT)
//
local ACT --self buff
ACT = {}
ACT.uid = "peace_innocence"
ACT.name = "Peace's Innocence"
ACT.desc = "Prepare to reflect an incoming attack."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "prepares to reflect an incoming attack"
ACT.selfOnly = true
ACT.notarget = true
ACT.CD = 6
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Reflection",
		effect = "dodge",
		duration = 1,
		strength = 1,
		
		evasion = 1000,
		
		hitsDef = 1,
		
		selfApply = true,
		buff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "reality_bend"
ACT.name = "Bend Reality"
ACT.desc = "Bends reality to the user's wishes, may result in consequences."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "bends reality to their desires"
ACT.selfOnly = true
ACT.notarget = true
ACT.CD = 6
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Consequences",
		effect = "none",
		duration = 1,
		strength = 1,
		
		chance = 75,
		
		selfApply = true,
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "heartstopper"
ACT.name = "Heartstopper"
ACT.desc = "Very low chance to stop the heart of the target."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "attempts to stop its target's heart"
ACT.CD = 2
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Consequences",
		effect = "none",
		duration = 1,
		strength = 1,
		
		chance = 25,
		
		selfApply = true,
		debuff = true,
	},
	[2] = {
		uid = ACT.uid,
		
		name = "Heartstopper",
		effect = "death",
		duration = 1,
		strength = 1,
		
		chance = 1,
		
		debuff = true,
	},
}
ACTS:Register(ACT)


--boss 2
//
local ACT
ACT = {}
ACT.uid = "shard_pierce"
ACT.name = "Shard Pierce"
ACT.desc = "Launches a piercing shard at a target."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "launches a piercing shard"
ACT.dmg = 0
ACT.dmgT = "Pierce"
ACT.weaponMult = 1
ACT.CD = 2
ACTS:Register(ACT)

--[[
//
local ACT
ACT = {}
ACT.uid = "prolong"
ACT.name = "Prolong"
ACT.desc = "Heals everyone in a radius (including enemies)"
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "regenerates the health of those that are fighting."
ACT.CD = 5
ACT.radius = 3000
ACT.notarget = true
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Heal",
		effect = "none",
		duration = 1,
		strength = 1,

		buff = true,
	},
}
ACTS:Register(ACT)
--]]
//
local ACT
ACT = {}
ACT.uid = "attrition"
ACT.name = "Attrition"
ACT.desc = "Damages everyone in a radius (including allies)"
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "Weakens all"
ACT.CD = 5
ACT.radius = 3000
ACT.dmg = 20
ACT.dmgT = "Time"
ACT.notarget = true
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "charge_telekinetic"
ACT.name = "Telekinetic Charge"
ACT.desc = "Launch yourself"
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "propels itself with incredible speed"
ACT.CD = 5
ACT.costHP = -250
ACT.dmg = 0
ACT.dmgT = "Blunt"
ACT.weaponMult = 2
ACTS:Register(ACT)
//
--make it a little more interesting
local ACT
ACT = {}
ACT.uid = "launch_telekinetic"
ACT.name = "Telekinetic Launch"
ACT.desc = "Launch something else"
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "propels something with incredible speed"
ACT.CD = 3
ACT.dmg = 0
ACT.dmgT = "Blunt"
ACT.weaponMult = 1
ACTS:Register(ACT)
//
-- make it an aoe
-- should hit self
local ACT
ACT = {}
ACT.uid = "light_end"
ACT.name = "Light of the End"
ACT.desc = "Hit a target with light that can potentially transform them into a monster."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "radiates an unnatural light to its surroundings"
ACT.CD = 5
ACT.dmg = 0
ACT.dmgT = "Shard"
ACT.weaponMult = 1
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Root",
		effect = "root",
		duration = 1,
		strength = 1,
		
		chance = 15,
		
		debuff = true,
	},
	[2] = {
		uid = ACT.uid,
		
		name = "Blind",
		effect = "blind",
		duration = 1,
		strength = 1,
		
		chance = 15,
		
		debuff = true,
	},
	[3] = {
		uid = ACT.uid,
		
		name = "Disarm",
		effect = "disarm",
		duration = 1,
		strength = 1,
		
		chance = 15,
		
		debuff = true,
	},
	[4] = {
		uid = ACT.uid,
		
		name = "Knockdown",
		effect = "knockdown",
		duration = 1,
		strength = 1,
		
		chance = 15,
		
		debuff = true,
	},
}
ACTS:Register(ACT)

--aoe that hits self, does hp in damage if possible
local ACT
ACT = {}
ACT.uid = "life_destruction"
ACT.name = "Life Destruction"
ACT.desc = "Detonate an abomination to deal damage around it."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "causes a targeted Abomination to explode violently"
ACT.CD = 2
ACT.dmg = 0
ACT.dmgT = "Fire"
ACT.weaponMult = 0
ACT.radius = 100
ACT.onHit = function(actionTbl, action, attacker, info)
	local trace = info.trace
	local target = trace.Entity
	local client = info.client
	
	if(client.KeyDown and client:KeyDown(IN_WALK)) then --self targetting
		target = attacker
	end
	
	if(IsValid(target) and target.combat) then
		action.dmg = action.dmg + target:getHP()
	end
end
ACTS:Register(ACT)
--just for show
local ACT
ACT = {}
ACT.uid = "life_creation"
ACT.name = "Life Creation"
ACT.desc = "Create an abomination out of thin air."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "creates an Abomination out of thin air"
ACT.CD = 2
ACT.notarget = true
ACTS:Register(ACT)

--simple low cd aoe disarm
local ACT
ACT = {}
ACT.uid = "ambitionless_disarm"
ACT.name = "Demotivate"
ACT.desc = "Disarm everyone in an AOE for a turn."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "saps the will to fight away from its targets"
ACT.CD = 3
ACT.radius = 150
ACT.notarget = true
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Disarmed",
		effect = "disarm",
		duration = 1,
		strength = 1,
		
		debuff = true,
	},
}
ACTS:Register(ACT)

--huge aoe disarm, affects self
local ACT
ACT = {}
ACT.uid = "ambitionless_true"
ACT.name = "Ambitionless"
ACT.desc = "Disarms everyone in a huge AOE."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "neutralizes the ambitions of everyone nearby"
ACT.CD = 10
ACT.radius = 3000
ACT.notarget = true
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Disarmed",
		effect = "disarm",
		duration = 1,
		strength = 1,
		
		debuff = true,
	},
}
ACTS:Register(ACT)

--single target high damage teleport
local ACT
ACT = {}
ACT.uid = "carnage"
ACT.name = "Ambitionless Carnage"
ACT.desc = "Attack a single target from anywhere, you will teleport to them."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "slowly approaches its target"
ACT.dmg = 0
ACT.dmgT = "Distort"
ACT.weaponMult = 3
ACT.CD = 3
ACTS:Register(ACT)

--weird RNG action for things that dont make sense
local ACT
ACT = {}
ACT.uid = "hypocrisy"
ACT.name = "Hypocrisy"
ACT.desc = "May heal or hurt a target or both."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "slowly approaches its target"
ACT.dmg = 0
ACT.dmgT = "Distort"
ACT.weaponMult = 2
ACT.CD = 1
ACT.onHit = function(actionTbl, action, attacker, info)
	local trace = info.trace
	local target = trace.Entity
	local client = info.client
	
	if(client.KeyDown and client:KeyDown(IN_WALK)) then --self targetting
		target = attacker
	end
	
	local roll = math.random(1,2)
	if(roll == 1) then --damage
		action.dmg = math.random(30,70)
	else --heal
		target:addHP(math.random(30,70))
	end
end

ACTS:Register(ACT)

--weird RNG action for things that dont make sense
local ACT
ACT = {}
ACT.uid = "fracture"
ACT.name = "Fracture"
ACT.desc = "Split in two."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "splits in two"
ACT.CD = 3
ACT.notarget = true
ACT.selfOnly = true
ACT.onEffect = function(actionTbl, action, attacker, info)
	local trace = info.trace
	local target = attacker
	local pos = trace.HitPos
	
	local clone = ents.Create(target:GetClass()) --the new clone entity
	clone:SetPos(pos) --set its position
	clone:SetAngles(target:GetAngles()) --set its angles
	
	clone:Spawn() --spawn it
	
	clone:SetModel(target:GetModel()) --set its model
	clone:SetModelScale(target:GetModelScale()) --set its model
	clone:SetMaterial(target:GetMaterial() or "") --set its material
	clone:SetColor(target:GetColor() or Color(255,255,255))
	
	for k, v in pairs(target:GetBodyGroups() or {}) do
		clone:SetBodygroup(v.id, target:GetBodygroup(v.id))
	end
	
	clone:setNetVar("name", target:Name()) --set its custom name
	clone:setNetVar("desc", target:Desc()) --set its description

	clone.inv = target.inv
	
	--set its attributes
	clone.attribs = target.attribs
	for k, v in pairs(clone.attribs) do
		clone.attribs[k] = v * 0.6
	end
	
	--combat stats
	clone.armor = target.armor*0.6
	
	clone:setNetVar("hp", target:getHP()*0.5)
	clone:setNetVar("hpMax", target:getMaxHP()*0.5)
	
	clone:setNetVar("mp", target:getMP()*0.5)
	clone:setNetVar("mpMax", target:getMaxMP()*0.5)
	
	clone.actions = target.actions
	
	clone.dmg = target.dmg
	
	for k, v in pairs(clone.dmg) do
		clone.dmg[k] = v*0.6
	end
	
	clone.res = target:getNetVar("res")
	clone.amp = target:getNetVar("amp")

	clone.savedWeapon = target.savedWeapon
	
	if(target.savedWeapon) then
		clone:EquipWeapon(target.savedWeapon[1], target.savedWeapon[2])
	end
	
	clone:SetCreator(client) --prop protection
	
	--sets its animation
	timer.Simple(1, function()
		if(IsValid(clone)) then
			clone:ResetSequence(target:GetSequence())
		end
	end)
end

ACTS:Register(ACT)

--blur
local ACT
ACT = {}
ACT.uid = "blur"
ACT.name = "Blur"
ACT.desc = "Become blurry"
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "becomes incredibly blurry"
ACT.CD = 5
ACT.notarget = true
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Dodge",
		effect = "dodge",
		duration = 1,
		strength = 1,
		
		evasion = 1000,
		
		hitsDef = 2,
		
		selfApply = true,
		buff = true,
	}
}
ACTS:Register(ACT)

--just for show
local ACT
ACT = {}
ACT.uid = "unstable_portal"
ACT.name = "Unstable Portal"
ACT.desc = "Random portals"
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "creates an unstable portal"
ACT.CD = 2
ACT.notarget = true
ACTS:Register(ACT)

--jailer
local ACT
ACT = {}
ACT.uid = "jailer_brace"
ACT.name = "Brace"
ACT.desc = "Brace for impact, reducing next hit's damage by a lot."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "braces for impact, becoming incredibly sturdy"
ACT.CD = 5
ACT.selfOnly = true
ACT.notarget = true
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Armor",
		effect = "armor",
		duration = 1,
		strength = 1,
		
		armor = 1000,
		
		hitsDef = 2,
		
		selfApply = true,
		buff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "jailer_chains"
ACT.name = "Chains"
ACT.desc = "Ensnare a target in living chains."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "ensnares a target in living chains"
ACT.CD = 3
ACT.accuracy = 200
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Chained",
		effect = "root",
		duration = 1,
		strength = 1,
		
		armor = -50,
		evasion = -50,
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "jailer_verdict"
ACT.name = "Verdict"
ACT.desc = "Designate a target for execution, lowering their defenses by a lot."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "marks a target for execution"
ACT.CD = 2
ACT.accuracy = 50
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Verdict",
		effect = "weak",
		duration = 2,
		strength = 1,
		
		armor = -100,
		evasion = -100,
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "jailer_uplift"
ACT.name = "Uplift"
ACT.desc = "Motivates a target into going beyond their limits."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "motivates a target into going beyond its limits"
ACT.CD = 5
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Uplift",
		effect = "armor",
		duration = 5,
		strength = 1,
		
		dmgB = 10,
		armor = -100,
		evasion = 50,
		accuracy = 50,
		critC = 0.2,
		
		buff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "jailer_lastshot"
ACT.name = "Last Shot"
ACT.desc = "Buff an ally, making their next shot exceedingly powerful, they become fragile"
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "empowers a target at the cost of its defenses"
ACT.CD = 5
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Last Shot",
		effect = "armor",
		duration = 1,
		strength = 1,
		
		dmgB = 50,
		armor = -1000,
		accuracy = 200,
		
		hitsAttack = 1,
		
		buff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "jailer_shield"
ACT.name = "Chain Shield"
ACT.desc = "Shield an ally with a living chain."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "shields a target with a living chain"
ACT.CD = 3
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Chain Shield",
		effect = "armor",
		duration = 1,
		strength = 1,
		
		armor = 100,
		accuracy = -50,
		
		buff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "jailer_nightmare"
ACT.name = "Nightmare Shot"
ACT.desc = "Puts a target to sleep for 2 turns (unless awoken)."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "shoots a nightmare-inducing projectile"
ACT.CD = 3
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Nightmare",
		effect = "sleep",
		duration = 2,
		strength = 1,
		
		buff = true,
	}
}
ACTS:Register(ACT)

//
local ACT
ACT = {}
ACT.uid = "jailer_lastwill"
ACT.name = "Last Will"
ACT.desc = "Survive 1 damage instance past death with one action."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "empowers a target to survive death once"
ACT.CD = 3
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Last Will",
		effect = "armor",
		duration = 5,
		strength = 1,
		
		buff = true,
	}
}
ACTS:Register(ACT)

--ambition
//
local ACT
ACT = {}
ACT.uid = "ambition_war"
ACT.name = "Endless War"
ACT.desc = "Heals everything for 100 HP, buffs everything."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "heals everything, empowers everything"
ACT.radius = 1000
ACT.notarget = true
ACT.CD = 4
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Endless War",
		effect = "war",
		duration = 3,
		strength = 1,
		
		attrib = {
			["str"] = 25,
			["accuracy"] = 25,
			["stm"] = 25,
		},
		
		buff = true,
	}
}
ACT.onEffect = function(actionTbl, action, attacker, info)
	local trace = info.trace
	local target = trace.Entity
	
	target:addHP(100)
end
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "ambition_beam"
ACT.name = "Light of Dawn"
ACT.desc = "Focus a concentrated beam of shard light at a target."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "focuses a concentrated beam of light"
ACT.dmg = 15
ACT.dmgT = "Shard"
ACT.weaponMult = 1
ACT.accuracy = 30
ACT.CD = 2
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "ambition_shockwave"
ACT.name = "Shock & Awe"
ACT.desc = "Launch targets backwards with an unstoppable force"
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "sends out a forceful wave, pushing back those caught in its path"
ACT.dmg = 20
ACT.dmgT = "Blunt"
ACT.accuracy = 200
ACT.radius = 500
ACT.notarget = true
ACT.CD = 4
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Knockback",
		effect = "knockback",
		duration = 0,
		strength = 1,

		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "ambition_invigorate"
ACT.name = "Violent Invigoration"
ACT.desc = "Deals damage to a target but also provides them a one turn buff."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "shocks a target with invigorating violence"
ACT.CD = 4
ACT.dmg = 0
ACT.dmgT = "Electric"
ACT.weaponMult = 2
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Invigorated",
		effect = "strengthen",
		duration = 1,
		strength = 1,

		dmgB = 10,
		dmg = 10,
		
		accuracy = 10,
		armor = -50,
		
		attrib = {
			["str"] = 30,
			["accuracy"] = 30,
			["perception"] = 30,
			["stm"] = 15,
			["luck"] = -15,
		},
		
		buff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "ambition_blind"
ACT.name = "Fog of War"
ACT.desc = "Causes the target to miss their next attack."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "blinds their target with a focused light"
ACT.CD = 2
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Fog of War",
		effect = "blind",
		duration = 1,
		strength = 1,
		
		hitsAttack = 1,
		
		accuracy = -10000,
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "ambition_charge"
ACT.name = "Unstable Charge"
ACT.desc = "Charges up, increasing effectiveness of the next attack. Buff is removed when attacked"
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "gathers unstable energy"
ACT.CD = 2
ACT.selfOnly = true
ACT.notarget = true
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Unstable Charge",
		effect = "strengthen",
		duration = 2,
		strength = 1,
		
		dmgB = 30,
		dmg = 30,
		
		accuracy = 100,
		armor = -100,
		
		critC = 10,
		
		hitsAttack = 1,
		
		buff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "ambition_creation"
ACT.name = "Soldier Creation"
ACT.desc = "Creates a random abomination."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "creates an abomination"
ACT.CD = 1
ACT.summon = "nut_combat_chimera"
ACT.onSummon = function(actionTbl, attacker, info, placeholder)
	local monsters = {
		"nut_combat_chimera",
		"nut_combat_waste",
		"nut_combat_amputated",
		"nut_combat_spore",
		"nut_combat_smog",
		"nut_combat_torrent",
		"nut_combat_thrower",
		"nut_combat_thrasher",
		"nut_combat_lyingfigure",
		"nut_combat_lurker",
		"nut_combat_pendulum",
		"nut_combat_leecher",
		"nut_combat_leecher_small",
		"nut_combat_kuszo_creeper",
		"nut_combat_faceless",
		"nut_combat_demon",
	}
	
	local monster = table.Random(monsters)
	
	local summon = ents.Create(monster)
	if(IsValid(summon)) then
		summon:SetPos(hitPos)
		summon:SetCreator(client)
		summon.playerControlled = true
		summon:Spawn()
		
		local name = summon:Name()
		summon:setNetVar("name", client:Name().. "'s " ..(name or ""))
		
		summon:SetMaterial("models/props_lab/cornerunit_cloud")
		summon:SetColor(Color(255,0,0))
		
		if(client.turnData) then
			local id = client.turnData[1] or 1
			local team = client.turnData[2] or 1
		
			PLUGIN:turnAdd(id, summon, team)
		end
	end

	SafeRemoveEntity(placeholder)
end
ACTS:Register(ACT)

--Smiles
local ACT
ACT = {}
ACT.uid = "smiles_smile"
ACT.name = "Smile"
ACT.desc = "Smile at a target."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "smiles"
ACT.dmg = 0
ACT.dmgT = "Mind"
ACT.accuracy = 500
ACT.CD = 1
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Smile",
		effect = "smile",
		duration = 0,
		strength = 1,
		
		chance = 50,
		
		critF = 100,

		debuff = true,
	}
}
ACTS:Register(ACT)
local ACT
ACT = {}
ACT.uid = "smiles_smile2"
ACT.name = "Smile"
ACT.desc = "Smile at a target."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "smiles"
ACT.dmg = 0
ACT.dmgT = "Mind"
ACT.accuracy = 500
ACT.CD = 1
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Smile",
		effect = "smile",
		duration = 0,
		strength = 1,
		
		chance = 25,
		
		critF = 25,

		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "smiles_grin"
ACT.name = "Grin"
ACT.desc = "Grin at a target."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "grins"
ACT.dmg = 0
ACT.dmgT = "Mind"
ACT.accuracy = 500
ACT.CD = 3
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Grin",
		effect = "grin",
		duration = 0,
		strength = 1,
		
		accuracy = -100,

		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "smiles_frown"
ACT.name = "Frown"
ACT.desc = "Frown."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "frowns"
ACT.dmg = 100
ACT.dmgT = "Mind"
ACT.accuracy = 500
ACT.CD = 3
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Frown",
		effect = "frown",
		duration = 2,
		strength = 1,
		
		critF = 100,
		accuracy = -100,
		
		maxHP = -20,

		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "smiles_laugh"
ACT.name = "Laugh"
ACT.desc = "Laugh."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "laughs"
ACT.dmg = 50
ACT.dmgT = "Mind"
ACT.accuracy = 500
ACT.radius = 250
ACT.notarget = true
ACT.CD = 3
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "smiles_cry"
ACT.name = "Cry"
ACT.desc = "Cry."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "cries"
ACT.notarget = true
ACT.CD = 1
ACT.summon = "nut_combat_boss_smiler"
ACTS:Register(ACT)
//
--nurse
local ACT
ACT = {}
ACT.uid = "nurse_rejuvenate"
ACT.name = "Rejuvenate"
ACT.desc = "Fully heal a target."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "rejuvenates"
ACT.CD = 3
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
		target = client
	end

	target:addHP(1000)
end
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "nurse_rebuild"
ACT.name = "Rebuild"
ACT.desc = "Resurrect a corpse, give it a buff."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "rebuilds"
ACT.CD = 3
ACT.onCanAct = function(actionTbl, client, data)
	local trace = data.trace
	local target = trace.Entity

	if(IsValid(target) and target:GetClass() == "prop_ragdoll" and target.deathData) then
		local deathData = target.deathData
		local saveData = deathData.saveData
		
		local class = deathData.class
		
		local revive = ents.Create(class) --the new clone entity
		revive:SetPos(target:GetPos() + Vector(0, 0, 10)) --set its position
		revive:SetAngles(Angle(0,0,0)) --set its angles
		
		revive:Spawn() --spawn it
		revive:loadSaveData(saveData)
		
		revive:SetColor(Color(0,0,0))
		
		SafeRemoveEntity(target)
	
		return true
	end
end
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "nurse_surgery"
ACT.name = "Surgery"
ACT.desc = "Performs 'surgery' on a target."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "performs 'surgery'"
ACT.CD = 1
ACT.dmg = 50
ACT.dmgT = "Blight"
ACT.reqStats = {
	["stm"] = 1,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Surgery",
		effect = "bleed",
		duration = 3,
		strength = 1,
		
		dmgT = "Blight",
		dmg = 15,

		debuff = true,
	}
}
ACTS:Register(ACT)
--vehicle
//
local ACT
ACT = {}
ACT.uid = "vehicle_crash"
ACT.name = "Crash"
ACT.desc = "Ram through an area with a very hard to dodge attack."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "speeds through"
ACT.dmg = 100
ACT.dmgT = "Blunt"
ACT.accuracy = 50
ACT.radius = 250
ACT.notarget = true
ACT.CD = 2
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Knockback",
		effect = "knockback",
		duration = 1,
		strength = 1,
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//

local ACT
ACT = {}
ACT.uid = "memory_heal"
ACT.name = "Consume Memory"
ACT.desc = "Consume a memory rock to regain health."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "consumes a memory to regain health"
ACT.notarget = true
ACT.CD = 1
ACT.onCanAct = function(actionTbl, client, data)
	local trace = data.trace
	local target = trace.Entity

	if(IsValid(target) and target:GetClass() == "nut_combat_memory_chunk") then
		client:addHP(500)
		
		SafeRemoveEntity(target)
	
		return true
	end
end
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "memory_revenant"
ACT.name = "Summon Revenant"
ACT.desc = "Consume a memory rock to summon an ally."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "Calls forth an ally from a memory"
ACT.CD = 2
ACT.summon = "nut_combat_revenant"
ACT.onCanAct = function(actionTbl, client, data)
	local trace = data.trace
	local target = trace.Entity

	if(IsValid(target) and target:GetClass() == "nut_combat_memory_chunk") then
		SafeRemoveEntity(target)
	
		return true
	end
end
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "memory_shield"
ACT.name = "Memory Shield"
ACT.desc = "Consume a memory rock to shield yourself for 1 turn."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "Shatters a memory to create a shield"
ACT.CD = 2
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Shield",
		effect = "armor",
		duration = 1,
		strength = 1,
		
		armor = 2000,
		
		hitsLeft = 2,
		
		buff = true,
	}
}
ACT.onCanAct = function(actionTbl, client, data)
	local trace = data.trace
	local target = trace.Entity

	if(IsValid(target) and target:GetClass() == "nut_combat_memory_chunk") then
		SafeRemoveEntity(target)
	
		return true
	end
end
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "memory_summon"
ACT.name = "Memory Summon"
ACT.desc = "Summon a single memory rock."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "Surfaces a memory from the surroundings"
ACT.notarget = true
ACT.CD = 0
ACT.summon = "nut_combat_memory_chunk"
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "memory_grudge"
ACT.name = "Grudge"
ACT.desc = "Explode a memory to deal damage to everything around it."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "Detonates a memory into shards, puncturing those nearby."
ACT.CD = 2
ACT.notarget = true
ACT.radius = 200
ACT.accuracy = 200
ACT.dmg = 60
ACT.dmgT = "Time"
ACT.onCanAct = function(actionTbl, client, data)
	local trace = data.trace
	local target = trace.Entity

	if(IsValid(target) and target:GetClass() == "nut_combat_memory_chunk") then
		SafeRemoveEntity(target)
	
		return true
	end
end
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "memory_revenge"
ACT.name = "Revenge"
ACT.desc = "Debuff an enemy who has killed an ally recently."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "Enacts revenge upon a target for killing an ally."
ACT.dmg = 10
ACT.dmgT = "Time"
ACT.accuracy = 100
ACT.CD = 1
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Revenge",
		effect = "weak",
		duration = 2,
		strength = 1,
		
		attrib = {
			["end"] = -5,
			["fortitude"] = -5,
		},
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "misfortune_cataclysm"
ACT.name = "Cataclysm of Fortune"
ACT.desc = "Obliterate the luck of a target for one turn."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "Curses their target with extreme misfortune"
ACT.accuracy = 1000
ACT.CD = 1
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Misfortune",
		effect = "weak",
		duration = 1,
		strength = 1,
		
		attrib = {
			["luck"] = -100,
		},
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "misfortune_guaranteed"
ACT.name = "Guaranteed Misfortune"
ACT.desc = "Guarantee the next attack is a critical fail."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "Curses their target with a critical failure on their next attack"
ACT.accuracy = 1000
ACT.CD = 1
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Misfortune",
		effect = "weak",
		duration = 2,
		strength = 1,
		
		critF = 100,
		
		hitsLeft = 1,
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "carnage_summon"
ACT.name = "Carnage Creation"
ACT.desc = "Creates a random abomination."
ACT.category = "Boss"
ACT.hidden = true
ACT.attackString = "creates an abomination that is hostile to everything"
ACT.CD = 1
ACT.summon = "nut_combat_chimera"
ACT.onSummon = function(actionTbl, attacker, info, placeholder)
	local monsters = {
		"nut_combat_chimera",
		"nut_combat_waste",
		"nut_combat_amputated",
		"nut_combat_spore",
		"nut_combat_smog",
		"nut_combat_torrent",
		"nut_combat_thrower",
		"nut_combat_thrasher",
		"nut_combat_lyingfigure",
		"nut_combat_lurker",
		"nut_combat_pendulum",
		"nut_combat_leecher",
		"nut_combat_leecher_small",
		"nut_combat_kuszo_creeper",
		"nut_combat_faceless",
		"nut_combat_demon",
	}
	
	local monster = table.Random(monsters)
	
	local summon = ents.Create(monster)
	if(IsValid(summon)) then
		summon:SetPos(hitPos)
		summon:SetCreator(client)
		summon.playerControlled = true
		summon:Spawn()
		
		local name = summon:Name()
		summon:setNetVar("name", client:Name().. "'s " ..(name or ""))
		
		summon:SetMaterial("models/props_lab/cornerunit_cloud")
		summon:SetColor(Color(255,0,0))
		
		if(client.turnData) then
			local id = client.turnData[1] or 1
			local team = client.turnData[2] or 1
		
			PLUGIN:turnAdd(id, summon, team)
		end
	end

	SafeRemoveEntity(placeholder)
end
ACTS:Register(ACT)