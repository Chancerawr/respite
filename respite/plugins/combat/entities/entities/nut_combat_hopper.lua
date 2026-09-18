ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Hopper"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.NPCReference = "resp_leperkin"

ENT.model = "models/sin/hopper.mdl"
ENT.name = "Hopper"

ENT.AttackAnim = "Morph_In"
ENT.WalkAnim = "Run_Fast"
ENT.WalkAnim = "Run_Fast"

--all attributes
ENT.attribs = {
	["stm"] = 15,
	["str"] = 10,
	["accuracy"] = 20,
	["end"] = 10,
	["luck"] = 5,
	["perception"] = 10,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Acid"] = 20,
}

ENT.hp = 280
ENT.armor = 100

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
	["Acid"] = 50,
	["Poison"] = 25,
	["Electric"] = 0,
}

ENT.actions = {
	"slash",
	"acid_spit",
}

ENT.StepData = {
	0.25,
	0.75,
}

ENT.FootstepSounds = {
	"npc/leperkin/leperkin_step1.mp3",
	"npc/leperkin/leperkin_step2.mp3",
	"npc/leperkin/leperkin_step3.mp3",
	"npc/leperkin/leperkin_step4.mp3",
}