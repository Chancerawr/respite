ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Demon Flame"
ENT.Category = "NutScript - Combat (Wraith)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.NPCReference = "resp_demon_w"

ENT.name = "Burning Demon"

ENT.model = "models/nh2zombies/friendly.mdl"
ENT.material = "models/effects/splode1_sheet"

ENT.BloodColor = DONT_BLEED

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
	["Slash"] = 15,
	["Fire"] = 15,
}

ENT.hp = 150
ENT.armor = 30

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 100,
	["Blight"] = -50,
	["Shard"] = -50,
	["Distort"] = 0,
	
	["Fire"] = 75,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 0,
	["Electric"] = 0,
}

ENT.actions = {
	"slash",
	"stab",
	"ichor_spit",
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