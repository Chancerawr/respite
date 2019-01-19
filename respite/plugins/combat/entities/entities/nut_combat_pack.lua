ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Pack"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/spite/pack.mdl"

--all attributes
ENT.agil = 20
ENT.stre = 5
ENT.accu = 10
ENT.craf = 0
ENT.endu = 2
ENT.luck = 5
ENT.perc = 2
ENT.fort = 0

function ENT:Initialize()
	self:basicSetup()
end