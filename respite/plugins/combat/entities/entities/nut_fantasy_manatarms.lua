ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Man At Arms"
ENT.Category = "NutScript - Combat (Fantasy)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/aoc_player/mason_man_at_arms/mason_man_at_arms.mdl"

ENT.IdleAnim = "Idle_Subtle"
--ENT.AttackAnim = "Attack_Unarmed_1"
ENT.WalkAnim = "Walk_All"
ENT.RunAnim = "Run_All"

--all attributes
ENT.attribs = {
	["stm"] = 20,
	["str"] = 25,
	["accuracy"] = 20,
	["end"] = 20,
	["luck"] = 5,
	["perception"] = 15,
	["fortitude"] = 10,
}

ENT.dmg = {
	["Slash"] = 25,
}

ENT.hp = 150
ENT.armor = 300

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = -50,
	["Blight"] = -50,
	["Shard"] = -50,
	["Distort"] = 0,
	
	["Fire"] = 0,
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