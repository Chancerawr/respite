ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "pǝ˥┴ɐ δ"
ENT.Category = "NutScript - Combat (Hybrid)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/cryoffear/stranger/stranger.mdl"
ENT.material = "models/effects/comball_glow1"
ENT.color = Color(128, 0, 0)

--all attributes
ENT.attribs = {
	["stm"] = 0,
	["str"] = 0,
	["accuracy"] = 0,
	["end"] = 0,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 100,
}

ENT.dmg = {
	["Unknown"] = 20,
}

ENT.hp = 1000
ENT.armor = 100

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