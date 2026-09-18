ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Melded Razor"
ENT.Category = "NutScript - Combat (Drone)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.NPCReference = "resp_cof_faster"

ENT.model = "models/cryoffear/faster_male/faster.mdl"
ENT.material = "models/props_pipes/destroyedpipes01a"

ENT.AttackAnim = "Attack1"

ENT.BloodColor = BLOOD_COLOR_MECH

--all attributes
ENT.attribs = {
	["stm"] = 15,
	["str"] = 10,
	["accuracy"] = 15,
	["end"] = 20,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Slash"] = 15,
}

ENT.hp = 120
ENT.armor = 100

ENT.res = {
	["Pierce"] = 10,
	["Slash"] = 10,
	["Blunt"] = -15,
	["Siege"] = 0,
	
	["Ichor"] = -15,
	["Blight"] = -50,
	["Shard"] = 100,
	["Distort"] = 0,
	["Time"] = 10,
	
	["Rot"] = -25,
	["Cold"] = -15,
	["Fire"] = -15,
	["Explosion"] = -15,
	["Acid"] = 0,
	["Poison"] = 25,
	["Electric"] = -15,
}

ENT.StepData = {
	0.25,
	0.75,
}

ENT.StepPitch = {95,105}
ENT.FootstepSounds = {
	"cof/faster/faster_step.wav",
}