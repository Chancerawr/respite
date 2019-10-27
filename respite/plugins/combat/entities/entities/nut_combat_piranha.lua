ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Piranha"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/gunship.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 25,
	["str"] = 30,
	["accuracy"] = 50,
	["end"] = 30,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 0,
}

function ENT:Initialize()
	self:SetColor(Color(130, 220, 130, 255))
	self:SetMaterial("models/flesh")

	self:basicSetup()
end