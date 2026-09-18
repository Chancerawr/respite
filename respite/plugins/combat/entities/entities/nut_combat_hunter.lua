ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Hunter"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.NPCReference = "resp_leperkin"

ENT.name = "Hunter"

ENT.model = "models/sin/leperkin.mdl"

ENT.AttackAnim = "Melee"

--all attributes
ENT.attribs = {
	["stm"] = 12,
	["str"] = 15,
	["accuracy"] = 12,
	["end"] = 10,
	["luck"] = 5,
	["perception"] = 0,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Slash"] = 20,
}

ENT.hp = 200
ENT.armor = 0

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
	"whack",
}

ENT.StepData = {
	0,
	0.5,
}

ENT.FootstepSounds = {
	"npc/leperkin/leperkin_step1.mp3",
	"npc/leperkin/leperkin_step2.mp3",
	"npc/leperkin/leperkin_step3.mp3",
	"npc/leperkin/leperkin_step4.mp3",
}