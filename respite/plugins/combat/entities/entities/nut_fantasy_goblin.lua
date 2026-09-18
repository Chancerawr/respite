ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Goblin"
ENT.Category = "NutScript - Combat (Fantasy)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/npc/goblin/npc_goblin.mdl"

ENT.IdleAnim = "Idle_0"
ENT.AttackAnim = "Attack_Unarmed_1"
ENT.WalkAnim = "Walk"
ENT.RunAnim = "Run"

--all attributes
ENT.attribs = {
	["stm"] = 10,
	["str"] = 1,
	["accuracy"] = 1,
	["end"] = 1,
	["luck"] = -1,
	["perception"] = 2,
	["fortitude"] = -1,
}

ENT.dmg = {
	["Slash"] = 10,
}

ENT.hp = 30
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
	["Poison"] = -25,
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