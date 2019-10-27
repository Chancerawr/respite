ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Belmer"
ENT.Category = "NutScript - Combat (Wraith)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.noRag = true

ENT.model = "models/chillax_sf2/silenthill/sh2/mannequin/mannequin.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 20,
	["str"] = 20,
	["accuracy"] = 10,
	["medical"] = 0,
	["end"] = 20,
	["luck"] = 5,
	["perception"] = 0,
	["fortitude"] = 10,
}

function ENT:Initialize()
	self:SetMaterial("models/props_lab/security_screens")
	
	self:basicSetup()
end