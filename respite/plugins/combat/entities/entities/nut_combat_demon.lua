ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Demon"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.NPCReference = "resp_demon"

ENT.name = "Demon"

ENT.model = "models/nh2zombies/friendly.mdl"

ENT.IdleAnim = "Idle"
ENT.AttackAnim = "Melee"

--all attributes
ENT.attribs = {
	["stm"] = 15,
	["str"] = 10,
	["accuracy"] = 5,
	["end"] = 5,
	["luck"] = 5,
	["perception"] = 0,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Slash"] = 30,
}

ENT.hp = 100
ENT.armor = 30

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 0,
	["Blight"] = -50,
	["Shard"] = 100,
	["Distort"] = 0,
	
	["Fire"] = 0,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 0,
	["Electric"] = 0,
}

ENT.actions = {
	"slash",
	"stab",
	"poison_release",
}

ENT.StepData = {
	0.35,
	0.8,
}

ENT.FootstepSounds = {
	"npc/demon/nhdemon_foot1.wav",
	"npc/demon/nhdemon_foot2.wav",
	"npc/demon/nhdemon_foot3.wav",
	"npc/demon/nhdemon_foot4.wav",
}