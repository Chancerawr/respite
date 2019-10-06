ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Jeffrey"
ENT.Category = "NutScript - Combat (Wraith)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.noRag = true

ENT.model = "models/Zombie/Poison.mdl"

--all attributes
ENT.agil = 00
ENT.stre = 100
ENT.accu = 20
ENT.craf = 0
ENT.endu = 80
ENT.luck = 0
ENT.perc = 0
ENT.fort = 200

function ENT:Initialize()
	self:SetMaterial("models/props_lab/security_screens")
	
	timer.Simple(0.6, function()
		self:SetModelScale(3)
		self:ResetSequence("firewalk")
	end)
	
	if(CLIENT) then
		local bones = {
			"ValveBiped.Bip01_L_UpperArm",
			"ValveBiped.Bip01_L_Forearm",
			"ValveBiped.Bip01_L_Hand",
			"ValveBiped.Bip01_L_Finger1",
			"ValveBiped.Bip01_L_Finger11",
			"ValveBiped.Bip01_L_Finger12",
			"ValveBiped.Bip01_L_Finger2",
			"ValveBiped.Bip01_L_Finger21",
			"ValveBiped.Bip01_L_Finger22",
			"ValveBiped.Bip01_L_Finger3",
			"ValveBiped.Bip01_L_Finger31",
			"ValveBiped.Bip01_L_Finger32",
			"ValveBiped.Bip01_R_UpperArm",
			"ValveBiped.Bip01_R_Forearm",
			"ValveBiped.Bip01_R_Hand",
			"ValveBiped.Bip01_R_Finger1",
			"ValveBiped.Bip01_R_Finger11",
			"ValveBiped.Bip01_R_Finger12",
			"ValveBiped.Bip01_R_Finger2",
			"ValveBiped.Bip01_R_Finger21",
			"ValveBiped.Bip01_R_Finger22",
			"ValveBiped.Bip01_R_Finger3",
			"ValveBiped.Bip01_R_Finger31",
			"ValveBiped.Bip01_R_Finger32"
		}

		for _, bone in pairs(bones) do
			local boneid = self:LookupBone(bone)
			if boneid and boneid > 0 then
				self:ManipulateBoneScale(boneid, Vector(2,2,2))
			end
		end
	end

	self:basicSetup()
end