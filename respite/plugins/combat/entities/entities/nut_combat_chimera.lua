ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Chimera"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/ninja/signalvariance/monsters/chimera.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 20,
	["str"] = 20,
	["accuracy"] = 20,
	["end"] = 15,
	["luck"] = 5,
	["perception"] = 10,
	["fortitude"] = 5,
}

function ENT:Initialize()
	self:basicSetup()
end