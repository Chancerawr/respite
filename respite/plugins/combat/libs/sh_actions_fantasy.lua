local PLUGIN = PLUGIN

//
local ACT
ACT = {}
ACT.uid = "fire_bolt"
ACT.name = "Fire Bolt"
ACT.desc = "Launch a fire bolt."
ACT.category = "Fantasy"
ACT.hidden = true
ACT.attackString = "launches a fire bolt"
ACT.CD = 1
ACT.dmg = 0
ACT.dmgT = "Fire"
ACT.weaponMult = 0.25
ACT.mult = {
	["fortitude"] = 1,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Burning",
		effect = "dot",
		duration = 2,
		strength = 1,
		
		dmg = 10,
		dmgT = "Fire",
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "fire_incinerate"
ACT.name = "Incinerate"
ACT.desc = "Incinerate a target, setting them on fire."
ACT.category = "Fantasy"
ACT.hidden = true
ACT.attackString = "incinerates their target"
ACT.CD = 3
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Burning",
		effect = "dot",
		duration = 5,
		strength = 1,
		
		dmg = 10,
		dmgT = "Fire",
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "fire_inferno"
ACT.name = "Inferno"
ACT.desc = "Create a wall of flames."
ACT.category = "Fantasy"
ACT.hidden = true
ACT.attackString = "creates a wall of flames"
ACT.CD = 10
ACT.radius = 100
ACT.notarget = true
ACT.dmg = 0
ACT.dmgT = "Fire"
ACT.weaponMult = 0.25
ACT.mult = {
	["fortitude"] = 1.5,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Burning",
		effect = "dot",
		duration = 2,
		strength = 1,
		
		dmg = 10,
		dmgT = "Fire",
		
		debuff = true,
	}
}
ACT.summon = "nut_combat_aoe_wall"
ACT.onSummon = function(actionTbl, attacker, info, summon)
	summon:SetMaterial("models/effects/splode1_sheet")
	summon:SetModelScale(actionTbl.radius/100)
	summon:SetCollisionGroup(COLLISION_GROUP_DEBRIS_TRIGGER)
	summon.actions = { "fire_inferno_burn" }
	
	summon:setNetVar("name", "Inferno Wall")
	
	local physObj = summon:GetPhysicsObject()
	if(IsValid(physObj)) then
		physObj:EnableMotion(false)
	end
end
ACTS:Register(ACT)
//

local ACT
ACT = {}
ACT.uid = "fire_inferno_burn"
ACT.name = "Inferno"
ACT.desc = "Burn a target that touches the fire wall."
ACT.category = "Fantasy"
ACT.hidden = true
ACT.attackString = "burns a target standing on it"
ACT.CD = 0
ACT.dmg = 15
ACT.dmgT = "Fire"
ACT.mult = {
	["fortitude"] = 1.5,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Burning",
		effect = "dot",
		duration = 2,
		strength = 1,
		
		dmg = 10,
		dmgT = "Fire",
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "fire_ball"
ACT.name = "Fire Ball"
ACT.desc = "Launch a fire ball."
ACT.category = "Fantasy"
ACT.hidden = true
ACT.attackString = "launches a fire ball"
ACT.CD = 1
ACT.radius = 100
ACT.notarget = true
ACT.dmg = 0
ACT.dmgT = "Fire"
ACT.weaponMult = 0.25
ACT.mult = {
	["fortitude"] = 1,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Burning",
		effect = "dot",
		duration = 2,
		strength = 1,
		
		dmg = 10,
		dmgT = "Fire",
		
		debuff = true,
	}
}
ACTS:Register(ACT)

//
local ACT
ACT = {}
ACT.uid = "water_heal"
ACT.name = "Soothing Waters"
ACT.desc = "Heal a target with soothing waters."
ACT.category = "Fantasy"
ACT.hidden = true
ACT.attackString = "uses magic infused water to heal a target"
ACT.CD = 1
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

	target:addHP(40)
end
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "frost_bolt"
ACT.name = "Frost Bolt"
ACT.desc = "Launch a frost bolt."
ACT.category = "Fantasy"
ACT.hidden = true
ACT.attackString = "launches a frost bolt"
ACT.CD = 1
ACT.dmg = 0
ACT.dmgT = "Cold"
ACT.weaponMult = 0.25
ACT.mult = {
	["fortitude"] = 1,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Chilled",
		effect = "slow",
		duration = 3,
		strength = 1,
		
		attrib = {
			["stm"] = -10
		},
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "frost_freeze"
ACT.name = "Immobilizing Frost"
ACT.desc = "Freeze a target's legs to the floor."
ACT.category = "Fantasy"
ACT.hidden = true
ACT.attackString = "freezes a target's legs to the ground"
ACT.CD = 8
ACT.dmg = 20
ACT.dmgT = "Cold"
ACT.mult = {
	["fortitude"] = 0.5,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Frozen",
		effect = "slow",
		duration = 2,
		strength = 1,
		
		evasion = -100,
		
		debuff = true,
	}
}
ACTS:Register(ACT)

//
local ACT
ACT = {}
ACT.uid = "lightning_bolt"
ACT.name = "Lightning Bolt"
ACT.desc = "Launch a lightning bolt."
ACT.category = "Fantasy"
ACT.hidden = true
ACT.attackString = "launches a lightning bolt"
ACT.CD = 1
ACT.dmg = 0
ACT.dmgT = "Electric"
ACT.weaponMult = 0.25
ACT.mult = {
	["fortitude"] = 1,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Shocked",
		effect = "slow",
		duration = 2,
		strength = 1,
		
		accuracy = -25,
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "lightning_chain"
ACT.name = "Chain Lightning"
ACT.desc = "A lightning that chains."
ACT.category = "Fantasy"
ACT.hidden = true
ACT.attackString = "casts chain lightning"
ACT.CD = 1
ACT.dmg = 0
ACT.dmgT = "Electric"
ACT.weaponMult = 0.25
ACT.mult = {
	["fortitude"] = 1,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Shocked",
		effect = "slow",
		duration = 2,
		strength = 1,
		
		accuracy = -25,
		
		debuff = true,
	}
}
ACT.onGetTargets = function(actionTbl, attacker, info)
	local trace = info.trace
	local entity = trace.Entity
	
	local targets = {entity}
	
	if(IsValid(entity)) then
		local pos = entity:GetPos()
		
		local nearest
		local dist = math.huge
		for k, v in pairs(ents.FindInSphere(pos, 300)) do
			if(!v.combat and !v:IsPlayer()) then continue end
			if(v == entity) then continue end --ignore self
			if(v:GetMoveType() == MOVETYPE_NOCLIP) then continue end --ignore noclipped admins
			
			if(dist > pos:DistToSqr(v:GetPos())) then
				nearest = v
			end
		end
		
		targets[#targets+1] = nearest
	end
	
	return targets
end
ACTS:Register(ACT)

//
local ACT
ACT = {}
ACT.uid = "poison_bolt"
ACT.name = "Poison Bolt"
ACT.desc = "Launch a poison bolt."
ACT.category = "Fantasy"
ACT.hidden = true
ACT.attackString = "launches a poison bolt"
ACT.CD = 1
ACT.dmg = 0
ACT.dmgT = "Poison"
ACT.weaponMult = 0.25
ACT.mult = {
	["fortitude"] = 1,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Poisoned",
		effect = "dot",
		duration = 3,
		strength = 1,
		
		dmg = 10,
		dmgT = "Poison",
		
		debuff = true,
	}
}
ACTS:Register(ACT)

//
local ACT
ACT = {}
ACT.uid = "dark_bolt"
ACT.name = "Dark Bolt"
ACT.desc = "Launch a dark bolt."
ACT.category = "Fantasy"
ACT.hidden = true
ACT.attackString = "launches a bolt of darkness"
ACT.CD = 1
ACT.dmg = 0
ACT.dmgT = "Rot"
ACT.weaponMult = 0.25
ACT.mult = {
	["fortitude"] = 1,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Rotting",
		effect = "dot",
		duration = 5,
		strength = 1,
		
		dmg = 5,
		dmgT = "Rot",
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "dark_raise"
ACT.name = "Raise Dead"
ACT.desc = "Summon a skeleton from a corpse."
ACT.category = "Fantasy"
ACT.hidden = true
ACT.attackString = "summons a skeleton from a corpse"
ACT.CD = 2
ACT.summon = "nut_fantasy_skeleton"
ACT.notarget = true
ACT.onCanAct = function(actionTbl, client, data)
	local trace = data.trace
	local target = trace.Entity

	if(IsValid(target) and target:GetClass() == "prop_ragdoll") then
		SafeRemoveEntity(target)
	
		return true
	end
end
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "dark_void"
ACT.name = "Void"
ACT.desc = "Summon a dark void to deal damage in an area."
ACT.category = "Fantasy"
ACT.hidden = true
ACT.attackString = "Calls forth a void of dark energy in an area"
ACT.CD = 3
ACT.radius = 100
ACT.notarget = true
ACT.dmg = 0
ACT.dmgT = "Rot"
ACT.weaponMult = 0.25
ACT.mult = {
	["fortitude"] = 1.5,
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "dark_weak"
ACT.name = "Curse of Weakness"
ACT.desc = "Lowers a targets strength by 15, weakening them."
ACT.category = "Fantasy"
ACT.hidden = true
ACT.attackString = "curses a target with a weakening darkness"
ACT.CD = 5
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Weaken",
		effect = "weak",
		duration = 4,
		strength = 1,
		
		attrib = {
			["str"] = -15,
		},

		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "dark_silence"
ACT.name = "Curse of Silence"
ACT.desc = "Prevents a target from being able to speak."
ACT.category = "Fantasy"
ACT.hidden = true
ACT.attackString = "silences a target, preventing them from speaking"
ACT.CD = 5
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Silence",
		effect = "silence",
		duration = 4,
		strength = 1,

		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "dark_sleep"
ACT.name = "Sleep"
ACT.desc = "Puts a target to sleep for 3 turns, if they are damaged while asleep, they will wake up. Target gains immunity to sleep for the rest of the combat."
ACT.category = "Fantasy"
ACT.hidden = true
ACT.attackString = "puts a target to sleep"
ACT.CD = 5
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Sleep",
		effect = "sleep",
		duration = 3,
		strength = 1,

		debuff = true,
	},
	[2] = {
		uid = ACT.uid,
		
		name = "Sleep Resistance",
		effect = "resist",
		duration = 20,
		strength = 1,
		
		res = {
			["sleep"] = 100,
		},

		debuff = true,
	},
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "wind_blade"
ACT.name = "Wind Blade"
ACT.desc = "Launch a slice of wind."
ACT.category = "Fantasy"
ACT.hidden = true
ACT.attackString = "launches a compressed slash of wind"
ACT.CD = 1
ACT.dmg = 0
ACT.dmgT = "Slash"
ACT.weaponMult = 1
ACT.mult = {
	["fortitude"] = 1,
}
ACTS:Register(ACT)

//
local ACT
ACT = {}
ACT.uid = "earth_fist"
ACT.name = "Earthen Fist"
ACT.desc = "Surround your fist with earth and punch a target."
ACT.category = "Fantasy"
ACT.hidden = true
ACT.attackString = "covers their fist in rock, and punches a target"
ACT.CD = 1
ACT.dmg = 0
ACT.dmgT = "Blunt"
ACT.weaponMult = 1
ACT.mult = {
	["str"] = 1,
	["fortitude"] = 0.5,
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "earth_impale"
ACT.name = "Earth Spike"
ACT.desc = "Impale a foe with a pillar from below them."
ACT.category = "Fantasy"
ACT.hidden = true
ACT.attackString = "attacks their target with an earth spike from below"
ACT.CD = 1
ACT.dmg = 0
ACT.dmgT = "Pierce"
ACT.mult = {
	["str"] = 1,
	["fortitude"] = 0.5,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Bleed",
		effect = "bleed",
		duration = 2,
		strength = 1,
		
		dmg = 10,
		dmgT = "Pierce",
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "earth_golem"
ACT.name = "Wood Golem"
ACT.desc = "Summon a wooden golem from a pile of wood."
ACT.category = "Fantasy"
ACT.hidden = true
ACT.attackString = "summons a wooden golem"
ACT.CD = 2
ACT.summon = "nut_combat_woodsman"
ACT.notarget = true
ACT.onCanAct = function(actionTbl, client, data)
	local trace = data.trace
	local target = trace.Entity

	if(IsValid(target) and target:GetClass() == "nut_item") then
		local itemTable = target:getItemTable()
		if(itemTable and itemTable.uniqueID == "j_scrap_wood") then
			SafeRemoveEntity(target)
			
			return true
		end
	end
end
ACTS:Register(ACT)

//
local ACT
ACT = {}
ACT.uid = "light_blind"
ACT.name = "Blinding Light"
ACT.desc = "Blind a target with focused light."
ACT.category = "Fantasy"
ACT.hidden = true
ACT.attackString = "blinds a target with focused light"
ACT.CD = 4
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Blind",
		effect = "blind",
		duration = 2,
		strength = 1,
		
		critC = -1,
		accuracy = -40,

		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "light_heal"
ACT.name = "Healing Light"
ACT.desc = "Cast a healing light."
ACT.category = "Fantasy"
ACT.hidden = true
ACT.attackString = "uses the light of the heavens to heal an ally"
ACT.CD = 1
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

	local health = target:getMaxHP()

	target:addHP(health*0.1)
end
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "light_seraphim"
ACT.name = "Seraphim's Light"
ACT.desc = "Cast an incredibly powerful healing spell."
ACT.category = "Fantasy"
ACT.hidden = true
ACT.attackString = "calls down the light of the seraphim to bolster an ally"
ACT.CD = 10
ACT.onEffect = function(actionTbl, action, attacker, info)
	local trace = info.trace
	local target = trace.Entity
	local client = info.client
	
	if(client.KeyDown and client:KeyDown(IN_WALK)) then --self targetting
		target = client
	end

	local maxHP = target:getMaxHP()

	target:addHP(maxHP)
end
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Seraphim's Light",
		effect = "armor",
		duration = 4,
		strength = 1,
		
		armor = 300,
		maxHP = 100,
		
		buff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "twist_basic"
ACT.name = "Twist"
ACT.desc = "Twist an area in time."
ACT.category = "Fantasy"
ACT.hidden = true
ACT.attackString = "ʇʍᴉsʇs a sdɐɔǝ in time, ɔouʇoɹʇᴉuƃ ʇɥosǝ within"
ACT.CD = 1
ACT.radius = 100
ACT.notarget = true
ACT.dmg = 0
ACT.dmgT = "Time"
ACT.weaponMult = 0.5
ACTS:Register(ACT)