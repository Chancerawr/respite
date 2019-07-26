ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Portal Fiend"
ENT.Category = "NutScript - Combat (Fiend)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Portal Blood Fiend"
ENT.model = "models/spite/fiend.mdl"

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
	
	if (SERVER) then
		self:SetMaterial("models/flesh")
		self:SetColor(Color(128, 20, 20))
	end
end