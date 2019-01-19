ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Ghoul"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/zombie/kuszo.mdl"

--all attributes
ENT.agil = 20
ENT.stre = 15
ENT.accu = 5
ENT.craf = 0
ENT.endu = 0
ENT.luck = 4
ENT.perc = 0
ENT.fort = 0

function ENT:Initialize()
	self:basicSetup()
end