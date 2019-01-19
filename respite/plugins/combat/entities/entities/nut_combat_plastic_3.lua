ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Plastic (15)"
ENT.Category = "NutScript - Combat (Other)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Plastic"
ENT.model = "models/tnb/citizens/male_04.mdl"

--all attributes
ENT.agil = 15
ENT.stre = 15
ENT.accu = 15
ENT.craf = 15
ENT.endu = 15
ENT.luck = 15
ENT.perc = 15
ENT.fort = 15

function ENT:Initialize()
	self:basicSetup()

	if (SERVER) then
		self:SetMaterial("phoenix_storms/mrref2")
	end
end