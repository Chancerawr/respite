ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Grudge"
ENT.Category = "NutScript - Combat (Boss)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/violet_shuriken/violet_mk2/female_violet_mk2.mdl"
ENT.material = "models/props_lab/security_screens"
ENT.color = Color(128,0,128)

ENT.WalkAnim = "walk_all"
ENT.RunAnim = "run_all_01"

ENT.hp = 5000
ENT.armor = 200

--all attributes
ENT.attribs = {
	["stm"] = 50,
	["str"] = 25,
	["accuracy"] = 100,
	["end"] = 20,
	["luck"] = 0,
	["perception"] = 100,
	["fortitude"] = 100,
}

ENT.dmg = {
	["Time"] = 20,
}

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 25,
	["Blight"] = 25,
	["Shard"] = 25,
	["Distort"] = 25,
	
	["Time"] = 100,
	["Erasure"] = 0,
	
	["Fire"] = 0,
	["Explosion"] = -100,
	["Acid"] = 0,
	["Poison"] = 50,
	["Electric"] = 0,
	
	["Rot"] = -100,
}

ENT.actions = {
	"memory_heal",
	"memory_revenant",
	"memory_shield",
	"memory_summon",
	"memory_grudge",
	"memory_revenge",
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