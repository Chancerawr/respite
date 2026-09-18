ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Shreen"
ENT.Category = "NutScript - Combat (Weird)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.NPCReference = "resp_club"

ENT.name = "Shreen"
ENT.model = "models/cryoffear/mace/sewer_boss.mdl"

ENT.color = Color(130, 220, 130)

ENT.IdleAnim = "Idle"
ENT.AttackAnim = "Attack1"

ENT.noRag = true

--all attributes
ENT.attribs = {
	["stm"] = 0,
	["str"] = 30,
	["accuracy"] = 0,
	["end"] = 40,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Blunt"] = 25,
	["Pierce"] = 10,
}

ENT.hp = 1000
ENT.armor = 200

ENT.res = {
	["Pierce"] = -10,
	["Slash"] = 15,
	["Blunt"] = 15,
	
	["Ichor"] = -50,
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
	"ogre_swing",
	"ogre_kick",
	"ogre_punch",
	"ogre_now",
}

ENT.StepData = {
	0.25,
	0.75,
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