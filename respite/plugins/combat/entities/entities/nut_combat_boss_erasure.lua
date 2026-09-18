ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Erasure"
ENT.Category = "NutScript - Combat (Boss)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/7192/numbers.mdl"
ENT.material = "models/effects/splode1_sheet"

ENT.WalkAnim = "walk_all"
ENT.RunAnim = "run_all_01"

ENT.hp = 5000
ENT.armor = 333

--all attributes
ENT.attribs = {
	["stm"] = 30,
	["str"] = 50,
	["accuracy"] = 70,
	["end"] = 50,
	["luck"] = 35,
	["perception"] = 70,
	["fortitude"] = 60,
	["medical"] = 50,
}

ENT.dmg = {
	["Erasure"] = 20,
}

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	["Siege"] = -100,
	
	["Ichor"] = 50,
	["Blight"] = 50,
	["Shard"] = 50,
	["Distort"] = 50,
	
	["Time"] = 100,
	["Erasure"] = 75,
	
	["Fire"] = 25,
	["Explosion"] = -100,
	["Acid"] = 0,
	["Poison"] = 100,
	["Electric"] = -50,
}

ENT.actions = {
	"erasure",
	"dist_slice",
	"shard_beam",
	"blight_shadow",
	"fracture",
	"misfortune_guaranteed",
	"misfortune_cataclysm",
	"carnage_summon",
	"life_destruction",
}

--[[
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
--]]