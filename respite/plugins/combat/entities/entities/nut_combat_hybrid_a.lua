ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Alpha"
ENT.Category = "NutScript - Combat (Hybrid)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/_maz_ter_/deadspace/deadspacenecros/twitcher.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 50,
	["str"] = 50,
	["accuracy"] = 50,
	["end"] = 50,
	["luck"] = 30,
	["perception"] = 0,
	["fortitude"] = 50,
}

function ENT:Initialize()
	self:basicSetup()
	
	if(SERVER) then
		self:SetMaterial("models/effects/comball_glow1")
		self:SetColor(Color(128,0,0,255))
		self:SetRenderFX(kRenderFxDistort)
	end
end