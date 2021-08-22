ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Scarlet (Shade)"
ENT.Category = "NutScript - Combat (Shade)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Decrepit Puppet"

ENT.model = "models/spite/scarlet.mdl"
ENT.color = Color(0, 0, 0)

--all attributes
ENT.attribs = {
	["stm"] = 10,
	["str"] = 12,
	["accuracy"] = 20,
	["end"] = 10,
	["luck"] = 1,
	["perception"] = 15,
	["fortitude"] = 30,
}

ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

function ENT:Initialize()
	self:SetRenderMode(RENDERMODE_TRANSALPHA)
	self:SetRenderFX(kRenderFxDistort)
	
	self:basicSetup()
end