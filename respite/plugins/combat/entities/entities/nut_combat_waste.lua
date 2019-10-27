ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Waste"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/prosperity/freak.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 5,
	["str"] = 10,
	["accuracy"] = 10,
	["end"] = 10,
	["luck"] = 1,
	["perception"] = 0,
	["fortitude"] = 0,
}

function ENT:Initialize()
	self:basicSetup()
end