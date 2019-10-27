ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Crawler"
ENT.Category = "NutScript - Combat (Shade)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/angelsaur/ghost_girl.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 10,
	["str"] = 10,
	["accuracy"] = 0,
	["end"] = 0,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 50,
}

function ENT:Initialize()
	ParticleEffectAttach("Advisor_Pod_Explosion_Smoke", 1, self, 1)

	self:basicSetup()
end