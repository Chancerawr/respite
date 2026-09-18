ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Giant Spider Queen"
ENT.Category = "NutScript - Combat (Fantasy)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/monster/giant_spider/giant_spider_queen_ds.mdl"

ENT.IdleAnim = "Idle"
ENT.AttackAnim = "Giant_Spider_Attack_Double"
ENT.WalkAnim = "Walk_All"
ENT.RunAnim = "Run_All"

--all attributes
ENT.attribs = {
	["stm"] = 25,
	["str"] = 50,
	["accuracy"] = 35,
	["end"] = 40,
	["luck"] = 10,
	["perception"] = 20,
	["fortitude"] = 40,
}

ENT.dmg = {
	["Pierce"] = 45,
}

ENT.hp = 3000
ENT.armor = 300

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