ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Belmer"
ENT.Category = "NutScript - Combat (Wraith)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.noRag = true

ENT.model = "models/chillax_sf2/silenthill/sh2/mannequin/mannequin.mdl"

--all attributes
ENT.agil = 20
ENT.stre = 20
ENT.accu = 10
ENT.craf = 0
ENT.endu = 20
ENT.luck = 5
ENT.perc = 0
ENT.fort = 10

function ENT:Initialize()
	self:SetMaterial("models/props_lab/security_screens")
	
	self:basicSetup()
end