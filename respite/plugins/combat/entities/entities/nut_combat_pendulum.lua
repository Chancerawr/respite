ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Pendulum"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/sient hill custom/Homecoming/pendulum.mdl"

--all attributes
ENT.agil = 40
ENT.stre = 40
ENT.accu = 30
ENT.craf = 0
ENT.endu = 25
ENT.luck = 5
ENT.perc = 0
ENT.fort = 0

function ENT:Initialize()
	self:basicSetup()
end