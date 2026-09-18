ENT.Type = "anim"
ENT.Base = "nut_combat_prop"
ENT.PrintName = "Flesh Sphere"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/hunter/misc/shell2x2.mdl"
ENT.material = "models/skeleton/skeleton_bloody"

ENT.noRag = true

--all attributes
ENT.attribs = {
	["stm"] = 20,
	["str"] = 50,
	["accuracy"] = 40,
	["end"] = 50,
	["luck"] = 5,
	["perception"] = 10,
	["fortitude"] = 50,
}

ENT.dmg = {
	["Blunt"] = 35,
}

ENT.hp = 2000
ENT.armor = 250

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 15,
	["Blunt"] = 15,
	["Siege"] = 0,
	
	["Ichor"] = -25,
	["Blight"] = -50,
	["Shard"] = 100,
	["Distort"] = 0,
	["Time"] = 0,
	
	["Rot"] = -25,
	["Cold"] = -15,
	["Fire"] = -15,
	["Explosion"] = -25,
	["Acid"] = -25,
	["Poison"] = 25,
	["Electric"] = -25,
}

ENT.StepData = {
	0.25,
	0.75,
}

ENT.FootstepSounds = {
	"npc/footsteps/hardboot_generic1.wav",
	"npc/footsteps/hardboot_generic2.wav",
	"npc/footsteps/hardboot_generic3.wav",
	"npc/footsteps/hardboot_generic4.wav",
	"npc/footsteps/hardboot_generic5.wav",
	"npc/footsteps/hardboot_generic6.wav",
}