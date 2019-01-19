ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Waste"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/prosperity/freak.mdl"

--all attributes
ENT.agil = 5
ENT.stre = 10
ENT.accu = 10
ENT.craf = 0
ENT.endu = 10
ENT.luck = 1
ENT.perc = 0
ENT.fort = 0

function ENT:Initialize()
	self:basicSetup()
end