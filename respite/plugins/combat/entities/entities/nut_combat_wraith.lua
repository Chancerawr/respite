ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Seeker"
ENT.Category = "NutScript - Combat (Wraith)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.NPCReference = "resp_wraith"

ENT.model = "models/predatorcz/amnesia/grunt.mdl"
ENT.material = "models/props_combine/tpballglow"

ENT.BloodColor = DONT_BLEED

ENT.AttackAnim = "Attack2"

ENT.hp = 250
ENT.armor = 40

--all attributes
ENT.attribs = {
	["stm"] = 10,
	["str"] = 10,
	["accuracy"] = 5,
	["end"] = 10,
	["luck"] = 3,
	["perception"] = 10,
	["fortitude"] = 10,
}

ENT.dmg = {
	["Ichor"] = 20,
}

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 100,
	["Blight"] = -50,
	["Shard"] = 100,
	["Distort"] = 0,
	
	["Fire"] = 50,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 0,
	["Electric"] = 0,
}

ENT.actions = {
	"ichor_spit",
}

ENT.StepData = {
	0.25,
	0.75,
}

ENT.StepPitch = 30
ENT.FootstepSounds = {
	"ambient/water/distant_drip1.wav",
	"ambient/water/distant_drip2.wav",
	"ambient/water/distant_drip3.wav",
	"ambient/water/distant_drip4.wav",
}