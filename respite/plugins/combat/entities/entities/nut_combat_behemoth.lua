ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Behemoth"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Behemoth"
ENT.model = "models/sin/quadralex.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 10,
	["str"] = 50,
	["accuracy"] = 20,
	["end"] = 50,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 0,
}

function ENT:Initialize()
	self:basicSetup()
end