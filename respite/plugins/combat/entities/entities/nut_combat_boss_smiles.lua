ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Smiles"
ENT.Category = "NutScript - Combat (Boss)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/player/group01/male_04.mdl"

ENT.WalkAnim = "walk_all"
ENT.RunAnim = "run_all_01"

ENT.hp = 2500
ENT.armor = 200

--all attributes
ENT.attribs = {
	["stm"] = 0,
	["str"] = 20,
	["accuracy"] = 0,
	["end"] = 50,
	["luck"] = 25,
	["perception"] = 0,
	["fortitude"] = 50,
}

ENT.dmg = {
	["Mind"] = 25,
}

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = -50,
	["Blight"] = -50,
	["Shard"] = 25,
	["Distort"] = 25,
	
	["Time"] = 0,
	["Erasure"] = 0,
	
	["Fire"] = 0,
	["Explosion"] = -100,
	["Acid"] = 0,
	["Poison"] = -25,
	["Electric"] = 0,
}

ENT.actions = {
	"smiles_cry",
	"smiles_laugh",
	"smiles_frown",
	"smiles_grin",
	"smiles_smile",
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