ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Orc"
ENT.Category = "NutScript - Combat (Fantasy)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/hgn/cru/orc.mdl"

ENT.IdleAnim = "Idle_Melee2"
--ENT.AttackAnim = "Attack_Unarmed_1"
ENT.WalkAnim = "Walk_Melee2"
ENT.RunAnim = "Run_Melee2"

--all attributes
ENT.attribs = {
	["stm"] = 15,
	["str"] = 25,
	["accuracy"] = 15,
	["end"] = 20,
	["luck"] = 5,
	["perception"] = 10,
	["fortitude"] = 15,
}

ENT.dmg = {
	["Slash"] = 25,
}

ENT.hp = 250
ENT.armor = 150

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