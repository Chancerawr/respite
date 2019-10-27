ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Flesh Mannequin"
ENT.Category = "NutScript - Combat (Fiend)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/nh2_gmn/dave_the_dummy_on_stand.mdl"
ENT.noRag = true

--all attributes
ENT.attribs = {
	["stm"] = 10,
	["str"] = 0,
	["accuracy"] = 0,
	["end"] = 0,
	["luck"] = 1,
	["perception"] = 0,
	["fortitude"] = 30,
}

function ENT:Initialize()
	self:SetMaterial("models/flesh")

	self:basicSetup()
end