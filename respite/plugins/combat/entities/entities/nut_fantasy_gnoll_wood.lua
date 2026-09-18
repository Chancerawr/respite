ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Wooden Gnoll"
ENT.Category = "NutScript - Combat (Fantasy)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/monster/gnoll/gnoll_mockin.mdl"

ENT.IdleAnim = "Idle"
ENT.AttackAnim = "Gnoll_Attack_Talon"
ENT.WalkAnim = "Walk"
ENT.RunAnim = "Run"

--all attributes
ENT.attribs = {
	["stm"] = 15,
	["str"] = 15,
	["accuracy"] = 10,
	["end"] = 20,
	["luck"] = 5,
	["perception"] = 10,
	["fortitude"] = 5,
}

ENT.dmg = {
	["Blunt"] = 15,
}

ENT.hp = 250
ENT.armor = 0

ENT.res = {
	["Pierce"] = 15,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = -50,
	["Blight"] = -50,
	["Shard"] = -50,
	["Distort"] = 0,
	
	["Fire"] = -100,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 0,
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