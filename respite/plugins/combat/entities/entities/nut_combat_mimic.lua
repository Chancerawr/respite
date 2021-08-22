ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Mimic"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/nh2zombies/creeper.mdl"
ENT.material = "models/effects/comball_glow1"
ENT.color = Color(50, 50, 150)

ENT.noRag = true

--all attributes
ENT.attribs = {
	["stm"] = 50,
	["str"] = 2,
	["accuracy"] = 2,
	["end"] = 1,
	["luck"] = 1,
	["perception"] = 50,
	["fortitude"] = 25,
}

function ENT:Initialize()
	if (SERVER) then
		self:SetModelScale(1.1)
		self:SetRenderFX(kRenderFxDistort)
	end
	
	self:basicSetup()
end