ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Imp"
ENT.Category = "NutScript - Combat (Fantasy)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/hgn/cru/imp.mdl"

ENT.IdleAnim = "aoc_dagger2_holsted_idle"
ENT.AttackAnim = "Aoc_dagger1_slash_01"
ENT.WalkAnim = "walk_all"
ENT.RunAnim = "Run_all"

--all attributes
ENT.attribs = {
	["stm"] = 25,
	["str"] = 1,
	["accuracy"] = 15,
	["end"] = 10,
	["luck"] = 5,
	["perception"] = 10,
	["fortitude"] = 5,
}

ENT.dmg = {
	["Fire"] = 15,
	["Slash"] = 10,
}

ENT.hp = 70
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
	"fire_bolt",
	"fire_ball",
	"fire_incinerate",
	"slash",
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