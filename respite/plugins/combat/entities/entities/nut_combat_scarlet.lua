ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Scarlet"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Dollmother"
ENT.model = "models/spite/scarlet.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 10,
	["str"] = 15,
	["accuracy"] = 20,
	["end"] = 10,
	["luck"] = 1,
	["perception"] = 15,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Blunt"] = 20,
}

ENT.hp = 300
ENT.armor = 50

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
	"mawed_bite",
	"repair_doll",
}

function ENT:Initialize()
	self:basicSetup()
end