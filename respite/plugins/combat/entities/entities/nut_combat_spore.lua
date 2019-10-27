ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Spore"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/respite/spore.mdl"
ENT.name = "Spore"

--all attributes
ENT.attribs = {
	["stm"] = 5,
	["str"] = 10,
	["accuracy"] = 10,
	["end"] = 10,
	["luck"] = 0,
	["perception"] = 15,
	["fortitude"] = 0,
}

function ENT:Initialize()
	self:basicSetup()
end