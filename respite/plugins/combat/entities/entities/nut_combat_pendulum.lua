ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Pendulum"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/sient hill custom/Homecoming/pendulum.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 40,
	["str"] = 40,
	["accuracy"] = 30,
	["end"] = 25,
	["luck"] = 5,
	["perception"] = 0,
	["fortitude"] = 0,
}

function ENT:Initialize()
	self:basicSetup()
end