ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Drum"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.NPCReference = "resp_drum"

ENT.model = "models/player/zombie_soldier.mdl"
ENT.material = "models/flesh"

ENT.modelScale = 1.8

ENT.IdleAnim = "zombie_walk_06"
ENT.WalkAnim = "zombie_walk_06"
ENT.RunAnim = "zombie_walk_06"
ENT.AttackAnim = "AttackC"

ENT.color = Color(130, 220, 130)

--all attributes
ENT.attribs = {
	["stm"] = 3,
	["str"] = 20,
	["accuracy"] = 20,
	["end"] = 20,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Blunt"] = 40,
}

ENT.hp = 400
ENT.armor = 200

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
	0.15,
	0.55,
}

ENT.StepPitch = 50
ENT.FootstepSounds = {
	"npc/footsteps/hardboot_generic1.wav",
	"npc/footsteps/hardboot_generic2.wav",
	"npc/footsteps/hardboot_generic3.wav",
	"npc/footsteps/hardboot_generic4.wav",
	"npc/footsteps/hardboot_generic5.wav",
	"npc/footsteps/hardboot_generic6.wav",
}