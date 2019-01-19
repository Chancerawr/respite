ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Amputated Flame"
ENT.Category = "NutScript - Combat (Wraith)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Burning Amputated"
ENT.model = "models/am_npc/amputated.mdl"

--all attributes
ENT.agil = 5
ENT.stre = 25
ENT.accu = 10
ENT.craf = 0
ENT.endu = 10
ENT.luck = 3
ENT.perc = 0
ENT.fort = 0

function ENT:Initialize()
	self:basicSetup()
	
	if(SERVER) then
		self:SetMaterial("models/effects/splode1_sheet")
	end	
end