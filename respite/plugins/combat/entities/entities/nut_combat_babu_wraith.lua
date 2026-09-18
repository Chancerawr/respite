ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Babu Wraith"
ENT.Category = "NutScript - Combat (Wraith)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.NPCReference = "resp_babu_w"

ENT.model = "models/zombie/babu.mdl"
ENT.material = "models/props_lab/security_screens"

ENT.BloodColor = DONT_BLEED

ENT.IdleAnim = "Idle01"
ENT.AttackAnim = "AttackB"
ENT.RunAnim = "A_Walk1"

--all attributes
ENT.attribs = {
	["stm"] = 15,
	["str"] = 12,
	["accuracy"] = 0,
	["end"] = 12,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Blunt"] = 10,
	["Ichor"] = 5,
}

ENT.hp = 50
ENT.armor = 20

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

ENT.StepData = {
	0,
	0.17,
	0.39,
	0.55,
	0.68,
	0.86,
}

ENT.SoundPitch = {165,185}

ENT.FootstepSounds = {
	"babu/foot1.wav",
	"babu/foot2.wav",
	"babu/foot3.wav",
	"babu/foot4.wav",
}