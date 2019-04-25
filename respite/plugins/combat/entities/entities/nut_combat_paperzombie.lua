ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Manuscript"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/respite/paperzombie.mdl"

--all attributes
ENT.agil = 20
ENT.stre = 10
ENT.accu = 10
ENT.craf = 0
ENT.endu = 0
ENT.luck = 0
ENT.perc = 0
ENT.fort = 10

function ENT:Initialize()
	self:basicSetup()
end