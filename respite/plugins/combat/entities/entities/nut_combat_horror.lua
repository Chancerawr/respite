ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Horror"
ENT.Category = "NutScript - Combat (Shade)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/horror/zm_f4zt.mdl"

ENT.AttackAnim = "Melee"

ENT.color = Color(0, 0, 0)

--all attributes
ENT.attribs = {
	["stm"] = 20,
	["str"] = 6,
	["accuracy"] = 7,
	["end"] = 5,
	["luck"] = 5,
	["perception"] = 0,
	["fortitude"] = 30,
}

ENT.dmg = {
	["Slash"] = 10,
	["Blight"] = 15,
}

ENT.hp = 200
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
	self:basicSetup()
	
	if (SERVER) then
		self:SetBloodColor(DONT_BLEED)
		self:SetRenderMode(RENDERMODE_TRANSALPHA)
		self:SetRenderFX(kRenderFxDistort)
	end
end