ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Faceless"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/cryoffear/faceless/faceless3.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 10,
	["str"] = 15,
	["accuracy"] = 10,
	["end"] = 10,
	["luck"] = 0,
	["perception"] = 5,
	["fortitude"] = 0,
}

function ENT:Initialize()
	self:basicSetup()
end