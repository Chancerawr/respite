ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Dog"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/zombie/dog.mdl"

ENT.AttackAnim = "Attack"

--all attributes
ENT.attribs = {
	["stm"] = 15,
	["str"] = 12,
	["accuracy"] = 10,
	["end"] = 5,
	["luck"] = 5,
	["perception"] = 50,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Slash"] = 15,
}

ENT.hp = 120
ENT.armor = 30

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
	["Electric"] = 25,
}

ENT.actions = {
	"maw_bite",
}

function ENT:Initialize()
	self:basicSetup()
end