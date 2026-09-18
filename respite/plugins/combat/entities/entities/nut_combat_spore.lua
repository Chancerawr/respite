ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Spore"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.NPCReference = "resp_spore"

ENT.name = "Lump"

ENT.model = "models/respite/spore.mdl"

ENT.AttackAnim = "Attack1"

--all attributes
ENT.attribs = {
	["stm"] = 3,
	["str"] = 4,
	["accuracy"] = 4,
	["end"] = 6,
	["luck"] = 0,
	["perception"] = 2,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Blunt"] = 5,
	["Poison"] = 5,
}

ENT.hp = 80
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
	"poison_release",
}

ENT.StepData = {
	0.25,
	0.75,
}

ENT.StepPitch = {95,105}
ENT.FootstepSounds = {
	"respite/spore/foot1.wav",
	"respite/spore/foot2.wav",
	"respite/spore/foot3.wav",
	"respite/spore/foot4.wav",
	"respite/spore/foot5.wav",
}