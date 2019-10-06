ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Nurse"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Nurse"
ENT.model = "models/chillax_sf2/silenthill/sh2/nurse/nurse.mdl"
ENT.noRag = true

--all attributes
ENT.agil = 25
ENT.stre = 25
ENT.accu = 15
ENT.craf = 0
ENT.endu = 20
ENT.luck = 0
ENT.perc = 0
ENT.fort = 0

function ENT:Initialize()
	self:basicSetup()
end