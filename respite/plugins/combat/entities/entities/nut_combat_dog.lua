ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Dog"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/zombie/dog.mdl"

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

function ENT:Initialize()
	self:basicSetup()
end