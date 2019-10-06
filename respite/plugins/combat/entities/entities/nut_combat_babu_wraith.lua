ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Babu Wraith"
ENT.Category = "NutScript - Combat (Wraith)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/zombie/babu.mdl"

--all attributes
ENT.agil = 30
ENT.stre = 40
ENT.accu = 0
ENT.craf = 0
ENT.endu = 50
ENT.luck = 0
ENT.perc = 0
ENT.fort = 0

function ENT:Initialize()
	self:SetMaterial("models/props_lab/security_screens")

	timer.Simple(0.6, function()
		self:ResetSequence("idle01")
	end)
	
	self:basicSetup()
end