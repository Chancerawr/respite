ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Rat of Happenstance"
ENT.Category = "NutScript - Combat (Weird)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/subtact/hakos_baelzofficial/baelzofficial_pm.mdl"

ENT.hp = 1000
ENT.armor = 0

--all attributes
ENT.attribs = {
	["stm"] = 0,
	["str"] = 0,
	["accuracy"] = 0,
	["end"] = 0,
	["luck"] = 50,
	["perception"] = 0,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Pierce"] = 15,
}

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = -25,
	["Blight"] = -25,
	["Shard"] = -25,
	["Distort"] = 25,
	
	["Time"] = 50,
	["Erasure"] = -25,
	
	["Fire"] = -25,
	["Explosion"] = -25,
	["Acid"] = 0,
	["Poison"] = 25,
	["Electric"] = 10,
}

ENT.actions = {
	"rat_chaos",
	"rat_dice_ally",
	"rat_dice_enemy",
	"rat_hero",
	"rat_erasure",
}

ENT.actionsAI = {
	"rat_chaos",
	"rat_dice_enemy",
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