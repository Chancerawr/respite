ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Blighted Skeleton"
ENT.Category = "NutScript - Combat (Fantasy)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/player/skeleton.mdl"
ENT.color = Color(0,0,0)

ENT.IdleAnim = "Idle_All_01"
ENT.AttackAnim = "Seq_MeleeAttack01"
ENT.WalkAnim = "Walk_all"
ENT.RunAnim = "Run_all"

--all attributes
ENT.attribs = {
	["stm"] = 12,
	["str"] = 8,
	["accuracy"] = 10,
	["end"] = 5,
	["luck"] = 5,
	["perception"] = 5,
	["fortitude"] = 10,
}

ENT.dmg = {
	["Blight"] = 20,
}

ENT.hp = 60
ENT.armor = 0

ENT.res = {
	["Pierce"] = 50,
	["Slash"] = 50,
	["Blunt"] = 0,
	
	["Ichor"] = -50,
	["Blight"] = 100,
	["Shard"] = -100,
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