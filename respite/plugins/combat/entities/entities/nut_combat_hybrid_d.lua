ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "pǝ˥┴ɐ δ"
ENT.Category = "NutScript - Combat (Hybrid)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/cryoffear/stranger/stranger.mdl"
ENT.material = "models/effects/comball_glow1"
ENT.color = Color(128, 0, 0)

--all attributes
ENT.attribs = {
	["stm"] = 0,
	["str"] = 0,
	["accuracy"] = 0,
	["end"] = 0,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 100,
}

function ENT:Initialize()
	self:basicSetup()
	
	if(SERVER) then
		self:SetRenderFX(kRenderFxDistort)
	end
end