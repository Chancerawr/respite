ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Wizard"
ENT.Category = "NutScript - Combat (Fantasy)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/hgn/cru/oldman1.mdl"

ENT.IdleAnim = "Idle_All_01"
--ENT.AttackAnim = "Attack_Unarmed_1"
ENT.WalkAnim = "Walk_All"
ENT.RunAnim = "Run_All"

--all attributes
ENT.attribs = {
	["stm"] = 5,
	["str"] = 5,
	["accuracy"] = 25,
	["end"] = 7,
	["luck"] = 0,
	["perception"] = 55,
	["fortitude"] = 60,
}

ENT.dmg = {
	["Fire"] = 40,
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
	
	["Fire"] = 50,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 0,
	["Electric"] = 0,
}

ENT.actions = {
	"fire_bolt",
	"fire_ball",
	"fire_incinerate",
	"fire_inferno",
	"water_heal",
	"frost_bolt",
	"frost_freeze",
	"lightning_bolt",
	"lightning_chain",
	"poison_bolt",
	"dark_bolt",
	"dark_raise",
	"dark_void",
	"wind_blade",
	"earth_fist",
	"earth_impale",
	"light_blind",
	"light_heal",
	"light_seraphim",
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