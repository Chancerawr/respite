ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Waste"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/prosperity/freak.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 3,
	["str"] = 6,
	["accuracy"] = 4,
	["end"] = 4,
	["luck"] = 0,
	["perception"] = 2,
	["fortitude"] = 3,
}

function ENT:Initialize()
	self:basicSetup()
end