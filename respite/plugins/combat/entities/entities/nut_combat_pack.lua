ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Pack"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/spite/pack.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 10,
	["str"] = 5,
	["accuracy"] = 10,
	["end"] = 4,
	["luck"] = 5,
	["perception"] = 2,
	["fortitude"] = 0,
}

function ENT:Initialize()
	self:basicSetup()
end