ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Shambler"
ENT.Category = "NutScript - Combat (Shade)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/freshdead/freshdead_01.mdl"

--all attributes
ENT.agil = 5
ENT.stre = 5
ENT.accu = 5
ENT.craf = 5
ENT.endu = 5
ENT.luck = 5
ENT.perc = 5
ENT.fort = 10

function ENT:Initialize()
	self:basicSetup()
	
	if(SERVER) then
		self:SetMaterial("models/angelsaur/ghosts/shadow")
	end
end