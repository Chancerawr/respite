ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Spore"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/respite/spore.mdl"
ENT.name = "Spore"

--all attributes
ENT.agil = 0
ENT.stre = 10
ENT.accu = 0
ENT.craf = 0
ENT.endu = 10
ENT.luck = 0
ENT.perc = 15
ENT.fort = 0

function ENT:Initialize()
	self:basicSetup()
end