ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Demon"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Demon"
ENT.model = "models/nh2zombies/friendly.mdl"

--all attributes
ENT.agil = 20
ENT.stre = 15
ENT.accu = 5
ENT.craf = 0
ENT.endu = 8
ENT.luck = 5
ENT.perc = 0
ENT.fort = 0

function ENT:Initialize()
	self:basicSetup()
end