ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Spore"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/respite/spore.mdl"
ENT.name = "Lump"

--all attributes
ENT.attribs = {
	["stm"] = 3,
	["str"] = 4,
	["accuracy"] = 4,
	["end"] = 6,
	["luck"] = 0,
	["perception"] = 2,
	["fortitude"] = 0,
}

function ENT:Initialize()
	self:basicSetup()
end