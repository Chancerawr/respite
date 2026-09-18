ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Faceless"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.NPCReference = "resp_cof_faceless"

ENT.model = "models/cryoffear/faceless/faceless3.mdl"

ENT.collisionOverwrite = true
ENT.CollisionHeight = 83
ENT.CollisionSide = 15

ENT.IdleAnim = "Idle"
ENT.AttackAnim = "Attack1"
ENT.WalkAnim = "Walk"
ENT.RunAnim = "Walk"

--all attributes
ENT.attribs = {
	["stm"] = 10,
	["str"] = 15,
	["accuracy"] = 10,
	["end"] = 10,
	["luck"] = 0,
	["perception"] = 5,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Blunt"] = 5,
	["Slash"] = 5,
}

ENT.hp = 100
ENT.armor = 10

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

ENT.FootstepSounds = {
	"npc/footsteps/hardboot_generic1.wav",
	"npc/footsteps/hardboot_generic2.wav",
	"npc/footsteps/hardboot_generic3.wav",
	"npc/footsteps/hardboot_generic4.wav",
	"npc/footsteps/hardboot_generic5.wav",
	"npc/footsteps/hardboot_generic6.wav",
}