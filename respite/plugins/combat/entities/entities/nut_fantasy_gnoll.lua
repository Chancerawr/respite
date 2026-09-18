ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Gnoll"
ENT.Category = "NutScript - Combat (Fantasy)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/monster/gnoll/gnoll.mdl"

ENT.IdleAnim = "Idle"
ENT.AttackAnim = "Gnoll_Attack_Talon"
ENT.WalkAnim = "Walk"
ENT.RunAnim = "Run"

--all attributes
ENT.attribs = {
	["stm"] = 20,
	["str"] = 15,
	["accuracy"] = 10,
	["end"] = 10,
	["luck"] = 5,
	["perception"] = 15,
	["fortitude"] = 5,
}

ENT.dmg = {
	["Slash"] = 15,
}

ENT.hp = 200
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