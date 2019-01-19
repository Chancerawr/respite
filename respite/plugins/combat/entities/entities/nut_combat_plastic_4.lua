ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Plastic (20)"
ENT.Category = "NutScript - Combat (Other)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Plastic"
ENT.model = "models/tnb/citizens/male_04.mdl"

--all attributes
ENT.agil = 20
ENT.stre = 20
ENT.accu = 20
ENT.craf = 20
ENT.endu = 20
ENT.luck = 20
ENT.perc = 20
ENT.fort = 20

function ENT:Initialize()
	self:basicSetup()

	if (SERVER) then
		self:SetMaterial("phoenix_storms/mrref2")
	end
end