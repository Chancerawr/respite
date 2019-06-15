ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Slam"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/sient hill custom/Homecoming/siam.mdl"

--all attributes
ENT.agil = 15
ENT.stre = 50
ENT.accu = 35
ENT.craf = 0
ENT.endu = 35
ENT.luck = 0
ENT.perc = 0
ENT.fort = 0

function ENT:Initialize()
	self:basicSetup()
end