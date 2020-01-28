ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Gamma"
ENT.Category = "NutScript - Combat (Hybrid)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/cryoffear/crawler2/krypandenej.mdl"

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

function ENT:Initialize()
	self:basicSetup()
	
	if(SERVER) then
		self:SetMaterial("models/effects/comball_glow1")
		self:SetColor(Color(128,0,0,255))
		self:SetRenderFX(kRenderFxDistort)
	end
end