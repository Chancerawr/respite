ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Necromancer"
ENT.Category = "NutScript - Combat (Fantasy)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/hgn/cru/shadowkeeper.mdl"

ENT.IdleAnim = "Idle_All_Angry"
ENT.AttackAnim = "aoc_parry_highright"
ENT.WalkAnim = "Walk_all"
ENT.RunAnim = "Run_all_panicked"

--all attributes
ENT.attribs = {
	["stm"] = 15,
	["str"] = 15,
	["accuracy"] = 20,
	["end"] = 25,
	["luck"] = 5,
	["perception"] = 40,
	["fortitude"] = 50,
}

ENT.dmg = {
	["Blight"] = 35,
}

ENT.hp = 2000
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