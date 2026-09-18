ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Soul of the Forest"
ENT.Category = "NutScript - Combat (Weird)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/subtact/ceres_faunacasual/faunacasual_pm.mdl"

ENT.hp = 2000
ENT.armor = 100

--all attributes
ENT.attribs = {
	["stm"] = 20,
	["str"] = 30,
	["accuracy"] = 30,
	["end"] = 20,
	["luck"] = 15,
	["perception"] = 30,
	["fortitude"] = 50,
}

ENT.dmg = {
	["Fire"] = 30,
}

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = -25,
	["Blight"] = -25,
	["Shard"] = 50,
	["Distort"] = 25,
	
	["Time"] = 50,
	["Erasure"] = -25,
	
	["Fire"] = -25,
	["Explosion"] = -25,
	["Acid"] = 0,
	["Poison"] = 25,
	["Electric"] = 10,
}

ENT.actions = {
	"forest_fire",
	"forest_heal",
	"forest_song",
	"forest_root",
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