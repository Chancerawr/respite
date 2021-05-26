ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Waste (Ice)"
ENT.Category = "NutScript - Combat (Wraith)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/prosperity/freak.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 0,
	["str"] = 15,
	["accuracy"] = 10,
	["end"] = 20,
	["luck"] = 1,
	["perception"] = 0,
	["fortitude"] = 0,
}

function ENT:Initialize()
	self:SetColor(Color(0, 150, 255, 255))
	self:SetMaterial("models/effects/splode1_sheet")

	if(SERVER) then
		self:SetRenderMode(RENDERMODE_TRANSALPHA)
		self:SetRenderFX(kRenderFxHologram)
	end

	self:basicSetup()
end