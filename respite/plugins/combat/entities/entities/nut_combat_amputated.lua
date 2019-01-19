ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Amputated"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/am_npc/amputated.mdl"

--all attributes
ENT.agil = 5
ENT.stre = 15
ENT.accu = 5
ENT.craf = 0
ENT.endu = 5
ENT.luck = 0
ENT.perc = 0
ENT.fort = 0

function ENT:Initialize()
	self:basicSetup()
end