ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Lurker"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/sient hill custom/Homecoming/lurker.mdl"

--all attributes
ENT.agil = 15
ENT.stre = 30
ENT.accu = 20
ENT.craf = 0
ENT.endu = 20
ENT.luck = 5
ENT.perc = 5
ENT.fort = 0

function ENT:Initialize()
	self:basicSetup()
end