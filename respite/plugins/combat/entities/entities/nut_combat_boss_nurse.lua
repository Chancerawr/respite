ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Nurse"
ENT.Category = "NutScript - Combat (Boss)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/chillax_sf2/silenthill/sh2/nurse/nurse.mdl"

--ENT.WalkAnim = "walk_all"
--ENT.RunAnim = "run_all_01"

ENT.hp = 5000
ENT.armor = 200

--all attributes
ENT.attribs = {
	["stm"] = 10,
	["str"] = 50,
	["accuracy"] = 50,
	["end"] = 25,
	["luck"] = 100,
	["perception"] = 200,
	["fortitude"] = 200,
}

ENT.dmg = {
	["Blight"] = 35,
}

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = -50,
	["Blight"] = 100,
	["Shard"] = -100,
	["Distort"] = 25,
	
	["Time"] = 0,
	["Erasure"] = 0,
	
	["Fire"] = 0,
	["Explosion"] = -100,
	["Acid"] = 0,
	["Poison"] = 50,
	["Electric"] = 0,
}

ENT.actions = {
	"nurse_surgery",
	"nurse_rebuild",
	"nurse_rejuvenate",
}

ENT.StepData = {
	0.25,
	0.74,
}

ENT.StepPitch = {80,90}
ENT.FootstepSounds = {
	"dalrp/npc/nurse/nurse_foot01.wav",
	"dalrp/npc/nurse/nurse_foot02.wav",
	"dalrp/npc/nurse/nurse_foot03.wav",
}