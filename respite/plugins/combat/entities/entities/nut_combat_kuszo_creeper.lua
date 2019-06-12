ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Ghoul (Creeper)"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/zombie/kuszo.mdl"

--all attributes
ENT.agil = 10
ENT.stre = 10
ENT.accu = 5
ENT.craf = 0
ENT.endu = 0
ENT.luck = 4
ENT.perc = 10
ENT.fort = 10

function ENT:Initialize()
	if(SERVER) then
		self:SetMaterial("models/props_lab/warp_sheet")
		self:SetColor(Color(190,0,0))
	end

	self:basicSetup()
end