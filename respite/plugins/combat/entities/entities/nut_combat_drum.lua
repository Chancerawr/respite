ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Drum"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/zombie/zombineplayer.mdl"

--all attributes
ENT.agil = 0
ENT.stre = 50
ENT.accu = 20
ENT.craf = 0
ENT.endu = 40
ENT.luck = 0
ENT.perc = 0
ENT.fort = 0

function ENT:Initialize()
	self:SetColor(Color(130, 220, 130, 255))
	self:SetMaterial("models/flesh")
	
	timer.Simple(0.6, function()
		self:SetModelScale(1.8)
		self:ResetSequence("zombie_walk_06")
	end)

	self:basicSetup()
end