ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Dolly"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/zombie/2.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 20,
	["str"] = 7,
	["accuracy"] = 7,
	["end"] = 5,
	["luck"] = 5,
	["perception"] = 5,
	["fortitude"] = 0,
}

function ENT:Initialize()
	self:basicSetup()
end