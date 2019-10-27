ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Baby"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/zombie/zombibaba.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 20,
	["str"] = 5,
	["accuracy"] = 5,
	["medical"] = 0,
	["end"] = 5,
	["luck"] = 5,
	["perception"] = 5,
	["fortitude"] = 0,
}

function ENT:Initialize()
	self:basicSetup()
end