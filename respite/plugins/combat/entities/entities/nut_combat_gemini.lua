ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Gemini"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.NPCReference = "resp_gemini"

ENT.model = "models/zombie/gemini.mdl"

ENT.AttackAnim = "Bite"
ENT.WalkAnim = "Walk"
ENT.RunAnim = "Run"

--all attributes
ENT.attribs = {
	["stm"] = 15,
	["str"] = 20,
	["accuracy"] = 15,
	["end"] = 15,
	["luck"] = 10,
	["perception"] = 20,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Blunt"] = 25,
}

ENT.hp = 300
ENT.armor = 100

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 0,
	["Blight"] = -50,
	["Shard"] = 100,
	["Distort"] = 0,
	
	["Fire"] = 25,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 0,
	["Electric"] = 0,
}

ENT.actions = {
	"flail",
}

ENT.StepData = {
	0,
	0.25,
	0.75,
	0.5,
}

ENT.StepPitch = {65,75}
ENT.FootstepSounds = {
	"footsteps/medium_concrete_1.mp3",
	"footsteps/medium_concrete_2.mp3",
	"footsteps/medium_concrete_3.mp3",
	"footsteps/medium_concrete_4.mp3",
	"footsteps/medium_concrete_5.mp3",
	"footsteps/medium_concrete_6.mp3",
	"footsteps/medium_concrete_7.mp3",
}