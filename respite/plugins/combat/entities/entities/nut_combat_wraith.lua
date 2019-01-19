ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Wraith"
ENT.Category = "NutScript - Combat (Wraith)"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.model = "models/predatorcz/amnesia/grunt.mdl"

--all attributes
ENT.agil = 10
ENT.stre = 15
ENT.accu = 10
ENT.craf = 0
ENT.endu = 15
ENT.luck = 5
ENT.perc = 0
ENT.fort = 0

function ENT:Initialize()
	if (SERVER) then
		self:SetMaterial("models/props_combine/tpballglow")
	end
	
	self:basicSetup()
end