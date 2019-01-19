ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Hunter Flame"
ENT.Category = "NutScript - Combat (Wraith)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/sin/leperkin.mdl"
ENT.name = "Burning Hunter"

--all attributes
ENT.agil = 15
ENT.stre = 25
ENT.accu = 15
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