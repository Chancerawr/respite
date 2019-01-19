ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Baby"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/zombie/zombibaba.mdl"

--all attributes
ENT.agil = 20
ENT.stre = 5
ENT.accu = 5
ENT.craf = 0
ENT.endu = 5
ENT.luck = 5
ENT.perc = 5
ENT.fort = 0

function ENT:Initialize()
	self:basicSetup()
end