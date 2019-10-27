ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Scarlet (Shade)"
ENT.Category = "NutScript - Combat (Shade)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Decrepit Puppet"
ENT.model = "models/spite/scarlet.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 20,
	["str"] = 40,
	["accuracy"] = 12,
	["end"] = 20,
	["luck"] = 10,
	["perception"] = 5,
	["fortitude"] = 30,
}

ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

function ENT:Initialize()
	self:SetRenderMode(RENDERMODE_TRANSALPHA)
	self:SetColor(Color(0,0,0))
	self:SetRenderFX(kRenderFxDistort)
	
	self:basicSetup()
end