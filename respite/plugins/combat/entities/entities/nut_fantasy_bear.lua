ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Bear"
ENT.Category = "NutScript - Combat (Fantasy)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/monster/bear/bear.mdl"

ENT.IdleAnim = "Idle"
ENT.AttackAnim = "Bear_Attack_Double"
ENT.WalkAnim = "Walk"
ENT.RunAnim = "Run"

--all attributes
ENT.attribs = {
	["stm"] = 10,
	["str"] = 30,
	["accuracy"] = 15,
	["end"] = 30,
	["luck"] = 5,
	["perception"] = 15,
	["fortitude"] = 20,
}

ENT.dmg = {
	["Slash"] = 30,
}

ENT.hp = 1000
ENT.armor = 150

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 25,
	["Blunt"] = 25,
	
	["Ichor"] = -50,
	["Blight"] = -50,
	["Shard"] = -50,
	["Distort"] = 0,
	
	["Fire"] = -25,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 25,
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