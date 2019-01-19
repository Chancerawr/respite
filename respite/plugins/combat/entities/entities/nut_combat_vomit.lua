ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Vomit"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/zombie/zombie_vomit.mdl"
ENT.name = "Vomit"

--all attributes
ENT.agil = 7
ENT.stre = 7
ENT.accu = 20
ENT.craf = 0
ENT.endu = 15
ENT.luck = 4
ENT.perc = 15
ENT.fort = 0

function ENT:Initialize()
	self:basicSetup()
end