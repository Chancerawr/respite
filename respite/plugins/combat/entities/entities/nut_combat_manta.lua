ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Manta"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/combine_dropship.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 10,
	["str"] = 60,
	["accuracy"] = 30,
	["end"] = 60,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 0,
}

function ENT:Initialize()
	self:SetColor(Color(130, 220, 130, 255))
	self:SetMaterial("models/flesh")

	self:basicSetup()
end