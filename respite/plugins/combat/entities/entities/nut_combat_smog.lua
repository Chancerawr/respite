ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Smog"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/sient hill custom/Homecoming/smog.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 4,
	["str"] = 8,
	["accuracy"] = 5,
	["end"] = 5,
	["luck"] = 1,
	["perception"] = 5,
	["fortitude"] = 0,
}

function ENT:Initialize()
	self:basicSetup()
end