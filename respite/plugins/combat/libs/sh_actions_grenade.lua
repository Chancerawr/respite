local PLUGIN = PLUGIN

//
local ACT
ACT = {}
ACT.uid = "grenade_explosive"
ACT.name = "Explosive Grenade"
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
ACT.attackOverwrite = function(actionTbl, attacker, trace)
	local grenade = ents.Create("nut_explosivegrenade")
	grenade:SetPos(trace.HitPos)
	grenade:Spawn()

	PLUGIN:attackStart(attacker, attacker, trace, actionTbl)
end
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "grenade_bloodbomb"
ACT.name = "Blood Bomb"
ACT.desc = "Throws a blood bomb."
ACT.category = "Grenades"
ACT.attackString = "throws a blood bomb"
--ACT.CD = 0
ACT.radius = 200
ACT.notarget = true
ACT.hidden = true
ACT.itemUse = "nut_bloodbomb" --uses this item
ACT.attackOverwrite = function(actionTbl, attacker, trace)
	local grenade = ents.Create("nut_bloodbomb")
	grenade:SetPos(trace.HitPos)
	grenade:Spawn()

	PLUGIN:attackStart(attacker, attacker, trace, actionTbl)
end
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
ACT.name = "Flash Grenade"
ACT.desc = "Throws a flash grenade."
ACT.category = "Grenades"
ACT.attackString = "throws a flash grenade"
--ACT.CD = 0
ACT.radius = 300
ACT.notarget = true
ACT.hidden = true
ACT.itemUse = "nut_flashgrenade" --uses this item
ACT.attackOverwrite = function(actionTbl, attacker, trace)
	local grenade = ents.Create("nut_flashgrenade")
	grenade:SetPos(trace.HitPos)
	grenade:Spawn()

	PLUGIN:attackStart(attacker, attacker, trace, actionTbl)
end
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Blind",
		effect = "blind",
		duration = 3,
		strength = 1,
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "grenade_dark"
ACT.name = "Dark Grenade"
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
ACT.attackOverwrite = function(actionTbl, attacker, trace)
	local disc = ents.Create("prop_physics")
	disc:SetModel("models/props_phx/construct/plastic/plastic_angle_360.mdl")
	disc:SetMaterial("models/player/player_chrome1")
	disc:SetColor(Color(0,0,0))
	disc:SetPos(trace.HitPos)
	disc:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
	disc:SetModelScale(actionTbl.radius/47)
	disc:Spawn()

	local physObj = disc:GetPhysicsObject()

	if(IsValid(physObj)) then
		physObj:EnableMotion(false)
	end
	
	local grenade = ents.Create("nut_darkgrenade")
	grenade:SetPos(trace.HitPos)
	grenade:Spawn()

	PLUGIN:attackStart(attacker, attacker, trace, actionTbl)
end
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Blind",
		effect = "blind",
		duration = 3,
		strength = 1,
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "grenade_haze"
ACT.name = "Haze Grenade"
ACT.desc = "Throws a haze grenade."
ACT.category = "Grenades"
ACT.attackString = "throws a haze grenade"
--ACT.CD = 0
ACT.radius = 225
ACT.notarget = true
ACT.hidden = true
ACT.itemUse = "nut_haze" --uses this item
ACT.attackOverwrite = function(actionTbl, attacker, trace)
	local disc = ents.Create("prop_physics")
	disc:SetModel("models/props_phx/construct/plastic/plastic_angle_360.mdl")
	disc:SetMaterial("models/XQM/boxfull_diffuse")
	disc:SetPos(trace.HitPos)
	disc:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
	disc:SetModelScale(actionTbl.radius/47)
	disc:Spawn()

	local physObj = disc:GetPhysicsObject()

	if(IsValid(physObj)) then
		physObj:EnableMotion(false)
	end
	
	local grenade = ents.Create("nut_haze")
	grenade:SetPos(trace.HitPos)
	grenade:Spawn()

	PLUGIN:attackStart(attacker, attacker, trace, actionTbl)
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
ACT.uid = "grenade_molotov"
ACT.name = "Molotov Cocktail"
ACT.desc = "Throws a molotov cocktail."
ACT.category = "Grenades"
ACT.attackString = "throws a molotov"
--ACT.CD = 0
ACT.radius = 175
ACT.notarget = true
ACT.hidden = true
ACT.itemUse = "molotov" --uses this item
ACT.attackOverwrite = function(actionTbl, attacker, trace)
	local disc = ents.Create("prop_physics")
	disc:SetModel("models/props_phx/construct/plastic/plastic_angle_360.mdl")
	disc:SetMaterial("models/effects/splode1_sheet")
	disc:SetPos(trace.HitPos)
	disc:SetCollisionGroup(COLLISION_GROUP_WORLD)
	disc:SetModelScale(actionTbl.radius/47)
	disc:Spawn()

	local physObj = disc:GetPhysicsObject()

	if(IsValid(physObj)) then
		physObj:EnableMotion(false)
	end
	
	local grenade = ents.Create("nut_molotov")
	grenade:SetPos(trace.HitPos)
	grenade:Spawn()

	PLUGIN:attackStart(attacker, attacker, trace, actionTbl)
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
ACT.uid = "grenade_nail"
ACT.name = "Nail Bomb"
ACT.desc = "Throws a nail bomb."
ACT.category = "Grenades"
ACT.attackString = "throws a nail bomb"
--ACT.CD = 0
ACT.radius = 175
ACT.notarget = true
ACT.hidden = true
ACT.itemUse = "tfa_nailbomb" --uses this item
ACT.attackOverwrite = function(actionTbl, attacker, trace)
	local grenade = ents.Create("nut_nailbomb")
	grenade:SetPos(trace.HitPos)
	grenade:Spawn()

	PLUGIN:attackStart(attacker, attacker, trace, actionTbl)
end
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
ACT.name = "Smoke Grenade"
ACT.desc = "Throws a smoke grenade."
ACT.category = "Grenades"
ACT.attackString = "throws a smoke grenade"
--ACT.CD = 0
ACT.radius = 250
ACT.notarget = true
ACT.hidden = true
ACT.itemUse = "nut_smokegrenade" --uses this item
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
	
	local grenade = ents.Create("nut_smokegrenade")
	grenade:SetPos(trace.HitPos)
	grenade:Spawn()

	PLUGIN:attackStart(attacker, attacker, trace, actionTbl)
end
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "grenade_teargas"
ACT.name = "Tear Gas Grenade"
ACT.desc = "Throws a tear gas grenade."
ACT.category = "Grenades"
ACT.attackString = "throws a tear gas grenade"
--ACT.CD = 0
ACT.radius = 250
ACT.notarget = true
ACT.hidden = true
ACT.itemUse = "nut_teargas" --uses this item
ACT.attackOverwrite = function(actionTbl, attacker, trace)
	local disc = ents.Create("prop_physics")
	disc:SetModel("models/props_phx/construct/plastic/plastic_angle_360.mdl")
	disc:SetMaterial("phoenix_storms/Fender_wood")
	disc:SetPos(trace.HitPos)
	disc:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
	disc:SetModelScale(actionTbl.radius/47)
	disc:Spawn()

	local physObj = disc:GetPhysicsObject()

	if(IsValid(physObj)) then
		physObj:EnableMotion(false)
	end
	
	local grenade = ents.Create("nut_teargas")
	grenade:SetPos(trace.HitPos)
	grenade:Spawn()

	PLUGIN:attackStart(attacker, attacker, trace, actionTbl)
end
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Blind",
		effect = "blind",
		duration = 3,
		strength = 1,
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "grenade_yinyang"
ACT.name = "Yin Yang Grenade"
ACT.desc = "Throws a yin yang grenade."
ACT.category = "Grenades"
ACT.attackString = "throws a yin yang grenade"
--ACT.CD = 0
ACT.radius = 250
ACT.notarget = true
ACT.hidden = true
ACT.itemUse = "tfa_yinyang" --uses this item
ACT.attackOverwrite = function(actionTbl, attacker, trace)
	local grenade = ents.Create("nut_yinyang")
	grenade:SetPos(trace.HitPos)
	grenade:Spawn()

	PLUGIN:attackStart(attacker, attacker, trace, actionTbl)
end
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
ACT.name = "Distortion Bomb"
ACT.desc = "Throws a distortion bomb."
ACT.category = "Grenades"
ACT.attackString = "throws a distortion bomb"
ACT.dmg = 75
ACT.dmgT = "Explosive"
--ACT.CD = 0
ACT.radius = 100
ACT.notarget = true
ACT.hidden = true
ACT.itemUse = "portal_explosives" --uses this item
ACTS:Register(ACT)