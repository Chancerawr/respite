ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Mawed Fiend (Stage 3)"
ENT.Category = "NutScript - Combat (Fiend)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Mawed Blood Fiend"
ENT.model = "models/spite/fiend.mdl"

--all attributes
ENT.agil = 20
ENT.stre = 25
ENT.accu = 20
ENT.craf = 0
ENT.endu = 40
ENT.luck = 5
ENT.perc = 0
ENT.fort = 0

function ENT:Initialize()
	self:basicSetup()
	
	timer.Simple(0.6, function()
		self:SetModelScale(1.2)
		self:ResetSequence("idle_all_angry")
	end)
	
	if (SERVER) then
		self:SetMaterial("models/flesh")
		self:SetColor(Color(128, 20, 20))
	end
end