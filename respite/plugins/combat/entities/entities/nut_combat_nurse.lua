ENT.Type = "nextbot"
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
	["stm"] = 8,
	["str"] = 15,
	["accuracy"] = 15,
	["end"] = 15,
	["luck"] = 0,
	["perception"] = 10,
	["fortitude"] = 10,
}

function ENT:Initialize()
	self:basicSetup()
end