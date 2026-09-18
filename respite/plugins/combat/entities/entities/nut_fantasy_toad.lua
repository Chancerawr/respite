ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Giant Toad"
ENT.Category = "NutScript - Combat (Fantasy)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/monster/toad/toad_giant.mdl"

ENT.IdleAnim = "Idle"
ENT.AttackAnim = "Toad_Attack_Bite"
ENT.WalkAnim = "Walk"
ENT.RunAnim = "Run"

--all attributes
ENT.attribs = {
	["stm"] = 0,
	["str"] = 30,
	["accuracy"] = 20,
	["end"] = 40,
	["luck"] = 5,
	["perception"] = 10,
	["fortitude"] = 10,
}

ENT.dmg = {
	["Blunt"] = 30,
}

ENT.hp = 1000
ENT.armor = 250

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 25,
	["Blunt"] = 50,
	
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