ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Babu Shade"
ENT.Category = "NutScript - Combat (Shade)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/zombie/babu.mdl"
ENT.color = Color(0,0,0)

--all attributes
ENT.attribs = {
	["stm"] = 5,
	["str"] = 12,
	["accuracy"] = 5,
	["end"] = 12,
	["luck"] = 5,
	["perception"] = 5,
	["fortitude"] = 10,
}

ENT.dmg = {
	["Blunt"] = 10,
	["Blight"] = 5,
}

ENT.hp = 200
ENT.armor = 20

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 0,
	["Blight"] = 100,
	["Shard"] = -50,
	["Distort"] = 0,
	
	["Fire"] = 25,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 50,
	["Electric"] = 25,
}

function ENT:Initialize()
	self:SetRenderMode(RENDERMODE_TRANSALPHA)
	self:SetRenderFX(kRenderFxDistort)

	timer.Simple(0.6, function()
		self:ResetSequence("idle01")
	end)

	self:basicSetup()
end