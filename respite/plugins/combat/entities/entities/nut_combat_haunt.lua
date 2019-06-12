ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Haunt"
ENT.Category = "NutScript - Combat (Wraith)"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.model = "models/tnb/citizens/male_04.mdl"

--all attributes
ENT.agil = 10
ENT.stre = 12
ENT.accu = 8
ENT.craf = 5
ENT.endu = 10
ENT.luck = 8
ENT.perc = 10
ENT.fort = 20

function ENT:Initialize()
	if(SERVER) then
		self.TV=ents.Create("prop_physics")
		self.TV:SetModel("models/props_c17/tv_monitor01.mdl")
		self.TV:SetPos(self:GetPos())
		self.TV:SetParent(self, 1)
		self.TV:SetMoveType(MOVETYPE_NONE)
		self.TV:SetMaterial("models/props_lab/security_screens")	
	end

	self:basicSetup()
	
	if (SERVER) then
		self:SetMaterial("models/props_lab/security_screens")

		local models = {
			"models/tnb/citizens/male_04.mdl",
			"models/player/zombie_classic.mdl",
			"models/player/soldier_stripped.mdl",
			"models/player/corpse1.mdl"
		}
		
		self:SetModel(table.Random(models))		
	end	
end