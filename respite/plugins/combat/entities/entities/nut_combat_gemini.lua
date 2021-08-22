ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Gemini"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/zombie/gemini.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 15,
	["str"] = 20,
	["accuracy"] = 15,
	["end"] = 15,
	["luck"] = 10,
	["perception"] = 20,
	["fortitude"] = 0,
}

function ENT:Initialize()
	self:basicSetup()
end