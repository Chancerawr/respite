ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Behemoth"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Behemoth"
ENT.model = "models/sin/quadralex.mdl"

--all attributes
ENT.agil = 10
ENT.stre = 70
ENT.accu = 40
ENT.craf = 0
ENT.endu = 50
ENT.luck = 0
ENT.perc = 0
ENT.fort = 0

function ENT:Initialize()
	self:basicSetup()
end