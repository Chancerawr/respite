ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Manuscript"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/respite/paperzombie.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 10,
	["str"] = 10,
	["accuracy"] = 10,
	["end"] = 2,
	["luck"] = 0,
	["perception"] = 2,
	["fortitude"] = 0,
}

function ENT:Initialize()
	self:basicSetup()
end