ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Mineral Golem"
ENT.Category = "NutScript - Combat (Fantasy)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/monster/glan/golem_colru.mdl"

ENT.IdleAnim = "Idle"
ENT.AttackAnim = "Golem_Attack_Leftpunch"
ENT.WalkAnim = "Walk"
ENT.RunAnim = "Walk"

--all attributes
ENT.attribs = {
	["stm"] = 0,
	["str"] = 30,
	["accuracy"] = 15,
	["end"] = 50,
	["luck"] = 0,
	["perception"] = 15,
	["fortitude"] = 25,
}

ENT.dmg = {
	["Blunt"] = 40,
}

ENT.hp = 2500
ENT.armor = 1000

ENT.res = {
	["Pierce"] = 75,
	["Slash"] = 50,
	["Blunt"] = 25,
	
	["Ichor"] = -50,
	["Blight"] = -50,
	["Shard"] = -50,
	["Distort"] = 0,
	
	["Fire"] = 100,
	["Explosion"] = -50,
	["Acid"] = 0,
	["Poison"] = 100,
	["Electric"] = 100,
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