ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Worm"
ENT.Category = "NutScript - Combat (Fantasy)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/monster/cragdigger/cragdigger.mdl"

ENT.IdleAnim = "Idle"
ENT.AttackAnim = "Cragdigger_Attack_Melee"
--ENT.WalkAnim = "Walk_all"
--ENT.RunAnim = "Run_all_panicked"

--all attributes
ENT.attribs = {
	["stm"] = 15,
	["str"] = 15,
	["accuracy"] = 15,
	["end"] = 10,
	["luck"] = 5,
	["perception"] = 0,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Pierce"] = 5,
	["Slash"] = 10,
}

ENT.hp = 100
ENT.armor = 50

ENT.res = {
	["Pierce"] = 15,
	["Slash"] = -15,
	["Blunt"] = 15,
	
	["Ichor"] = -50,
	["Blight"] = -50,
	["Shard"] = -50,
	["Distort"] = 0,
	
	["Fire"] = -25,
	["Explosion"] = -25,
	["Acid"] = 0,
	["Poison"] = 25,
	["Electric"] = 0,
}

ENT.actions = {
	"slash",
	"whack",
	"poison_bolt",
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