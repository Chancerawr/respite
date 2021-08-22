ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Forgotten"
ENT.Category = "NutScript - Combat (Other)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Forgotten"
ENT.model = "models/Humans/Group01/Male_04.mdl"
ENT.color = Color(128, 0, 128)

--all attributes
ENT.attribs = {
	["stm"] = 10,
	["str"] = 10,
	["accuracy"] = 10,
	["end"] = 10,
	["luck"] = 10,
	["perception"] = 10,
	["fortitude"] = 5,
}

function ENT:Initialize()
	self:SetSubMaterial(2, "models/props_combine/tpballglow")

	self:basicSetup()
end