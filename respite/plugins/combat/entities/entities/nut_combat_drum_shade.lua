ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Drum (Shade)"
ENT.Category = "NutScript - Combat (Shade)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/zombie/zombineplayer.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 0,
	["str"] = 40,
	["accuracy"] = 15,
	["end"] = 40,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 10,
}

ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

function ENT:Initialize()
	if (SERVER) then
		self:SetBloodColor(DONT_BLEED)
		self:SetRenderMode(RENDERMODE_TRANSALPHA)
		self:SetColor(Color(0,0,0))
		self:SetRenderFX(kRenderFxDistort)
	end
	
	timer.Simple(0.6, function()
		self:SetModelScale(1.8)
		self:ResetSequence("zombie_walk_06")
	end)

	self:basicSetup()
end