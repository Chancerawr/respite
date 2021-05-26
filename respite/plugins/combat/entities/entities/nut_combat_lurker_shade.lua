ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Lurker (Shade)"
ENT.Category = "NutScript - Combat (Shade)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/sient hill custom/Homecoming/lurker.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 15,
	["str"] = 30,
	["accuracy"] = 20,
	["end"] = 20,
	["luck"] = 5,
	["perception"] = 5,
	["fortitude"] = 0,
}

ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

function ENT:Initialize()
	
	if(SERVER) then
		self:SetRenderMode(RENDERMODE_TRANSALPHA)
		self:SetColor(Color(0,0,0))
		self:SetRenderFX(kRenderFxDistort)
		self:SetMaterial("phoenix_storms/lag_sign")
	end

	self:basicSetup()
end