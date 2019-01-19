ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Creeper Wraith"
ENT.Category = "NutScript - Combat (Wraith)"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.model = "models/nh2zombies/creeper.mdl"

--all attributes
ENT.agil = 25
ENT.stre = 20
ENT.accu = 15
ENT.craf = 0
ENT.endu = 5
ENT.luck = 5
ENT.perc = 10
ENT.fort = 0

function ENT:Initialize()
	if (SERVER) then
		self:SetMaterial("models/props_combine/tpballglow")
	end
	
	self:basicSetup()
end