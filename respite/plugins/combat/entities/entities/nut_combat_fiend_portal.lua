ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Portal Fiend"
ENT.Category = "NutScript - Combat (Fiend)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Cracked Blood Fiend"
ENT.model = "models/Zombie/Poison.mdl"

--all attributes
ENT.agil = 0
ENT.stre = 50
ENT.accu = 50
ENT.craf = 0
ENT.endu = 50
ENT.luck = 0
ENT.perc = 0
ENT.fort = 0

function ENT:Initialize()
	self:basicSetup()
	
	self:SetMaterial("models/flesh")
	self:SetColor(Color(128, 20, 128))
	
	timer.Simple(0.6, function()
		self:SetModelScale(1.8)
	end)
end