ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Ritualist"
ENT.Category = "NutScript - Combat (Fantasy)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/hgn/cru/reaper2.mdl"

ENT.IdleAnim = "Idle_All_Angry"
ENT.AttackAnim = "Aoc_doubleaxe_slash_01"
ENT.WalkAnim = "Walk_all"
ENT.RunAnim = "Run_all_panicked"

--all attributes
ENT.attribs = {
	["stm"] = 10,
	["str"] = 20,
	["accuracy"] = 15,
	["end"] = 10,
	["luck"] = 5,
	["perception"] = 15,
	["fortitude"] = 20,
}

ENT.dmg = {
	["Slash"] = 15,
	["Pierce"] = 15,
}

ENT.hp = 250
ENT.armor = 0

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
	["Poison"] = 0,
	["Electric"] = 0,
}

ENT.actions = {
	"dark_bolt",
	"dark_raise",
	"dark_void",
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