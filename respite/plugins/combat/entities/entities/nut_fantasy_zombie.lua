ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Zombie"
ENT.Category = "NutScript - Combat (Fantasy)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/undead/undead.mdl"

ENT.IdleAnim = "Idle_Angry"
ENT.AttackAnim = "MeleeAttack01"
ENT.WalkAnim = "Walk_all"
ENT.RunAnim = "Run_all_panicked"

--all attributes
ENT.attribs = {
	["stm"] = 1,
	["str"] = 10,
	["accuracy"] = 5,
	["end"] = 10,
	["luck"] = -1,
	["perception"] = 2,
	["fortitude"] = -1,
}

ENT.dmg = {
	["Blunt"] = 15,
}

ENT.hp = 80
ENT.armor = 0

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 25,
	
	["Ichor"] = -50,
	["Blight"] = -50,
	["Shard"] = -50,
	["Distort"] = 0,
	
	["Fire"] = -50,
	["Explosion"] = -25,
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