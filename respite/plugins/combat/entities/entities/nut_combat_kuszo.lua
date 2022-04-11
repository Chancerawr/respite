ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Ghoul"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/zombie/kuszo.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 10,
	["str"] = 4,
	["accuracy"] = 5,
	["end"] = 0,
	["luck"] = 4,
	["perception"] = 7,
	["fortitude"] = 7,
}

ENT.dmg = {
	["Slash"] = 10,
}

ENT.hp = 60
ENT.armor = 0

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
	["Electric"] = 0,
}

ENT.actions = {
	"slash",
	"mawed_bite",
}

function ENT:Initialize()
	self:basicSetup()
end