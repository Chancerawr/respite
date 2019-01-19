ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Thrasher"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/_maz_ter_/deadspace/deadspacenecros/twitcher.mdl"

--all attributes
ENT.agil = 20
ENT.stre = 15
ENT.accu = 15
ENT.craf = 0
ENT.endu = 0
ENT.luck = 40
ENT.perc = 0
ENT.fort = 0

function ENT:Initialize()
	self:basicSetup()
	
	if(SERVER) then
		self:SetMaterial("models/flesh")
		self:SetColor(Color(150,150,150,255))
	end
end