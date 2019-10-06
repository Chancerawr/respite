ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Flesh Mannequin"
ENT.Category = "NutScript - Combat (Fiend)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/nh2_gmn/dave_the_dummy_on_stand.mdl"
ENT.noRag = true

--all attributes
ENT.agil = 0
ENT.stre = 0
ENT.accu = 0
ENT.craf = 0
ENT.endu = 0
ENT.luck = 1
ENT.perc = 0
ENT.fort = 30

function ENT:Initialize()
	self:SetMaterial("models/flesh")

	self:basicSetup()
end