local PLUGIN = PLUGIN

//
local ACT
ACT = {}
ACT.uid = "grenade_explosive"
ACT.name = "Explosive"
ACT.desc = "Throws an explosive grenade."
ACT.category = "Grenades"
ACT.attackString = "throws an explosive grenade"
--ACT.CD = 0
ACT.radius = 150
ACT.notarget = true
ACT.dmg = 75
ACT.dmgT = "Explosive"
ACT.hidden = true
ACT.itemUse = "nut_explosivegrenade" --uses this item
ACT.summon = "nut_explosivegrenade"
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "grenade_bloodbomb"
ACT.name = "Blood"
ACT.desc = "Throws a blood bomb."
ACT.category = "Grenades"
ACT.attackString = "throws a blood bomb"
--ACT.CD = 0
ACT.radius = 200
ACT.notarget = true
ACT.hidden = true
ACT.itemUse = "nut_bloodbomb" --uses this item
ACT.summon = "nut_bloodbomb"
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Bloodied",
		effect = "taunt",
		duration = 3,
		strength = 1,
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "grenade_flash"
ACT.name = "Flash"
ACT.desc = "Throws a flash grenade."
ACT.category = "Grenades"
ACT.attackString = "throws a flash grenade"
--ACT.CD = 0
ACT.radius = 300
ACT.notarget = true
ACT.hidden = true
ACT.itemUse = "nut_flashgrenade" --uses this item
ACT.summon = "nut_flashgrenade"
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Blind",
		effect = "blind",
		duration = 3,
		strength = 1,
		
		accuracy = -250,
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "grenade_dark"
ACT.name = "Darkness"
ACT.desc = "Throws a dark grenade."
ACT.category = "Grenades"
ACT.attackString = "throws a dark grenade"
--ACT.CD = 0
ACT.radius = 225
ACT.dmg = 50
ACT.dmgT = "Blight"
ACT.notarget = true
ACT.hidden = true
ACT.itemUse = "nut_darkgrenade" --uses this item
ACT.summon = "nut_combat_aoe_circle"
ACT.onSummon = function(actionTbl, attacker, info, summon)
	summon:SetMaterial("models/player/player_chrome1")
	summon:SetModelScale(actionTbl.radius/47)
	summon:SetCollisionGroup(COLLISION_GROUP_DEBRIS_TRIGGER)
	summon.actions = { "darkgrenade_blind" }

	local physObj = summon:GetPhysicsObject()
	if(IsValid(physObj)) then
		physObj:EnableMotion(false)
	end
	
	local trace = info.trace
	local grenade = ents.Create("nut_darkgrenade")
	grenade:SetPos(trace.HitPos)
	grenade:Spawn()
end
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Blind",
		effect = "blind",
		duration = 3,
		strength = 1,
		
		accuracy = -250,
		evasion = -50,
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "grenade_haze"
ACT.name = "Haze Cloud"
ACT.desc = "Throws a haze grenade."
ACT.category = "Grenades"
ACT.attackString = "throws a haze grenade"
--ACT.CD = 0
ACT.radius = 225
ACT.notarget = true
ACT.hidden = true
ACT.itemUse = "nut_haze" --uses this item
ACT.summon = "nut_combat_aoe_circle"
ACT.onSummon = function(actionTbl, attacker, info, summon)
	summon:SetMaterial("models/XQM/boxfull_diffuse")
	summon:SetModelScale(actionTbl.radius/47)
	summon:SetCollisionGroup(COLLISION_GROUP_DEBRIS_TRIGGER)
	summon.actions = { "haze_hallucinate" }

	local physObj = summon:GetPhysicsObject()
	if(IsValid(physObj)) then
		physObj:EnableMotion(false)
	end
	
	local trace = info.trace
	local grenade = ents.Create("nut_haze")
	grenade:SetPos(trace.HitPos)
	grenade:Spawn()
end
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Confusion",
		effect = "mind",
		duration = 3,
		strength = 1,
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "haze_hallucinate"
ACT.name = "Hallucinate"
ACT.desc = "Use on people who are standing in a blue haze cloud."
ACT.category = "Grenades"
ACT.attackString = "confuses"
ACT.hidden = true
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Confusion",
		effect = "mind",
		duration = 3,
		strength = 1,

		accuracy = -75,
		evasion = -75,

		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "grenade_molotov"
ACT.name = "Fire"
ACT.desc = "Throws a molotov cocktail."
ACT.category = "Grenades"
ACT.attackString = "throws a molotov"
--ACT.CD = 0
ACT.radius = 175
ACT.notarget = true
ACT.hidden = true
ACT.itemUse = "molotov" --uses this item
ACT.summon = "nut_combat_aoe_circle"
ACT.onSummon = function(actionTbl, attacker, info, summon)
	summon:SetMaterial("models/effects/splode1_sheet")
	summon:SetModelScale(actionTbl.radius/47)
	summon:SetCollisionGroup(COLLISION_GROUP_DEBRIS_TRIGGER)
	summon.actions = { "molotov_burn" }

	local physObj = summon:GetPhysicsObject()
	if(IsValid(physObj)) then
		physObj:EnableMotion(false)
	end
	
	local trace = info.trace
	local grenade = ents.Create("nut_molotov")
	grenade:SetPos(trace.HitPos)
	grenade:Spawn()
end
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
ACT.uid = "molotov_burn"
ACT.name = "Burn"
ACT.desc = "Use on people who are standing in the molotov cocktail."
ACT.category = "Grenades"
ACT.attackString = "burns"
ACT.hidden = true
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
ACT.uid = "grenade_nail"
ACT.name = "Shrapnel"
ACT.desc = "Throws a nail bomb."
ACT.category = "Grenades"
ACT.attackString = "throws a nail bomb"
--ACT.CD = 0
ACT.radius = 175
ACT.notarget = true
ACT.hidden = true
ACT.itemUse = "tfa_nailbomb" --uses this item
ACT.summon = "tfa_nailbomb"
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Bleeding",
		effect = "bleed",
		duration = 4,
		strength = 1,
		
		dmg = 12,
		dmgT = "Pierce",
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "grenade_smoke"
ACT.name = "Smoke Cloud"
ACT.desc = "Throws a smoke grenade."
ACT.category = "Grenades"
ACT.attackString = "throws a smoke grenade"
--ACT.CD = 0
ACT.radius = 250
ACT.notarget = true
ACT.hidden = true
ACT.itemUse = "nut_smokegrenade" --uses this item
ACT.summon = "nut_combat_aoe_circle"
ACT.onSummon = function(actionTbl, attacker, info, summon)
	summon:SetMaterial("phoenix_storms/Fender_wood")
	summon:SetModelScale(actionTbl.radius/47)
	summon:SetCollisionGroup(COLLISION_GROUP_DEBRIS_TRIGGER)
	summon.actions = { "smoke_blind" }

	local physObj = summon:GetPhysicsObject()
	if(IsValid(physObj)) then
		physObj:EnableMotion(false)
	end
	
	local trace = info.trace
	local grenade = ents.Create("nut_smokegrenade")
	grenade:SetPos(trace.HitPos)
	grenade:Spawn()
end
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "smoke_blind"
ACT.name = "Smokescreen"
ACT.desc = "Use on people who are standing in a smokecloud."
ACT.category = "Grenades"
ACT.attackString = "blinds"
ACT.hidden = true
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Smokescreen",
		effect = "blind",
		duration = 1,
		strength = 1,

		evasion = 100,
		accuracy = -100,

		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "grenade_teargas"
ACT.name = "Tear Gas Cloud"
ACT.desc = "Throws a tear gas grenade."
ACT.category = "Grenades"
ACT.attackString = "throws a tear gas grenade"
--ACT.CD = 0
ACT.radius = 250
ACT.notarget = true
ACT.hidden = true
ACT.itemUse = "nut_teargas" --uses this item
ACT.summon = "nut_combat_aoe_circle"
ACT.onSummon = function(actionTbl, attacker, info, summon)
	summon:SetMaterial("phoenix_storms/Fender_wood")
	summon:SetModelScale(actionTbl.radius/47)
	summon:SetCollisionGroup(COLLISION_GROUP_DEBRIS_TRIGGER)
	summon.actions = { "teargas_blind" }

	local physObj = summon:GetPhysicsObject()
	if(IsValid(physObj)) then
		physObj:EnableMotion(false)
	end
	
	local trace = info.trace
	local grenade = ents.Create("nut_teargas")
	grenade:SetPos(trace.HitPos)
	grenade:Spawn()
end
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Tear Gas",
		effect = "blind",
		duration = 3,
		strength = 1,
		
		accuracy = -150,
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "teargas_blind"
ACT.name = "Tear Gas"
ACT.desc = "Use on people who are standing in a tear gas cloud."
ACT.category = "Grenades"
ACT.attackString = "blinds"
ACT.hidden = true
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Tear Gas",
		effect = "blind",
		duration = 3,
		strength = 1,

		accuracy = -150,

		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "grenade_yinyang"
ACT.name = "Discombobulate"
ACT.desc = "Throws a yin yang grenade."
ACT.category = "Grenades"
ACT.attackString = "throws a yin yang grenade"
--ACT.CD = 0
ACT.radius = 250
ACT.notarget = true
ACT.hidden = true
ACT.itemUse = "tfa_yinyang" --uses this item
ACT.summon = "tfa_yinyang"
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
ACT.uid = "grenade_distortion"
ACT.name = "Evisceration"
ACT.desc = "Throws a distortion bomb."
ACT.category = "Grenades"
ACT.attackString = "throws a distortion bomb"
ACT.dmg = 100
ACT.dmgT = "Distortion"
--ACT.CD = 0
ACT.radius = 100
ACT.notarget = true
ACT.hidden = true
ACT.itemUse = "portal_explosives" --uses this item
ACTS:Register(ACT)