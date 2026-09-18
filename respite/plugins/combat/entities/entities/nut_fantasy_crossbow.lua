ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Crossbowman"
ENT.Category = "NutScript - Combat (Fantasy)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/hgn/cru/crossbowman.mdl"

ENT.IdleAnim = "Idle_Shotgun"
--ENT.AttackAnim = "Attack_Unarmed_1"
ENT.WalkAnim = "Walk_Shotgun"
ENT.RunAnim = "Run_Shotgun"

--all attributes
ENT.attribs = {
	["stm"] = 10,
	["str"] = 15,
	["accuracy"] = 25,
	["end"] = 10,
	["luck"] = 5,
	["perception"] = 15,
	["fortitude"] = 10,
}

ENT.dmg = {
	["Pierce"] = 25,
}

ENT.hp = 100
ENT.armor = 0

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = -50,
	["Blight"] = -50,
	["Shard"] = -50,
	["Distort"] = 0,
	
	["Fire"] = -25,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = -25,
	["Electric"] = 0,
}

ENT.actions = {
	"slash",
	"whack",
}

ENT.StepData = {
	0.25,
	0.75,
}

ENT.FootstepSounds = {
	"hgn/crussaria/move/chain/jump_01.wav",
	"hgn/crussaria/move/chain/jump_02.wav",
	"hgn/crussaria/move/chain/jump_03.wav",
}