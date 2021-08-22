ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "bƎ┴ɐ β"
ENT.Category = "NutScript - Combat (Hybrid)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/cryoffear/taller/taller.mdl"
ENT.material = "models/effects/comball_glow1"
ENT.color = Color(128, 0, 0)

--all attributes
ENT.attribs = {
	["stm"] = 0,
	["str"] = 100,
	["accuracy"] = 50,
	["end"] = 100,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 40,
}

function ENT:Initialize()
	self:basicSetup()
	
	if(SERVER) then
		self:SetRenderFX(kRenderFxDistort)
	end
end