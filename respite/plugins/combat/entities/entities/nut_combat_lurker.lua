ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Lurker"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/sient hill custom/Homecoming/lurker.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 14,
	["str"] = 18,
	["accuracy"] = 14,
	["end"] = 12,
	["luck"] = 5,
	["perception"] = 5,
	["fortitude"] = 0,
}

function ENT:Initialize()
	self:basicSetup()
end