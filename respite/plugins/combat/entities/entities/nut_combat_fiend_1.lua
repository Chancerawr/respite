ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Fiend (5)"
ENT.Category = "NutScript - Combat (Fiend)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Blood Fiend"
ENT.model = "models/spite/fiend.mdl"

--all attributes
ENT.agil = 5
ENT.stre = 5
ENT.accu = 5
ENT.craf = 5
ENT.endu = 5
ENT.luck = 5
ENT.perc = 5
ENT.fort = 5

function ENT:Initialize()
	self:basicSetup()
	
	if (SERVER) then
		self:SetMaterial("models/flesh")
		self:SetColor(Color(128, 20, 20))
	end
end