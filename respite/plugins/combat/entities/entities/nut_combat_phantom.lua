ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Phantom"
ENT.Category = "NutScript - Combat (Wraith)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.NPCReference = "resp_phantom"

ENT.model = "models/zombie/junkie_01.mdl"
ENT.material = "models/effects/comball_glow1"

ENT.AttackAnim = "AttackA"

--all attributes
ENT.attribs = {
	["stm"] = 3,
	["str"] = 15,
	["accuracy"] = 5,
	["end"] = 20,
	["luck"] = 5,
	["perception"] = 5,
	["fortitude"] = 5,
}

ENT.dmg = {
	["Blunt"] = 10,
	["Ichor"] = 10,
}

ENT.hp = 140
ENT.armor = 0

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 100,
	["Blight"] = -50,
	["Shard"] = -50,
	["Distort"] = 0,
	
	["Fire"] = 0,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 0,
	["Electric"] = 0,
}

ENT.actions = {
	"whack",
}

ENT.StepData = {
	0.25,
	0.75,
}

ENT.FootstepSounds = {
	"npc/zombie/foot1.wav",
	"npc/zombie/foot2.wav",
	"npc/zombie/foot3.wav",
}