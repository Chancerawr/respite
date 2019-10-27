ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Manuscript"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/respite/paperzombie.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 20,
	["str"] = 10,
	["accuracy"] = 10,
	["end"] = 0,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 10,
}

function ENT:Initialize()
	self:basicSetup()
end