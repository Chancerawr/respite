ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Knight"
ENT.Category = "NutScript - Combat (Fantasy)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/cakez/got/gotknight1_p.mdl"
ENT.models = {
	"models/cakez/got/gotknight1_p.mdl",
	"models/cakez/got/gotknight2_p.mdl",
	"models/cakez/got/gotknight3_p.mdl",
	"models/cakez/got/gotknight4_p.mdl",
	"models/cakez/got/gotknight5_p.mdl",
}

ENT.IdleAnim = "Idle_Melee2"
--ENT.AttackAnim = "Attack_Unarmed_1"
ENT.WalkAnim = "Walk_Melee2"
ENT.RunAnim = "Run_Melee2"

--all attributes
ENT.attribs = {
	["stm"] = 15,
	["str"] = 30,
	["accuracy"] = 25,
	["end"] = 25,
	["luck"] = 10,
	["perception"] = 20,
	["fortitude"] = 15,
}

ENT.dmg = {
	["Slash"] = 30,
}

ENT.hp = 250
ENT.armor = 400

ENT.res = {
	["Pierce"] = 20,
	["Slash"] = 50,
	["Blunt"] = -10,
	
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