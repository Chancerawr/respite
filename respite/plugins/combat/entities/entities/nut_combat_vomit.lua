ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Vomit"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/zombie/zombie_vomit.mdl"
ENT.name = "Vomit"

--all attributes
ENT.attribs = {
	["stm"] = 7,
	["str"] = 7,
	["accuracy"] = 20,
	["end"] = 15,
	["luck"] = 4,
	["perception"] = 15,
	["fortitude"] = 0,
}

function ENT:Initialize()
	self:basicSetup()
end