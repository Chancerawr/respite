ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Nurse"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Nurse"
ENT.model = "models/chillax_sf2/silenthill/sh2/nurse/nurse.mdl"
ENT.noRag = true

--all attributes
ENT.attribs = {
	["stm"] = 25,
	["str"] = 25,
	["accuracy"] = 15,
	["end"] = 20,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 0,
}

function ENT:Initialize()
	self:basicSetup()
end