ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Hunter"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/sin/leperkin.mdl"
ENT.name = "Hunter"

--all attributes
ENT.agil = 12
ENT.stre = 20
ENT.accu = 12
ENT.craf = 0
ENT.endu = 10
ENT.luck = 5
ENT.perc = 0
ENT.fort = 0

function ENT:Initialize()
	self:basicSetup()
end