ENT.Type = "anim"
ENT.Base = "nut_combat_prop"
ENT.PrintName = "Flesh Melder"
ENT.Category = "NutScript - Combat (Drone)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/shield_scanner.mdl"
ENT.material = "models/skeleton/skeleton_bloody"

ENT.IdleAnim = "Idle"

--all attributes
ENT.attribs = {
	["stm"] = 20,
	["str"] = 40,
	["accuracy"] = 15,
	["end"] = 35,
	["luck"] = 2,
	["perception"] = 15,
	["fortitude"] = 50,
}

ENT.dmg = {
	["Pierce"] = 15,
	["Acid"] = 15,
}

ENT.hp = 300
ENT.armor = 100

ENT.res = {
	["Pierce"] = 20,
	["Slash"] = 20,
	["Blunt"] = -15,
	["Siege"] = 0,
	
	["Ichor"] = -15,
	["Blight"] = -50,
	["Shard"] = 100,
	["Distort"] = 0,
	["Time"] = 10,
	
	["Rot"] = -25,
	["Cold"] = 0,
	["Fire"] = 0,
	["Explosion"] = -25,
	["Acid"] = 0,
	["Poison"] = 50,
	["Electric"] = 0,
}