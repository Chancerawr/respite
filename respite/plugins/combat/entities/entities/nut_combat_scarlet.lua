ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Scarlet"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Puppet"
ENT.model = "models/spite/scarlet.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 10,
	["str"] = 40,
	["accuracy"] = 12,
	["end"] = 30,
	["luck"] = 10,
	["perception"] = 5,
	["fortitude"] = 0,
}

function ENT:Initialize()
	self:basicSetup()
end