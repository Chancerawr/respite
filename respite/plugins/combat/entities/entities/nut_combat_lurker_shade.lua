ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Lurker (Shade)"
ENT.Category = "NutScript - Combat (Shade)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/sient hill custom/Homecoming/lurker.mdl"
ENT.material = "phoenix_storms/lag_sign"

ENT.AttackAnim = "Attack"

ENT.color = Color(0, 0, 0)

--all attributes
ENT.attribs = {
	["stm"] = 12,
	["str"] = 15,
	["accuracy"] = 12,
	["end"] = 12,
	["luck"] = 5,
	["perception"] = 5,
	["fortitude"] = 15,
}

ENT.dmg = {
	["Slash"] = 15,
	["Blight"] = 15,
}

ENT.hp = 300
ENT.armor = 60

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

ENT.actions = {
	"slash",
	"stab",
}

ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

function ENT:Initialize()
	
	if(SERVER) then
		self:SetRenderMode(RENDERMODE_TRANSALPHA)
		self:SetRenderFX(kRenderFxDistort)
	end

	self:basicSetup()
end