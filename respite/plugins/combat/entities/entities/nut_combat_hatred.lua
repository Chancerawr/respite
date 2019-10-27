ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Hatred"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/zombie/hatred.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 25,
	["str"] = 40,
	["accuracy"] = 25,
	["end"] = 50,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 0,
}

function ENT:Initialize()
	self:basicSetup()
end