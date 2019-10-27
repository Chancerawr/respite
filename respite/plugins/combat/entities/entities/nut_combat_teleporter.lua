ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Teleporter"
ENT.Category = "NutScript - Combat (Shade)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/predatorcz/amnesia/grunt.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 30,
	["str"] = 30,
	["accuracy"] = 10,
	["end"] = 0,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 25,
}

function ENT:Initialize()
	self:basicSetup()
	
	ParticleEffectAttach("Advisor_Pod_Explosion_Smoke", 1, self, 1)
	
	if(SERVER) then
		self:SetMaterial("models/angelsaur/ghosts/shadow")
	end
end