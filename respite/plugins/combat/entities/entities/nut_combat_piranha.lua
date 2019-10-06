ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Piranha"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/gunship.mdl"

--all attributes
ENT.agil = 25
ENT.stre = 30
ENT.accu = 50
ENT.craf = 0
ENT.endu = 30
ENT.luck = 0
ENT.perc = 0
ENT.fort = 0

function ENT:Initialize()
	self:SetColor(Color(130, 220, 130, 255))
	self:SetMaterial("models/flesh")

	self:basicSetup()
end