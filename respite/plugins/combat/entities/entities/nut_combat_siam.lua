ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Slam"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/sient hill custom/Homecoming/siam.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 5,
	["str"] = 30,
	["accuracy"] = 10,
	["end"] = 30,
	["luck"] = 0,
	["perception"] = 10,
	["fortitude"] = 0,
}

function ENT:Initialize()
	self:basicSetup()
end