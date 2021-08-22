ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Drum (Ice)"
ENT.Category = "NutScript - Combat (Wraith)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/zombie/zombineplayer.mdl"
ENT.material = "models/effects/splode1_sheet"
ENT.color = Color(0, 150, 255)

--all attributes
ENT.attribs = {
	["stm"] = 0,
	["str"] = 30,
	["accuracy"] = 10,
	["end"] = 35,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 0,
}

function ENT:Initialize()
	self:SetColor()
	
	timer.Simple(0.6, function()
		self:SetRenderMode(RENDERMODE_TRANSALPHA)
		self:SetRenderFX(kRenderFxHologram)
		
		self:SetModelScale(1.8)
		self:ResetSequence("zombie_walk_06")
	end)

	self:basicSetup()
end