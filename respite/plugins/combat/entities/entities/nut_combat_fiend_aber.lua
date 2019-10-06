ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Blood Stalker"
ENT.Category = "NutScript - Combat (Fiend)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Blood Stalker"
ENT.model = "models/spite/fiend.mdl"

--all attributes
ENT.agil = 30
ENT.stre = 30
ENT.accu = 30
ENT.craf = 30
ENT.endu = 30
ENT.luck = 30
ENT.perc = 30
ENT.fort = 50

function ENT:Initialize()
	self:basicSetup()
	
	if (SERVER) then
		self:SetMaterial("models/flesh")
		self:SetColor(Color(128, 20, 20))
	end
end