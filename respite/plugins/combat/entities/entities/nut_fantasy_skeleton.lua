ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Skeleton"
ENT.Category = "NutScript - Combat (Fantasy)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/player/skeleton.mdl"

ENT.IdleAnim = "Idle_All_01"
ENT.AttackAnim = "Seq_MeleeAttack01"
ENT.WalkAnim = "Walk_all"
ENT.RunAnim = "Run_all"

--all attributes
ENT.attribs = {
	["stm"] = 15,
	["str"] = 5,
	["accuracy"] = 10,
	["end"] = 5,
	["luck"] = 5,
	["perception"] = 5,
	["fortitude"] = 5,
}

ENT.dmg = {
	["Slash"] = 20,
}

ENT.hp = 60
ENT.armor = 0

ENT.res = {
	["Pierce"] = 50,
	["Slash"] = 50,
	["Blunt"] = 0,
	
	["Ichor"] = -50,
	["Blight"] = -50,
	["Shard"] = -50,
	["Distort"] = 0,
	
	["Fire"] = 25,
	["Explosion"] = -50,
	["Acid"] = 0,
	["Poison"] = 100,
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