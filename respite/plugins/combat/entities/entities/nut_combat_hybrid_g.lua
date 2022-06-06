ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "ƃƃ∀MM∀ γ"
ENT.Category = "NutScript - Combat (Hybrid)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/cryoffear/crawler2/krypandenej.mdl"
ENT.material = "models/effects/comball_glow1"

ENT.AttackAnim = "Attack"

ENT.color = Color(128, 0, 0)

--all attributes
ENT.attribs = {
	["stm"] = 100,
	["str"] = 0,
	["accuracy"] = 0,
	["end"] = 0,
	["luck"] = 0,
	["perception"] = 100,
	["fortitude"] = 60,
}

ENT.dmg = {
	["Unknown"] = 50,
}

ENT.hp = 1000
ENT.armor = 200

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 0,
	["Blight"] = 100,
	["Shard"] = 100,
	["Distort"] = 0,
	
	["Fire"] = 0,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 0,
	["Electric"] = 0,
}

function ENT:Initialize()
	self:basicSetup()
	
	if(SERVER) then
		self:SetRenderFX(kRenderFxDistort)
	end
end