ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Wizard Intiate"
ENT.Category = "NutScript - Combat (Fantasy)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/half-dead/wizards/female_01.mdl"

ENT.models = {
	"models/half-dead/wizards/female_01.mdl",
	"models/half-dead/wizards/female_02.mdl",
	"models/half-dead/wizards/female_03.mdl",
	"models/half-dead/wizards/female_04.mdl",
	"models/half-dead/wizards/female_06.mdl",
	"models/half-dead/wizards/female_07.mdl",
	"models/half-dead/wizards/male_01.mdl",
	"models/half-dead/wizards/male_02.mdl",
	"models/half-dead/wizards/male_03.mdl",
	"models/half-dead/wizards/male_04.mdl",
	"models/half-dead/wizards/male_05.mdl",
	"models/half-dead/wizards/male_06.mdl",
	"models/half-dead/wizards/male_07.mdl",
	"models/half-dead/wizards/male_08.mdl",
	"models/half-dead/wizards/male_09.mdl",
}

ENT.IdleAnim = "Idle_Subtle"
--ENT.AttackAnim = "Attack_Unarmed_1"
ENT.WalkAnim = "Walk_All"
ENT.RunAnim = "Run_All"

--all attributes
ENT.attribs = {
	["stm"] = 15,
	["str"] = 20,
	["accuracy"] = 15,
	["end"] = 15,
	["luck"] = 5,
	["perception"] = 10,
	["fortitude"] = 5,
}

ENT.dmg = {
	["Fire"] = 15,
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
	
	["Fire"] = 0,
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