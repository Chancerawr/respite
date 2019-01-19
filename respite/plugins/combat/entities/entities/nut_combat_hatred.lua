ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Hatred"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/zombie/hatred.mdl"

--all attributes
ENT.agil = 25
ENT.stre = 40
ENT.accu = 25
ENT.craf = 0
ENT.endu = 50
ENT.luck = 0
ENT.perc = 0
ENT.fort = 0

function ENT:Initialize()
	self:basicSetup()
end