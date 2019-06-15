ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Smog"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/sient hill custom/Homecoming/smog.mdl"

--all attributes
ENT.agil = 5
ENT.stre = 10
ENT.accu = 25
ENT.craf = 0
ENT.endu = 5
ENT.luck = 1
ENT.perc = 0
ENT.fort = 0

function ENT:Initialize()
	self:basicSetup()
end