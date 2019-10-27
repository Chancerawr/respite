ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Babu"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/zombie/babu.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 0,
	["str"] = 15,
	["accuracy"] = 5,
	["end"] = 50,
	["luck"] = 5,
	["perception"] = 5,
	["fortitude"] = 0,
}

function ENT:Initialize()
	timer.Simple(0.6, function()
		self:ResetSequence("idle01")
	end)

	self:basicSetup()
end