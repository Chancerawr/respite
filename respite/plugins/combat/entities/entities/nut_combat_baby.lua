ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Baby"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.NPCReference = "resp_baby"

ENT.model = "models/zombie/zombibaba.mdl"

ENT.AttackAnim = "AttackB"

--all attributes
ENT.attribs = {
	["stm"] = 10,
	["str"] = 5,
	["accuracy"] = 5,
	["medical"] = 0,
	["end"] = 5,
	["luck"] = 5,
	["perception"] = 5,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Slash"] = 5,
}

ENT.hp = 10
ENT.armor = 0

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
	["Electric"] = 25,
}

ENT.actions = {
	"slash",
	"stab",
}

ENT.StepData = {
	0.28,
	0.76,
}

ENT.StepPitch = 150

ENT.FootstepSounds = {
	"babu/foot1.wav",
	"babu/foot2.wav",
	"babu/foot3.wav",
	"babu/foot4.wav",
}