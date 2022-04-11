ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Shambler"
ENT.Category = "NutScript - Combat (Shade)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/freshdead/freshdead_01.mdl"
--ENT.material = "models/angelsaur/ghosts/shadow"

--all attributes
ENT.attribs = {
	["stm"] = 3,
	["str"] = 6,
	["accuracy"] = 5,
	["end"] = 10,
	["luck"] = 0,
	["perception"] = 3,
	["fortitude"] = 5,
}

ENT.dmg = {
	["Blight"] = 10,
}

ENT.hp = 70
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

ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

function ENT:Initialize()
	self:SetRenderMode(RENDERMODE_TRANSALPHA)
	self:SetColor(Color(0,0,0,255))
	self:SetMaterial("models/player/player_chrome1")
	--self:SetRenderFX(kRenderFxDistort)

	self:basicSetup()
end