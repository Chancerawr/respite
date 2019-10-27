ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Helicopter"
ENT.Category = "NutScript - Combat (Other)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.noRag = true

ENT.model = "models/combine_helicopter.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 20,
	["str"] = 20,
	["accuracy"] = 40,
	["end"] = 40,
	["luck"] = 15,
	["perception"] = 30,
	["fortitude"] = 0,
}

function ENT:Initialize()
	self:basicSetup()
end