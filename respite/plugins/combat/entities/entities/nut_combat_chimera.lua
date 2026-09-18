ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Chimera"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.NPCReference = "resp_chimera"

ENT.model = "models/ninja/signalvariance/monsters/chimera.mdl"

ENT.AttackAnim = "Attack1"

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
	["Blunt"] = 5,
	["Slash"] = 5,
}

ENT.actions = {
	"smack",
	"slash",
	"stab",
}

ENT.hp = 300
ENT.armor = 150

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 0,
	["Blight"] = -50,
	["Shard"] = 100,
	["Distort"] = 0,
	
	["Fire"] = 0,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 0,
	["Electric"] = 0,
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