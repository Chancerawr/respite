ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Teleporter"
ENT.Category = "NutScript - Combat (Shade)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.NPCReference = "resp_teleporter"

ENT.model = "models/predatorcz/amnesia/grunt.mdl"
ENT.material = "models/effects/portalrift_sheet"

ENT.BloodColor = DONT_BLEED

ENT.AttackAnim = "Attack1"

--all attributes
ENT.attribs = {
	["stm"] = 6,
	["str"] = 5,
	["accuracy"] = 5,
	["end"] = 5,
	["luck"] = 0,
	["perception"] = 5,
	["fortitude"] = 10,
}

ENT.dmg = {
	["Blight"] = 15,
}

ENT.hp = 250
ENT.armor = 20

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 0,
	["Blight"] = 100,
	["Shard"] = -50,
	["Distort"] = 0,
	
	["Fire"] = 0,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 0,
	["Electric"] = 0,
}

ENT.StepData = {
	0.25,
	0.75,
}

ENT.StepPitch = {70,80}
ENT.FootstepSounds = {
	"chorror/bass4.wav",
}