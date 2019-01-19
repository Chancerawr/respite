ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Hopper"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/sin/hopper.mdl"
ENT.name = "Hopper"

--all attributes
ENT.agil = 20
ENT.stre = 15
ENT.accu = 25
ENT.craf = 0
ENT.endu = 10
ENT.luck = 5
ENT.perc = 10
ENT.fort = 0

function ENT:Initialize()
	self:basicSetup()
end