ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Rune Golem"
ENT.Category = "NutScript - Combat (Fantasy)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/monster/glan/golem_ahglan.mdl"

ENT.IdleAnim = "Idle"
ENT.AttackAnim = "Golem_Attack_Stamp"
ENT.WalkAnim = "Walk"
ENT.RunAnim = "Walk"

--all attributes
ENT.attribs = {
	["stm"] = 0,
	["str"] = 20,
	["accuracy"] = 10,
	["end"] = 30,
	["luck"] = 0,
	["perception"] = 15,
	["fortitude"] = 25,
}

ENT.dmg = {
	["Blunt"] = 25,
}

ENT.hp = 1000
ENT.armor = 500

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