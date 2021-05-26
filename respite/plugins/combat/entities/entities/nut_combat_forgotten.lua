ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Forgotten"
ENT.Category = "NutScript - Combat (Other)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Forgotten"
ENT.model = "models/Humans/Group01/Male_04.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 50,
	["str"] = 50,
	["accuracy"] = 50,
	["end"] = 50,
	["luck"] = 50,
	["perception"] = 50,
	["fortitude"] = 5,
}

function ENT:Initialize()
	self:SetColor(Color(128, 0, 128, 255))
	self:SetSubMaterial(2, "models/props_combine/tpballglow")

	self:basicSetup()
end