ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Demon"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Demon"
ENT.model = "models/nh2zombies/friendly.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 20,
	["str"] = 15,
	["accuracy"] = 5,
	["end"] = 8,
	["luck"] = 5,
	["perception"] = 0,
	["fortitude"] = 0,
}

function ENT:Initialize()
	self:basicSetup()
end