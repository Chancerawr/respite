ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Crustacean"
ENT.Category = "NutScript - Combat (Drone)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/synth.mdl"
ENT.material = "models/zombie_fast/fast_zombie_sheet"

ENT.IdleAnim = "Idle"
ENT.RunAnim = "Walk01"

ENT.BloodColor = BLOOD_COLOR_MECH

--all attributes
ENT.attribs = {
	["stm"] = 10,
	["str"] = 50,
	["accuracy"] = 25,
	["end"] = 50,
	["luck"] = 0,
	["perception"] = 10,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Blunt"] = 25,
}

ENT.hp = 2000
ENT.armor = 400

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

ENT.actions = {
	"drone_missile",
	"drone_bone_barrage",
}