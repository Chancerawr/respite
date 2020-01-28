ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Mimic"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.model = "models/nh2zombies/creeper.mdl"

ENT.noRag = true

--all attributes
ENT.attribs = {
	["stm"] = 60,
	["str"] = 25,
	["accuracy"] = 15,
	["end"] = 30,
	["luck"] = 25,
	["perception"] = 25,
	["fortitude"] = 25,
}

function ENT:Initialize()
	if (SERVER) then
		self:SetMaterial("models/alyx/emptool_glow")
		self:SetModelScale(1.1)
		self:SetMaterial("models/effects/comball_glow1")
		self:SetColor(Color(50,50,150))
		self:SetRenderFX(kRenderFxDistort)
	end
	
	self:basicSetup()
end