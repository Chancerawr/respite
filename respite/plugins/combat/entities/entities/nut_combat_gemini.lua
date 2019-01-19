ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Gemini"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/zombie/gemini.mdl"

--all attributes
ENT.agil = 20
ENT.stre = 35
ENT.accu = 15
ENT.craf = 0
ENT.endu = 25
ENT.luck = 10
ENT.perc = 50
ENT.fort = 0

function ENT:Initialize()
	self:basicSetup()
end