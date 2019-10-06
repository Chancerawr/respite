ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Gemini Wraith"
ENT.Category = "NutScript - Combat (Wraith)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/zombie/gemini.mdl"

--all attributes
ENT.agil = 30
ENT.stre = 40
ENT.accu = 10
ENT.craf = 0
ENT.endu = 30
ENT.luck = 0
ENT.perc = 30
ENT.fort = 0

function ENT:Initialize()
	self:basicSetup()
	
	if (SERVER) then
		self:SetMaterial("models/props_lab/security_screens")
	end	
end