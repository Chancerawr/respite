ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Plastic (10)"
ENT.Category = "NutScript - Combat (Other)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Plastic"
ENT.model = "models/tnb/citizens/male_04.mdl"

--all attributes
ENT.agil = 10
ENT.stre = 10
ENT.accu = 10
ENT.craf = 10
ENT.endu = 10
ENT.luck = 10
ENT.perc = 10
ENT.fort = 10

function ENT:Initialize()
	self:basicSetup()

	if (SERVER) then
		self:SetMaterial("phoenix_storms/mrref2")
	end
end