ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Vomit"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/zombie/zombie_vomit.mdl"
ENT.name = "Vomit"

--all attributes
ENT.attribs = {
	["stm"] = 4,
	["str"] = 2,
	["accuracy"] = 5,
	["end"] = 6,
	["luck"] = 2,
	["perception"] = 4,
	["fortitude"] = 0,
}

function ENT:Initialize()
	self:basicSetup()
end