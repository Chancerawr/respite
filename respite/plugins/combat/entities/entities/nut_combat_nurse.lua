ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Nurse"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Nurse"
ENT.model = "models/chillax_sf2/silenthill/sh2/nurse/nurse.mdl"
ENT.noRag = true

--all attributes
ENT.attribs = {
	["stm"] = 8,
	["str"] = 15,
	["accuracy"] = 15,
	["end"] = 15,
	["luck"] = 0,
	["perception"] = 10,
	["fortitude"] = 10,
}

ENT.dmg = {
	["Blunt"] = 25,
}

ENT.hp = 220
ENT.armor = 50

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
	["Poison"] = 100,
	["Electric"] = 0,
}

ENT.actions = {
	"whack",
	"repair_doll",
}

function ENT:Initialize()
	self:basicSetup()
end