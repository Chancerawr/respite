ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Gemini"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/zombie/gemini.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 20,
	["str"] = 35,
	["accuracy"] = 15,
	["end"] = 25,
	["luck"] = 10,
	["perception"] = 50,
	["fortitude"] = 0,
}

function ENT:Initialize()
	self:basicSetup()
end