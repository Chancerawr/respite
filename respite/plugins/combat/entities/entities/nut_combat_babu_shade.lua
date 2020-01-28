ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Babu Shade"
ENT.Category = "NutScript - Combat (Shade)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/zombie/babu.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 5,
	["str"] = 20,
	["accuracy"] = 5,
	["end"] = 50,
	["luck"] = 5,
	["perception"] = 5,
	["fortitude"] = 10,
}

function ENT:Initialize()
	self:SetRenderMode(RENDERMODE_TRANSALPHA)
	self:SetColor(Color(0,0,0))
	self:SetRenderFX(kRenderFxDistort)

	timer.Simple(0.6, function()
		self:ResetSequence("idle01")
	end)

	self:basicSetup()
end