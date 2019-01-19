ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Phantom"
ENT.Category = "NutScript - Combat (Wraith)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/zombie/junkie_01.mdl"

--all attributes
ENT.agil = 5
ENT.stre = 15
ENT.accu = 5
ENT.craf = 5
ENT.endu = 20
ENT.luck = 5
ENT.perc = 5
ENT.fort = 5

function ENT:Initialize()
	self:basicSetup()
	
	if(SERVER) then
		self:SetMaterial("models/effects/comball_glow1")
	end
end