ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Dog"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/zombie/dog.mdl"

--all attributes
ENT.agil = 15
ENT.stre = 18
ENT.accu = 10
ENT.craf = 0
ENT.endu = 10
ENT.luck = 5
ENT.perc = 50
ENT.fort = 0

function ENT:Initialize()
	self:basicSetup()
end