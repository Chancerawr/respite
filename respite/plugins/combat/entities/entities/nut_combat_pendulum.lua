ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Pendulum"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/sient hill custom/Homecoming/pendulum.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 15,
	["str"] = 20,
	["accuracy"] = 15,
	["end"] = 15,
	["luck"] = 5,
	["perception"] = 2,
	["fortitude"] = 0,
}

function ENT:Initialize()
	self:basicSetup()
end