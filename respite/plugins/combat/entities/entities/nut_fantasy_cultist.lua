ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Cultist"
ENT.Category = "NutScript - Combat (Fantasy)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/hgn/cru/robes/black_male_20.mdl"

ENT.models = {
	"models/hgn/cru/robes/black_female_20.mdl",
	"models/hgn/cru/robes/black_male_20.mdl",
	"models/hgn/cru/robes/black_male_21.mdl",
	"models/hgn/cru/robes/black_male_27.mdl",
}

ENT.IdleAnim = "Idle_All_Angry"
ENT.AttackAnim = "MeleeAttack01"
ENT.WalkAnim = "Walk_all"
ENT.RunAnim = "Run_all_panicked"

--all attributes
ENT.attribs = {
	["stm"] = 10,
	["str"] = 10,
	["accuracy"] = 10,
	["end"] = 10,
	["luck"] = 5,
	["perception"] = 10,
	["fortitude"] = 10,
}

ENT.dmg = {
	["Pierce"] = 15,
}

ENT.hp = 100
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