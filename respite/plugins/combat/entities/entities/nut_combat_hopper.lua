ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Hopper"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/sin/hopper.mdl"
ENT.name = "Hopper"

--all attributes
ENT.attribs = {
	["stm"] = 20,
	["str"] = 15,
	["accuracy"] = 25,
	["end"] = 10,
	["luck"] = 5,
	["perception"] = 10,
	["fortitude"] = 0,
}

function ENT:Initialize()
	self:basicSetup()
end