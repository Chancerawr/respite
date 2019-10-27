ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Thrower"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/player/zombie_fast.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 10,
	["str"] = 35,
	["accuracy"] = 35,
	["end"] = 15,
	["luck"] = 0,
	["perception"] = 15,
	["fortitude"] = 0,
}

function ENT:Initialize()
	self:SetColor(Color(155, 255, 155, 255))
	self:SetMaterial("models/flesh")
	
	timer.Simple(0.6, function()
		self:SetModelScale(1.2)
		self:ResetSequence("zombie_walk_01")
	end)

	self:basicSetup()
end