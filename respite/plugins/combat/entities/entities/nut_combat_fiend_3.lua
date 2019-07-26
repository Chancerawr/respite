ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Fiend (15)"
ENT.Category = "NutScript - Combat (Fiend)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Blood Fiend"
ENT.model = "models/spite/fiend.mdl"

--all attributes
ENT.agil = 15
ENT.stre = 15
ENT.accu = 15
ENT.craf = 15
ENT.endu = 15
ENT.luck = 15
ENT.perc = 15
ENT.fort = 15

function ENT:Initialize()
	self:basicSetup()
	
	if (SERVER) then
		self:SetMaterial("models/flesh")
		self:SetColor(Color(128, 20, 20))
	end
end