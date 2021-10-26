ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Amalgamation"
ENT.Category = "NutScript - Combat (Shade)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/zombie/hatred.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 12,
	["str"] = 20,
	["accuracy"] = 15,
	["end"] = 30,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 0,
}

function ENT:Initialize()
	self:SetColor(Color(0,0,0))
	self:SetRenderMode(RENDERMODE_TRANSALPHA)
	self:SetRenderFX(kRenderFxDistort)

	self:basicSetup()
end