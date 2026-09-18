ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Dolly"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.NPCReference = "resp_dolly"

ENT.model = "models/zombie/2.mdl"

ENT.BloodColor = DONT_BLEED

ENT.AttackAnim = "Attack"
ENT.WalkAnim = "Run1"
ENT.RunAnim = "Run1"

--all attributes
ENT.attribs = {
	["stm"] = 15,
	["str"] = 7,
	["accuracy"] = 7,
	["end"] = 5,
	["luck"] = 5,
	["perception"] = 5,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Slash"] = 5,
}

ENT.hp = 15
ENT.armor = 5

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 0,
	["Blight"] = -50,
	["Shard"] = 100,
	["Distort"] = 0,
	
	["Fire"] = 25,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 0,
	["Electric"] = 25,
}

ENT.actions = {
	"slash",
	"stab",
}

ENT.StepData = {
	0,
	0.25,
	0.5,
	0.75,
}

ENT.StepPitch = 140
ENT.FootstepSounds = {
	"physics/plaster/ceiling_tile_impact_bullet1.wav",
	"physics/plaster/ceiling_tile_impact_bullet2.wav",
	"physics/plaster/ceiling_tile_impact_bullet3.wav",
}