ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Ghoul"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/zombie/kuszo.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 20,
	["str"] = 15,
	["accuracy"] = 5,
	["end"] = 0,
	["luck"] = 4,
	["perception"] = 0,
	["fortitude"] = 0,
}

function ENT:Initialize()
	self:basicSetup()
end