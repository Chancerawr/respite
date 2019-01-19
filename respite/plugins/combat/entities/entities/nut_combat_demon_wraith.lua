ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Demon Flame"
ENT.Category = "NutScript - Combat (Wraith)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Burning Demon"
ENT.model = "models/nh2zombies/friendly.mdl"

--all attributes
ENT.agil = 15
ENT.stre = 20
ENT.accu = 5
ENT.craf = 0
ENT.endu = 10
ENT.luck = 5
ENT.perc = 0
ENT.fort = 0

function ENT:Initialize()
	self:basicSetup()

	if (SERVER) then
		self:SetMaterial("models/effects/splode1_sheet")
	end
end