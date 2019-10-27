ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Hunter"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/sin/leperkin.mdl"
ENT.name = "Hunter"

--all attributes
ENT.attribs = {
	["stm"] = 12,
	["str"] = 20,
	["accuracy"] = 12,
	["end"] = 10,
	["luck"] = 5,
	["perception"] = 0,
	["fortitude"] = 0,
}

function ENT:Initialize()
	self:basicSetup()
end