ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Melded Arachnid"
ENT.Category = "NutScript - Combat (Drone)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.NPCReference = "resp_chimera"

ENT.model = "models/ninja/signalvariance/monsters/chimera.mdl"
ENT.material = "models/props_pipes/destroyedpipes01a"

ENT.AttackAnim = "Attack1"

ENT.BloodColor = BLOOD_COLOR_MECH

--all attributes
ENT.attribs = {
	["stm"] = 12,
	["str"] = 12,
	["accuracy"] = 12,
	["end"] = 15,
	["luck"] = 5,
	["perception"] = 10,
	["fortitude"] = 5,
}

ENT.dmg = {
	["Blunt"] = 12,
	["Slash"] = 12,
}

ENT.actions = {
	"smack",
	"slash",
	"stab",
}

ENT.hp = 300
ENT.armor = 250

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

ENT.StepData = {
	0.05,
	0.45,
	0.55,
	0.95,
}

ENT.FootstepSounds = {
	"footsteps/medium_concrete_1.mp3",
	"footsteps/medium_concrete_2.mp3",
	"footsteps/medium_concrete_3.mp3",
	"footsteps/medium_concrete_4.mp3",
	"footsteps/medium_concrete_5.mp3",
	"footsteps/medium_concrete_6.mp3",
	"footsteps/medium_concrete_7.mp3",
}