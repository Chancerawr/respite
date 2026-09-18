ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Undead Stalker"
ENT.Category = "NutScript - Combat (Fantasy)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/darksouls/characters/hollow_thief.mdl"

ENT.IdleAnim = "Idle_Knife"
ENT.AttackAnim = "MeleeAttack01"
ENT.WalkAnim = "Walk_Knife"
ENT.RunAnim = "Run_Knife"

--all attributes
ENT.attribs = {
	["stm"] = 30,
	["str"] = 10,
	["accuracy"] = 20,
	["end"] = 5,
	["luck"] =10,
	["perception"] = 5,
	["fortitude"] = 5,
}

ENT.dmg = {
	["Pierce"] = 25,
}

ENT.hp = 150
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