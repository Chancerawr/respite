ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Smog"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/sient hill custom/Homecoming/smog.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 4,
	["str"] = 8,
	["accuracy"] = 5,
	["end"] = 5,
	["luck"] = 1,
	["perception"] = 5,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Fire"] = 20,
}

ENT.hp = 100
ENT.armor = 15

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 0,
	["Blight"] = -50,
	["Shard"] = 100,
	["Distort"] = 0,
	
	["Fire"] = 50,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 0,
	["Electric"] = 0,
}

ENT.actions = {
	"smog",
	"mawed_bite",
}

function ENT:Initialize()
	self:basicSetup()
end