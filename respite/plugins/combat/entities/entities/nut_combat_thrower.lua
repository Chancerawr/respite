ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Thrower"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/player/zombie_fast.mdl"

--all attributes
ENT.agil = 10
ENT.stre = 35
ENT.accu = 35
ENT.craf = 0
ENT.endu = 15
ENT.luck = 0
ENT.perc = 15
ENT.fort = 0

function ENT:Initialize()
	self:SetColor(Color(155, 255, 155, 255))
	self:SetMaterial("models/flesh")
	
	timer.Simple(0.6, function()
		self:SetModelScale(1.2)
		self:ResetSequence("zombie_walk_01")
	end)

	self:basicSetup()
end