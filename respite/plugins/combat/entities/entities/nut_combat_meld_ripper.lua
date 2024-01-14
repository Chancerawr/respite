ENT.Type = "anim"
ENT.Base = "nut_combat_prop"
ENT.PrintName = "Melded Lacerator"
ENT.Category = "NutScript - Combat (Drone)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/manhack.mdl"
ENT.material = "models/skeleton/skeleton_bloody"

ENT.IdleAnim = "Fly"

--all attributes
ENT.attribs = {
	["stm"] = 30,
	["str"] = 0,
	["accuracy"] = 15,
	["end"] = 0,
	["luck"] = 5,
	["perception"] = 15,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Slash"] = 25,
}

ENT.hp = 75
ENT.armor = 25

ENT.res = {
	["Pierce"] = 10,
	["Slash"] = 10,
	["Blunt"] = -15,
	["Siege"] = 0,
	
	["Ichor"] = -15,
	["Blight"] = -50,
	["Shard"] = 100,
	["Distort"] = 0,
	["Time"] = 10,
	
	["Rot"] = -25,
	["Cold"] = -15,
	["Fire"] = -15,
	["Explosion"] = -15,
	["Acid"] = 0,
	["Poison"] = 25,
	["Electric"] = -15,
}