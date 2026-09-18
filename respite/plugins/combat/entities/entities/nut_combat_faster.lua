ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Faster"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.NPCReference = "resp_cof_faster"

ENT.model = "models/cryoffear/faster/faster.mdl"

ENT.IdleAnim = "Idle"
ENT.AttackAnim = "Attack1"

--all attributes
ENT.attribs = {
	["stm"] = 15,
	["str"] = 10,
	["accuracy"] = 15,
	["end"] = 20,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Slash"] = 15,
}

ENT.hp = 120
ENT.armor = 25

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
	0.25,
	0.75,
}

ENT.StepPitch = {95,105}
ENT.FootstepSounds = {
	"cof/faster/faster_step.wav",
}