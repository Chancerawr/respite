ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Creeper Wraith"
ENT.Category = "NutScript - Combat (Wraith)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.NPCReference = "resp_creeper_wraith"

ENT.model = "models/nh2zombies/creeper.mdl"
ENT.material = "models/props_combine/tpballglow"

ENT.BloodColor = DONT_BLEED

ENT.AttackAnim = "Melee"

--all attributes
ENT.attribs = {
	["stm"] = 20,
	["str"] = 15,
	["accuracy"] = 12,
	["end"] = 5,
	["luck"] = 5,
	["perception"] = 10,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Slash"] = 5,
	["Ichor"] = 15,
}

ENT.hp = 150
ENT.armor = 50

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 100,
	["Blight"] = -50,
	["Shard"] = -50,
	["Distort"] = 0,
	
	["Fire"] = 50,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 0,
	["Electric"] = 0,
}

ENT.actions = {
	"slash",
	"stab",
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