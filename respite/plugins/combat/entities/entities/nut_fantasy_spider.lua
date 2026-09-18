ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Giant Spider"
ENT.Category = "NutScript - Combat (Fantasy)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/monster/giant_spider/giant_spider.mdl"

ENT.IdleAnim = "Idle"
ENT.AttackAnim = "Giant_Spider_Attack_Double"
ENT.WalkAnim = "Walk_All"
ENT.RunAnim = "Run_All"

--all attributes
ENT.attribs = {
	["stm"] = 15,
	["str"] = 35,
	["accuracy"] = 25,
	["end"] = 35,
	["luck"] = 10,
	["perception"] = 10,
	["fortitude"] = 20,
}

ENT.dmg = {
	["Pierce"] = 30,
}

ENT.hp = 1000
ENT.armor = 200

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = -50,
	["Blight"] = -50,
	["Shard"] = -50,
	["Distort"] = 0,
	
	["Fire"] = -50,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = -25,
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