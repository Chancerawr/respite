ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Chimera"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/ninja/signalvariance/monsters/chimera.mdl"

--all attributes
ENT.agil = 20
ENT.stre = 20
ENT.accu = 20
ENT.craf = 0
ENT.endu = 15
ENT.luck = 5
ENT.perc = 10
ENT.fort = 5

function ENT:Initialize()
	self:basicSetup()
end