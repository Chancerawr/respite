ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Behemoth"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.NPCReference = "resp_quadralex"

ENT.name = "Behemoth"

ENT.model = "models/sin/quadralex.mdl"

ENT.AttackAnim = "Shockwave_Attack"

--all attributes
ENT.attribs = {
	["stm"] = 10,
	["str"] = 50,
	["accuracy"] = 20,
	["end"] = 50,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Blunt"] = 60,
}

ENT.hp = 5000
ENT.armor = 250

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 0,
	["Blight"] = -50,
	["Shard"] = 100,
	["Distort"] = 0,
	
	["Fire"] = 25,
	["Explosion"] = 25,
	["Acid"] = 25,
	["Poison"] = 50,
	["Electric"] = 0,
}

ENT.StepData = {
	0.25,
	0.75,
}

ENT.StepPitch = {80, 90}

ENT.FootstepSounds = {
	"npc/quadralex/quad_step_heavy.wav",
}