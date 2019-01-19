ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Teleporter"
ENT.Category = "NutScript - Combat (Shade)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/predatorcz/amnesia/grunt.mdl"

--all attributes
ENT.agil = 30
ENT.stre = 30
ENT.accu = 10
ENT.craf = 0
ENT.endu = 0
ENT.luck = 0
ENT.perc = 0
ENT.fort = 25

function ENT:Initialize()
	self:basicSetup()
	
	ParticleEffectAttach("Advisor_Pod_Explosion_Smoke", 1, self, 1)
	
	if(SERVER) then
		self:SetMaterial("models/angelsaur/ghosts/shadow")
	end
end