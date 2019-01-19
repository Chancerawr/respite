ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Crawler"
ENT.Category = "NutScript - Combat (Shade)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/angelsaur/ghost_girl.mdl"

--all attributes
ENT.agil = 10
ENT.stre = 10
ENT.accu = 0
ENT.craf = 0
ENT.endu = 0
ENT.luck = 0
ENT.perc = 0
ENT.fort = 50

function ENT:Initialize()
	ParticleEffectAttach("Advisor_Pod_Explosion_Smoke", 1, self, 1)

	self:basicSetup()
end