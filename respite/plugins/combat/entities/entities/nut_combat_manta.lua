ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Manta"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/combine_dropship.mdl"

--all attributes
ENT.agil = 10
ENT.stre = 60
ENT.accu = 30
ENT.craf = 0
ENT.endu = 60
ENT.luck = 0
ENT.perc = 0
ENT.fort = 0

function ENT:Initialize()
	self:SetColor(Color(130, 220, 130, 255))
	self:SetMaterial("models/flesh")

	self:basicSetup()
end