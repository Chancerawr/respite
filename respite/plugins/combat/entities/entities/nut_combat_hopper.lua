ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Hopper"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/sin/hopper.mdl"
ENT.name = "Hopper"

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

function ENT:Initialize()
	self:basicSetup()
end