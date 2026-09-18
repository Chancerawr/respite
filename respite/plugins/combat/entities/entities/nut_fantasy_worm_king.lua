ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Eater of Mountains"
ENT.Category = "NutScript - Combat (Fantasy)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/monster/cragdigger2/cragdigger_qyrmigal.mdl"

ENT.IdleAnim = "Idle_bigq"
ENT.AttackAnim = "Attack_nomq"
--ENT.WalkAnim = "Walk_all"
--ENT.RunAnim = "Run_all_panicked"

--all attributes
ENT.attribs = {
	["stm"] = 15,
	["str"] = 50,
	["accuracy"] = 40,
	["end"] = 40,
	["luck"] = 5,
	["perception"] = 0,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Pierce"] = 25,
	["Slash"] = 25,
}

ENT.hp = 3000
ENT.armor = 500

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