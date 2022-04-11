ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Angel"
ENT.Category = "NutScript - Combat (Husk)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Angel"

ENT.models = {
	"models/Humans/Group01/male_01.mdl",
	"models/Humans/Group01/male_02.mdl",
	"models/Humans/Group01/male_03.mdl",
	"models/player/group01/male_04.mdl",
	"models/Humans/Group01/male_05.mdl",
	"models/Humans/Group01/male_06.mdl",
	"models/Humans/Group01/male_07.mdl",
	"models/Humans/Group01/male_08.mdl",
	"models/Humans/Group01/male_09.mdl",
}

--all attributes
ENT.attribs = {
	["stm"] = 20,
	["str"] = 20,
	["accuracy"] = 20,
	["end"] = 20,
	["luck"] = -5,
	["perception"] = 20,
	["fortitude"] = 20,
}

ENT.dmg = {
	["Slash"] = 20,
	["Electric"] = 10,
}

ENT.hp = 1000
ENT.armor = 200

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 0,
	["Blight"] = 0,
	["Shard"] = 0,
	["Distort"] = 0,
	
	["Fire"] = 50,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 50,
	["Electric"] = 50,
}

function ENT:Initialize()
	self:basicSetup()
	
	local faces = {
		"models/humans/female/group01/joey_facemap",
		"models/humans/female/group01/kanisha_cylmap",
		"models/humans/female/group01/naomi_facemap",
		"models/humans/male/group01/eric_facemap",
		"models/humans/male/group01/ted_facemap",
		"models/humans/male/group01/sandro_facemap",
		"models/humans/male/group01/mike_facemap",
		"models/humans/male/group01/vance_facemap",
		"models/humans/male/group01/erdim_cylmap",
		"models/humans/male/group01/mike_facemap",
	}
	
	for k, v in pairs(self:GetMaterials()) do
		self:SetSubMaterial(k-1, table.Random(faces))
	end
	
	if(CLIENT) then
		local arms = {
			"ValveBiped.Bip01_R_UpperArm",
			"ValveBiped.Bip01_R_Forearm",
			"ValveBiped.Bip01_R_Hand",
			"ValveBiped.Bip01_L_UpperArm",
			"ValveBiped.Bip01_L_Forearm",
			"ValveBiped.Bip01_L_Hand",
			"ValveBiped.Bip01_L_Finger4",
			"ValveBiped.Bip01_L_Finger41",
			"ValveBiped.Bip01_L_Finger42",
			"ValveBiped.Bip01_L_Finger3",
			"ValveBiped.Bip01_L_Finger31",
			"ValveBiped.Bip01_L_Finger32",
			"ValveBiped.Bip01_L_Finger2",
			"ValveBiped.Bip01_L_Finger21",
			"ValveBiped.Bip01_L_Finger22",
			"ValveBiped.Bip01_L_Finger1",
			"ValveBiped.Bip01_L_Finger11",
			"ValveBiped.Bip01_L_Finger12",
			"ValveBiped.Bip01_L_Finger0",
			"ValveBiped.Bip01_L_Finger01",
			"ValveBiped.Bip01_L_Finger02",
			"ValveBiped.Bip01_R_Finger4",
			"ValveBiped.Bip01_R_Finger41",
			"ValveBiped.Bip01_R_Finger42",
			"ValveBiped.Bip01_R_Finger3",
			"ValveBiped.Bip01_R_Finger31",
			"ValveBiped.Bip01_R_Finger32",
			"ValveBiped.Bip01_R_Finger2",
			"ValveBiped.Bip01_R_Finger21",
			"ValveBiped.Bip01_R_Finger22",
			"ValveBiped.Bip01_R_Finger1",
			"ValveBiped.Bip01_R_Finger11",
			"ValveBiped.Bip01_R_Finger12",
			"ValveBiped.Bip01_R_Finger0",
			"ValveBiped.Bip01_R_Finger01",
			"ValveBiped.Bip01_R_Finger02",
			"ValveBiped.Bip01_L_Elbow",
			"ValveBiped.Bip01_L_Ulna",
			"ValveBiped.Bip01_R_Ulna",
			"ValveBiped.Bip01_R_Trapezius",
			"ValveBiped.Bip01_R_Wrist",
			"ValveBiped.Bip01_R_Bicep",
			"ValveBiped.Bip01_L_Bicep",
			"ValveBiped.Bip01_L_Trapezius",
			"ValveBiped.Bip01_L_Wrist",
			"ValveBiped.Bip01_R_Elbow",
		}
		
		local legs = {
			"ValveBiped.Bip01_R_Thigh",
			"ValveBiped.Bip01_L_Thigh",
			"ValveBiped.Bip01_L_Calf",
			"ValveBiped.Bip01_L_Foot",
			"ValveBiped.Bip01_L_Toe0",
			"ValveBiped.Bip01_R_Calf",
			"ValveBiped.Bip01_R_Foot",
			"ValveBiped.Bip01_R_Toe0",
		}
		
		local hands = {
			"ValveBiped.Bip01_L_Hand",
			"ValveBiped.Bip01_R_Hand",
		}

		for k, v in pairs(arms) do
			local bone = self:LookupBone(v)
			
			if(bone) then
				self:ManipulateBonePosition(bone, Vector(-12,5,0))
			end
		end
		
		for k, v in pairs(hands) do
			self:ManipulateBoneAngles(self:LookupBone(v), Angle(0,-90,0))
			self:ManipulateBoneScale(self:LookupBone(v), Vector(5,2,2))
		end
		
		--self:SetModelScale(1.2)
		
		local scale = Vector(1.2, 1.2, 1.2)

		local mat = Matrix()
		mat:Scale(scale)
		self:EnableMatrix("RenderMultiply", mat)	
	end
end