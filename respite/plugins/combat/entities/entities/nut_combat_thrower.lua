ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Thrower"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/player/zombie_fast.mdl"
ENT.material = "models/flesh"
ENT.color = Color(155, 255, 155)

--all attributes
ENT.attribs = {
	["stm"] = 5,
	["str"] = 20,
	["accuracy"] = 4,
	["end"] = 7,
	["luck"] = 0,
	["perception"] = 5,
	["fortitude"] = 0,
}

function ENT:Initialize()
	timer.Simple(0.6, function()
		self:SetModelScale(1.2)
		self:ResetSequence("zombie_walk_01")
	end)

	self:basicSetup()
end