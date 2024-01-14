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
ACT.dmgT = "Explosion"
ACT.weaponMult = 0
ACT.radius = 100
ACT.attackOverwrite = function(actionTbl, client, trace)
	local target = trace.Entity
	if(IsValid(target) and target.combat) then
		actionTbl.dmg = target:getHP()

		PLUGIN:attackStart(client, client, trace, actionTbl)
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
ACT.attackOverwrite = function(actionTbl, client, trace)
	local entity = trace.Entity

	if(IsValid(entity) and (entity:IsPlayer() or entity.combat)) then
		local roll = math.random(1,2)
		
		if(roll == 1) then --damage
			actionTbl.dmg = math.random(50,70)

			PLUGIN:attackStart(client, client, trace, actionTbl)
		else --heal
			entity:addHP(math.random(50,70))
			
			local chatPrint = entity:Name().. " heals " ..entity:Name().. " accidentally."
			nut.chat.send(entity, "react_npc", chatPrint)
			nut.log.addRaw(chatPrint)
		end
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
ACT.attackOverwrite = function(actionTbl, client, trace)
	if(!trace.HitPos) then return end
	
	local entity = client
	
	local clone = ents.Create(entity:GetClass()) --the new clone entity
	clone:SetPos(trace.HitPos) --set its position
	clone:SetAngles(entity:GetAngles()) --set its angles
	
	clone:Spawn() --spawn it
	
	clone:SetModel(entity:GetModel()) --set its model
	clone:SetModelScale(entity:GetModelScale()) --set its model
	clone:SetMaterial(entity:GetMaterial() or "") --set its material
	clone:SetColor(entity:GetColor() or Color(255,255,255))
	
	for k, v in pairs(entity:GetBodyGroups() or {}) do
		clone:SetBodygroup(v.id, entity:GetBodygroup(v.id))
	end
	
	clone:setNetVar("name", entity:Name()) --set its custom name
	clone:setNetVar("desc", entity:Desc()) --set its description

	clone.inv = entity.inv
	
	--set its attributes
	clone.attribs = entity.attribs
	for k, v in pairs(clone.attribs) do
		clone.attribs[k] = v * 0.6
	end
	
	--combat stats
	clone.armor = entity.armor*0.6
	
	clone:setNetVar("hp", entity:getHP()*0.5)
	clone:setNetVar("hpMax", entity:getMaxHP()*0.5)
	
	clone:setNetVar("mp", entity:getMP()*0.5)
	clone:setNetVar("mpMax", entity:getMaxMP()*0.5)
	
	clone.actions = entity.actions
	
	clone.dmg = entity.dmg
	
	for k, v in pairs(clone.dmg) do
		clone.dmg[k] = v*0.6
	end
	
	clone.res = entity:getNetVar("res")
	clone.amp = entity:getNetVar("amp")

	clone.savedWeapon = entity.savedWeapon
	
	if(entity.savedWeapon) then
		clone:EquipWeapon(entity.savedWeapon[1], entity.savedWeapon[2])
	end
	
	clone:SetCreator(client) --prop protection
	
	--sets its animation
	timer.Simple(1, function()
		if(IsValid(clone)) then
			clone:ResetSequence(entity:GetSequence())
		end
	end)
	
	local chatPrint = entity:Name().. " splits in two."
	nut.chat.send(entity, "react_npc", chatPrint)
	nut.log.addRaw(chatPrint)
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
ACT.notarget = true
ACT.selfOnly = true
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