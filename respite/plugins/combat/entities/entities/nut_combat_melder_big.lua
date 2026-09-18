ENT.Type = "anim"
ENT.Base = "nut_combat_prop"
ENT.PrintName = "Arm of the Melder"
ENT.Category = "NutScript - Combat (Drone)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/shield_scanner.mdl"
ENT.material = "models/skeleton/skeleton_bloody"
ENT.modelScale = 5

ENT.IdleAnim = "Idle"

ENT.PropHeight = 50

--all attributes
ENT.attribs = {
	["stm"] = 20,
	["str"] = 60,
	["accuracy"] = 15,
	["end"] = 40,
	["luck"] = 2,
	["perception"] = 15,
	["fortitude"] = 25,
}

ENT.dmg = {
	["Pierce"] = 25,
	["Acid"] = 15,
}

ENT.hp = 1500
ENT.armor = 500

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

ENT.actions = {
	"repair_meld",
}

ENT.actionsAI = {
}