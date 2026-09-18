ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Gemini Wraith"
ENT.Category = "NutScript - Combat (Wraith)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.NPCReference = "resp_gemini_w"

ENT.model = "models/zombie/gemini.mdl"
ENT.material = "models/props_lab/security_screens"

ENT.BloodColor = DONT_BLEED

ENT.AttackAnim = "Bite"
ENT.WalkAnim = "Walk"
ENT.RunAnim = "Run"

--all attributes
ENT.attribs = {
	["stm"] = 20,
	["str"] = 30,
	["accuracy"] = 5,
	["end"] = 20,
	["luck"] = 0,
	["perception"] = 20,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Blunt"] = 20,
	["Ichor"] = 10,
}

ENT.hp = 250
ENT.armor = 150

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 100,
	["Blight"] = -50,
	["Shard"] = -50,
	["Distort"] = 0,
	
	["Fire"] = 0,
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