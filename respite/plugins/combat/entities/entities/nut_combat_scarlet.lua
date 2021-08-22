ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Scarlet"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Dollmother"
ENT.model = "models/spite/scarlet.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 10,
	["str"] = 15,
	["accuracy"] = 20,
	["end"] = 10,
	["luck"] = 1,
	["perception"] = 15,
	["fortitude"] = 0,
}

function ENT:Initialize()
	self:basicSetup()
end