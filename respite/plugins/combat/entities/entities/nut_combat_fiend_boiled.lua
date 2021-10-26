ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Boiling Fiend"
ENT.Category = "NutScript - Combat (Fiend)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Boiling Blood Fiend"

ENT.model = "models/spite/fiend.mdl"
ENT.material = "models/flesh"
ENT.color = Color(128, 20, 20)

--all attributes
ENT.attribs = {
	["stm"] = 5,
	["str"] = 5,
	["accuracy"] = 10,
	["end"] = 5,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 0,
}

function ENT:Initialize()
	self:basicSetup()
	
	if (CLIENT) then
		local bones = {
			--"ValveBiped.Bip01_Head1",
			"ValveBiped.Bip01_Neck1",
			"ValveBiped.Bip01_Spine4",
			"ValveBiped.Bip01_Spine2",
			"ValveBiped.Bip01_Spine1",
			"ValveBiped.Bip01_Spine",
			"ValveBiped.Bip01_Pelvis",
			"ValveBiped.Bip01_Clavicle",
			
			"ValveBiped.Bip01_L_Thigh",
			"ValveBiped.Bip01_L_Calf",
			"ValveBiped.Bip01_L_Foot",
			"ValveBiped.Bip01_L_Toe0",			
			"ValveBiped.Bip01_R_Thigh",
			"ValveBiped.Bip01_R_Calf",
			"ValveBiped.Bip01_R_Foot",
			"ValveBiped.Bip01_R_Toe0",
			
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
				self:ManipulateBoneScale(boneid, Vector(math.Rand(1,1.2),math.Rand(1,1.2),math.Rand(1,1.2)))
			end
		end
	end
end