ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Mimic"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.model = "models/nh2zombies/creeper.mdl"

ENT.noRag = true

--all attributes
ENT.agil = 60
ENT.stre = 25
ENT.accu = 15
ENT.craf = 0
ENT.endu = 30
ENT.luck = 25
ENT.perc = 25
ENT.fort = 35

function ENT:Initialize()
	if (SERVER) then
		self:SetMaterial("models/alyx/emptool_glow")
		self:SetModelScale(1.1)
		self:SetMaterial("models/effects/comball_glow1")
		self:SetColor(Color(50,50,150))
	end
	
	self:basicSetup()
end