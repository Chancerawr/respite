ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Emptiness"
ENT.Category = "NutScript - Combat (Fantasy)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/7192/numbers.mdl"
ENT.material = "effects/flicker_256"

ENT.IdleAnim = "Idle_All_01"
--ENT.AttackAnim = "MeleeAttack01"
ENT.WalkAnim = "Walk_all"
ENT.RunAnim = "Run_all"

--all attributes
ENT.attribs = {
	["stm"] = 20,
	["str"] = 25,
	["accuracy"] = 25,
	["end"] = 25,
	["luck"] = 1000,
	["perception"] = 1000,
	["fortitude"] = 10000,
}

ENT.dmg = {
	["Erasure"] = 66,
}

ENT.hp = 10000
ENT.armor = 0

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 0,
	["Blight"] = 100,
	["Shard"] = 100,
	["Distort"] = 0,
	["Rot"] = 100,
	
	["Fire"] = 0,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 100,
	["Electric"] = 0,
	
	["Distortion"] = 100,
	["Erasure"] = 100,
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
	"npc/footsteps/hardboot_generic1.wav",
	"npc/footsteps/hardboot_generic2.wav",
	"npc/footsteps/hardboot_generic3.wav",
	"npc/footsteps/hardboot_generic4.wav",
	"npc/footsteps/hardboot_generic5.wav",
	"npc/footsteps/hardboot_generic6.wav",
}