ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Giant Hornet Queen"
ENT.Category = "NutScript - Combat (Fantasy)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/monster/hornet/hornet_quicia.mdl"

ENT.IdleAnim = "Idle"
ENT.AttackAnim = "Hornet_Attack_Normal"
ENT.WalkAnim = "Walk"
ENT.RunAnim = "Run"

--all attributes
ENT.attribs = {
	["stm"] = 20,
	["str"] = 20,
	["accuracy"] = 25,
	["end"] = 25,
	["luck"] = 5,
	["perception"] = 25,
	["fortitude"] = 30,
}

ENT.dmg = {
	["Pierce"] = 45,
}

ENT.hp = 2500
ENT.armor = 250

ENT.res = {
	["Pierce"] = 15,
	["Slash"] = 15,
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