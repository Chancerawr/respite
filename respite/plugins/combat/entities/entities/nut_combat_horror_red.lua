ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Red Horror"
ENT.Category = "NutScript - Combat (Wraith)"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.model = "models/horror/zm_f4zt.mdl"

--all attributes
ENT.agil = 40
ENT.stre = 15
ENT.accu = 10
ENT.craf = 0
ENT.endu = 15
ENT.luck = 5
ENT.perc = 0
ENT.fort = 0

function ENT:Initialize()
	self:basicSetup()
	
	if (SERVER) then
		self:SetColor(Color(255,93,0))
		self:SetMaterial("models/effects/splode1_sheet")
	end
end