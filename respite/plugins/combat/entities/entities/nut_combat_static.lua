ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Static"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Static"
ENT.model = "models/zombie/fast.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 35,
	["str"] = 25,
	["accuracy"] = 15,
	["end"] = 20,
	["luck"] = 10,
	["perception"] = 10,
	["fortitude"] = 0,
}

function ENT:Initialize()
	self:basicSetup()
	
	if(SERVER) then
		self:SetMaterial("models/downpour/filmgrain_1a")
		self:SetColor(Color(0,math.random(0,128),255))
	else
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

		bones = {
			"ValveBiped.Bip01_L_Thigh",
			"ValveBiped.Bip01_L_Calf",
			"ValveBiped.Bip01_L_Foot",
			"ValveBiped.Bip01_L_Toe0",
			"ValveBiped.Bip01_R_Thigh",
			"ValveBiped.Bip01_R_Calf",
			"ValveBiped.Bip01_R_Foot",
			"ValveBiped.Bip01_R_Toe0"
		}
		
		for _, bone in pairs(bones) do
			local boneid = self:LookupBone(bone)
			if boneid and boneid > 0 then
				self:ManipulateBoneScale(boneid, Vector(0/0,0/0,0/0))
			end
		end
	end
end