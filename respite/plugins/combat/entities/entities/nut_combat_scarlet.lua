ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Scarlet"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Puppet"
ENT.model = "models/spite/scarlet.mdl"

--all attributes
ENT.agil = 10
ENT.stre = 40
ENT.accu = 12
ENT.craf = 0
ENT.endu = 30
ENT.luck = 10
ENT.perc = 5
ENT.fort = 0

function ENT:Initialize()
	self:basicSetup()
end