ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Doll"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/spite/doll.mdl"

--all attributes
ENT.agil = 10
ENT.stre = 15
ENT.accu = 10
ENT.craf = 0
ENT.endu = 20
ENT.luck = 0
ENT.perc = 0
ENT.fort = 10

function ENT:Initialize()
	if(math.random(0,1) == 1) then
		self:SetMaterial("phoenix_storms/mrref2")
	else
		self:SetMaterial("models/props_buildings/plasterwall021a")
	end

	self:basicSetup()
end