ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Waste (Ice)"
ENT.Category = "NutScript - Combat (Wraith)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/prosperity/freak.mdl"
ENT.material = "models/effects/splode1_sheet"
ENT.color = Color(0, 150, 255)

--all attributes
ENT.attribs = {
	["stm"] = 3,
	["str"] = 6,
	["accuracy"] = 4,
	["end"] = 10,
	["luck"] = 0,
	["perception"] = 2,
	["fortitude"] = 3,
}

function ENT:Initialize()
	if(SERVER) then
		self:SetRenderMode(RENDERMODE_TRANSALPHA)
		self:SetRenderFX(kRenderFxHologram)
	end

	self:basicSetup()
end