ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Horror"
ENT.Category = "NutScript - Combat (Shade)"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.model = "models/horror/zm_f4zt.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 25,
	["str"] = 10,
	["accuracy"] = 15,
	["end"] = 15,
	["luck"] = 5,
	["perception"] = 0,
	["fortitude"] = 30,
}

function ENT:Initialize()
	self:basicSetup()
	
	if (SERVER) then
		self:SetBloodColor(DONT_BLEED)
		self:SetRenderMode(RENDERMODE_TRANSALPHA)
		self:SetColor(Color(0,0,0))
		self:SetRenderFX(kRenderFxDistort)
	end
end