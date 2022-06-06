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
			"ValveBiped.Bip01_L_Foot",
			"ValveBiped.Bip01_L_Toe0",
			"ValveBiped.Bip01_R_Foot",
			"ValveBiped.Bip01_R_Toe0",
		}
		
		local hands = {
			"ValveBiped.Bip01_L_Hand",
			"ValveBiped.Bip01_R_Hand",
		}
		
		local torso = {
			"ValveBiped.Bip01_Pelvis",
			"ValveBiped.Bip01_Spine",
			"ValveBiped.Bip01_Spine1",
			"ValveBiped.Bip01_Spine2",
			"ValveBiped.Bip01_Spine4",
		}

		for k, v in pairs(arms) do
			local bone = self:LookupBone(v)
			if(bone) then
				self:ManipulateBonePosition(bone, Vector(-12,5,0))
			end
		end
		
		for k, v in pairs(hands) do
			local bone = self:LookupBone(v)
			if(bone) then
				self:ManipulateBoneAngles(bone, Angle(0,-90,0))
				self:ManipulateBoneScale(bone, Vector(5,2,2))
			end
		end
		
		for k, v in pairs(torso) do
			--self:ManipulateBoneScale(self:LookupBone(v), Vector(0/0,0/0,0/0))
		end
		
		for k, v in pairs(legs) do
			local bone = self:LookupBone(v)
			
			if(bone) then
				self:ManipulateBoneScale(bone, Vector(0/0,0/0,0/0))
			end
		end
		
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
		
		self:SetColor(Color(120,120,120))
		
		local scale = Vector(1.2, 1.2, 1.2)

		local mat = Matrix()
		mat:Scale(scale)
		self:EnableMatrix("RenderMultiply", mat)
		
		self.NeckBone2 = self:LookupBone("ValveBiped.Bip01_L_Hand")
		self.HeadBone2 = self:LookupBone("ValveBiped.Bip01_R_Hand")
	end
end

function ENT:Draw()
	if(self.NeckBone2 and self.HeadBone2) then
		local TEMP_Cyc = self:GetCycle()
		local TEMP_NewCyc = TEMP_Cyc
		
		local TEMP_HeadAng = Angle(0,0,0)
		local TEMP_HeadPos = Vector(0,0,0)
		local TEMP_NeckAng = Angle(0,0,0)
		local TEMP_NeckPos = Vector(0,0,0)

		TEMP_HeadAng = Angle(0,-90,0)
		TEMP_HeadPos = Vector(0,0,0)
		TEMP_HeadScale = Vector(1,1,1)
		TEMP_NeckAng = Angle(0,-90,0)
		TEMP_NeckPos = Vector(0,0,0)
		 
		local twitch_ang1 = math.random(-2,2)
		
		TEMP_HeadAng = TEMP_HeadAng+Angle(twitch_ang1,twitch_ang1,twitch_ang1)
		TEMP_NeckAng = TEMP_HeadAng+Angle(twitch_ang1,twitch_ang1,twitch_ang1)

		self:ManipulateBoneAngles(self.HeadBone2,TEMP_HeadAng)
		self:ManipulateBoneAngles(self.NeckBone2,TEMP_NeckAng)
	end
	
	self:DrawModel()
	self:SetupBones()

	self.PrevCycle = TEMP_Cyc
end