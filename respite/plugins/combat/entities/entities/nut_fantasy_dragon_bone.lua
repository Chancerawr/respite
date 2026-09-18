ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Bone Dragon"
ENT.Category = "NutScript - Combat (Fantasy)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/npc/bone_dragon/npc_bone_dragon.mdl"

ENT.IdleAnim = "Fly_N"
ENT.AttackAnim = "Attack_Claws1"
ENT.WalkAnim = "Fly_N"
ENT.RunAnim = "Fly_N"

--all attributes
ENT.attribs = {
	["stm"] = 20,
	["str"] = 50,
	["accuracy"] = 50,
	["end"] = 60,
	["luck"] = 10,
	["perception"] = 50,
	["fortitude"] = 50,
}

ENT.dmg = {
	["Pierce"] = 30,
	["Slash"] = 30,
}

ENT.hp = 5000
ENT.armor = 500

ENT.res = {
	["Pierce"] = 30,
	["Slash"] = 30,
	["Blunt"] = 0,
	
	["Ichor"] = -50,
	["Blight"] = -50,
	["Shard"] = -50,
	["Distort"] = 0,
	
	["Fire"] = 0,
	["Explosion"] = -50,
	["Acid"] = 0,
	["Poison"] = 100,
	["Electric"] = 100,
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