ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Woodsman"
ENT.Category = "NutScript - Combat (Other)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Woodsman"

ENT.model = "models/player/group01/male_04.mdl"
ENT.material = "models/props/cs_militia/roofbeams02"

ENT.models = {
	"models/player/group01/female_01.mdl",
	"models/player/group01/female_02.mdl",
	"models/player/group01/female_03.mdl",
	"models/player/group01/female_04.mdl",
	"models/player/group01/female_05.mdl",
	"models/player/group01/female_06.mdl",
	"models/player/group01/male_01.mdl",
	"models/player/group01/male_02.mdl",
	"models/player/group01/male_03.mdl",
	"models/player/group01/male_04.mdl",
	"models/player/group01/male_05.mdl",
	"models/player/group01/male_06.mdl",
	"models/player/group01/male_07.mdl",
	"models/player/group01/male_08.mdl",
	"models/player/group01/male_09.mdl",
}

ENT.WalkAnim = "walk_all"
ENT.RunAnim = "run_all_01"

--all attributes
ENT.attribs = {
	["stm"] = 0,
	["str"] = 10,
	["accuracy"] = 10,
	["end"] = 15,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Blunt"] = 20,
}

ENT.hp = 150
ENT.armor = 0

ENT.res = {
	["Pierce"] = 25,
	["Slash"] = -25,
	["Blunt"] = 25,
	
	["Ichor"] = 0,
	["Blight"] = -100,
	["Shard"] = 100,
	["Distort"] = 0,
	
	["Fire"] = -100,
	["Explosion"] = -50,
	["Acid"] = 0,
	["Poison"] = 100,
	["Electric"] = 100,
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

ENT.bleeds = false --for decals