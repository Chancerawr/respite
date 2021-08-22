ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Ghoul"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/zombie/kuszo.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 10,
	["str"] = 4,
	["accuracy"] = 5,
	["end"] = 0,
	["luck"] = 4,
	["perception"] = 7,
	["fortitude"] = 7,
}

function ENT:Initialize()
	self:basicSetup()
end