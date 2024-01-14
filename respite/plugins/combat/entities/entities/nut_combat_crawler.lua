ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Crawler"
ENT.Category = "NutScript - Combat (Shade)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/angelsaur/ghost_girl.mdl"
ENT.material = "models/effects/portalrift_sheet"

--all attributes
ENT.attribs = {
	["stm"] = 1,
	["str"] = 1,
	["accuracy"] = 0,
	["end"] = 0,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 50,
}

ENT.dmg = {
	["Blight"] = 15,
}

ENT.hp = 50
ENT.armor = 0

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 0,
	["Blight"] = 100,
	["Shard"] = -50,
	["Distort"] = 0,
	
	["Fire"] = 0,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 0,
	["Electric"] = 0,
}

function ENT:Initialize()
	--ParticleEffectAttach("Advisor_Pod_Explosion_Smoke", 1, self, 1)

	self:basicSetup()
end