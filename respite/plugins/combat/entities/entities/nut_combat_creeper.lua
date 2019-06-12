ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Creeper"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.model = "models/nh2zombies/creeper.mdl"

--all attributes
ENT.agil = 10
ENT.stre = 40
ENT.accu = 20
ENT.craf = 0
ENT.endu = 50
ENT.luck = 10
ENT.perc = 30
ENT.fort = 60

function ENT:Initialize()
	if (SERVER) then
		self:SetMaterial("models/alyx/emptool_glow")
		self:SetColor(Color(128,0,0))
		self:SetRenderMode(RENDERMODE_TRANSALPHA)
		self:SetRenderFX(kRenderFxHologram)
	end
	
	self:basicSetup()
end