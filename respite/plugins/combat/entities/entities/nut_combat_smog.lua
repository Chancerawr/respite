ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Smog"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/sient hill custom/Homecoming/smog.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 5,
	["str"] = 10,
	["accuracy"] = 25,
	["end"] = 5,
	["luck"] = 1,
	["perception"] = 0,
	["fortitude"] = 0,
}

function ENT:Initialize()
	self:basicSetup()
end