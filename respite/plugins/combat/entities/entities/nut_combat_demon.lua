ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Demon"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Demon"
ENT.model = "models/nh2zombies/friendly.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 15,
	["str"] = 10,
	["accuracy"] = 5,
	["end"] = 5,
	["luck"] = 5,
	["perception"] = 0,
	["fortitude"] = 0,
}

function ENT:Initialize()
	self:basicSetup()
end