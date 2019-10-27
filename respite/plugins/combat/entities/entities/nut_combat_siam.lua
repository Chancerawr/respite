ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Slam"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/sient hill custom/Homecoming/siam.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 15,
	["str"] = 50,
	["accuracy"] = 35,
	["end"] = 35,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 0,
}

function ENT:Initialize()
	self:basicSetup()
end