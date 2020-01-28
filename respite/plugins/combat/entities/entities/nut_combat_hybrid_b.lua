ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Beta"
ENT.Category = "NutScript - Combat (Hybrid)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/cryoffear/taller/taller.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 0,
	["str"] = 100,
	["accuracy"] = 50,
	["end"] = 100,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 40,
}

function ENT:Initialize()
	self:basicSetup()
	
	if(SERVER) then
		self:SetMaterial("models/effects/comball_glow1")
		self:SetColor(Color(128,0,0,255))
		self:SetRenderFX(kRenderFxDistort)
	end
end