ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Babu"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/zombie/babu.mdl"

--all attributes
ENT.agil = 0
ENT.stre = 15
ENT.accu = 5
ENT.craf = 0
ENT.endu = 50
ENT.luck = 5
ENT.perc = 5
ENT.fort = 0

function ENT:Initialize()
	self:basicSetup()
end