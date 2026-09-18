ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Gnoll Soldier"
ENT.Category = "NutScript - Combat (Fantasy)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/monster/gnoll/gnoll_hammerguard.mdl"

ENT.IdleAnim = "Idle"
ENT.AttackAnim = "Gnoll_Attack_Bigswing"
ENT.WalkAnim = "Walk"
ENT.RunAnim = "Run"

--all attributes
ENT.attribs = {
	["stm"] = 30,
	["str"] = 20,
	["accuracy"] = 15,
	["end"] = 15,
	["luck"] = 5,
	["perception"] = 20,
	["fortitude"] = 5,
}

ENT.dmg = {
	["Slash"] = 25,
}

ENT.hp = 300
ENT.armor = 200

ENT.res = {
	["Pierce"] = 10,
	["Slash"] = 25,
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