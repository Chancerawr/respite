ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Plastic (5)"
ENT.Category = "NutScript - Combat (Other)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Plastic"
ENT.model = "models/tnb/citizens/male_04.mdl"

--all attributes
ENT.agil = 5
ENT.stre = 5
ENT.accu = 5
ENT.craf = 5
ENT.endu = 5
ENT.luck = 5
ENT.perc = 5
ENT.fort = 5

function ENT:Initialize()
	self:basicSetup()

	if (SERVER) then
		self:SetMaterial("phoenix_storms/mrref2")
	end
end