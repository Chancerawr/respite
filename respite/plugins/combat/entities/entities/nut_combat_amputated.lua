ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Amputated"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/am_npc/amputated.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 5,
	["str"] = 15,
	["accuracy"] = 5,
	["end"] = 5,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 0,
}

function ENT:Initialize()
	self:basicSetup()
end