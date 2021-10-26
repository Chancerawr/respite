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

ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

function ENT:Initialize()
	self:SetRenderMode(RENDERMODE_TRANSALPHA)
	self:SetColor(Color(0,0,0,255))
	--self:SetRenderFX(kRenderFxDistort)

	self:basicSetup()
end