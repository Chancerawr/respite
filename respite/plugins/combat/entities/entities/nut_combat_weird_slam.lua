ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Slam"
ENT.Category = "NutScript - Combat (∀˥ᴉ‾∩ǝ‾˥ɹ)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "ϛ˥ɐʍ"

ENT.model = "models/monster/morbus/morbus_pestis.mdl"
ENT.hp = 1500

ENT.IdleAnim = "Idle"
ENT.AttackAnim = "Morbus_Pestis_Attack_Hand_Shot"
ENT.WalkAnim = "Walk"
ENT.RunAnim = "Run"

ENT.noRag = true

ENT.dmg = {
	["Blunt"] = 40,
}

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 0,
	["Blight"] = 0,
	["Shard"] = 0,
	["Distort"] = 0,
	
	["Fire"] = 0,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 0,
	["Electric"] = 0,
	
	["Erasure"] = -100,
}

--all attributes
ENT.attribs = {
	["stm"] = 10,
	["str"] = 50,
	["accuracy"] = 10,
	["end"] = 40,
	["luck"] = 5,
	["perception"] = 30,
	["fortitude"] = 0,
}

ENT.actions = {
	"fire_bolt",
	"fire_ball",
	"fire_incinerate",
	"fire_inferno",
	"water_heal",
	"frost_bolt",
	"frost_freeze",
	"lightning_bolt",
	"lightning_chain",
	"poison_bolt",
	"dark_bolt",
	"dark_raise",
	"dark_void",
	"wind_blade",
	"earth_fist",
	"earth_impale",
	"light_blind",
	"light_heal",
	"light_seraphim",
	"twist_basic",
}

ENT.humanModels = {
	"models/humans/groupm1/male_02.mdl",
	"models/humans/groupm1/male_04.mdl",
	"models/humans/groupm1/male_06.mdl",
	"models/humans/groupm1/male_07.mdl",
	"models/humans/groupm1/male_08.mdl",
	"models/humans/groupm1/male_09.mdl",
	
	"models/humans/groupm2/male_02.mdl",
	"models/humans/groupm2/male_04.mdl",
	"models/humans/groupm2/male_06.mdl",
	"models/humans/groupm2/male_07.mdl",
	"models/humans/groupm2/male_08.mdl",
	"models/humans/groupm2/male_09.mdl",
	
	"models/humans/groupm3/male_02.mdl",
	"models/humans/groupm3/male_04.mdl",
	"models/humans/groupm3/male_06.mdl",
	"models/humans/groupm3/male_07.mdl",
	"models/humans/groupm3/male_08.mdl",
	"models/humans/groupm3/male_09.mdl",
	
	"models/humans/groupm5/male_02.mdl",
	"models/humans/groupm5/male_04.mdl",
	"models/humans/groupm5/male_06.mdl",
	"models/humans/groupm5/male_07.mdl",
	"models/humans/groupm5/male_08.mdl",
	"models/humans/groupm5/male_09.mdl",
	
	"models/humans/groupm6/male_02.mdl",
	"models/humans/groupm6/male_04.mdl",
	"models/humans/groupm6/male_06.mdl",
	"models/humans/groupm6/male_07.mdl",
	"models/humans/groupm6/male_08.mdl",
	"models/humans/groupm6/male_09.mdl",
	
	"models/humans/groupm7/male_02.mdl",
	"models/humans/groupm7/male_04.mdl",
	"models/humans/groupm7/male_06.mdl",
	"models/humans/groupm7/male_07.mdl",
	"models/humans/groupm7/male_08.mdl",
	"models/humans/groupm7/male_09.mdl",
	
	"models/humans/groupm8/male_02.mdl",
	"models/humans/groupm8/male_04.mdl",
	"models/humans/groupm8/male_06.mdl",
	"models/humans/groupm8/male_07.mdl",
	"models/humans/groupm8/male_08.mdl",
	"models/humans/groupm8/male_09.mdl",	
	
	"models/humans/groupm1/female_01.mdl",
	"models/humans/groupm1/female_02.mdl",
	"models/humans/groupm1/female_06.mdl",
	
	"models/humans/groupm2/female_01.mdl",
	"models/humans/groupm2/female_02.mdl",
	"models/humans/groupm2/female_06.mdl",	
	
	"models/humans/groupm3/female_01.mdl",
	"models/humans/groupm3/female_02.mdl",
	"models/humans/groupm3/female_06.mdl",	
	
	"models/humans/groupm5/female_01.mdl",
	"models/humans/groupm5/female_02.mdl",
	"models/humans/groupm5/female_06.mdl",	
	
	"models/humans/groupm6/female_01.mdl",
	"models/humans/groupm6/female_02.mdl",
	"models/humans/groupm6/female_06.mdl",	
	
	"models/humans/groupm7/female_01.mdl",
	"models/humans/groupm7/female_02.mdl",
	"models/humans/groupm7/female_06.mdl",	
	
	"models/humans/groupm8/female_01.mdl",
	"models/humans/groupm8/female_02.mdl",
	"models/humans/groupm8/female_06.mdl",
}

function ENT:Initialize()
	if(SERVER) then
		self:SetColor(Color(255,255,255,255))
		self:SetRenderMode(RENDERMODE_TRANSALPHA)
		self:SetMaterial("effects/blood_drop")
	
		self.OverlayModel = ents.Create("prop_dynamic")
		local overlay = self.OverlayModel
		overlay:SetParent(self)
		overlay:SetModel(table.Random(self.humanModels))
		overlay.RenderGroup = RENDERGROUP_TRANSLUCENT
		overlay:SetRenderMode(RENDERMODE_TRANSALPHA)

		overlay:AddEffects(EF_BONEMERGE, EF_BONEMERGE_FASTCULL, EF_PARENT_ANIMATES)
		
		self:PhysicsInitShadow(true, false)
		
		self:setNetVar("bonemerge", self.OverlayModel:EntIndex())
	else --CLIENT
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

		local bonemerge = self:getNetVar("bonemerge")
		if(bonemerge and IsValid(ents.GetByIndex(bonemerge))) then
			bonemerge = ents.GetByIndex(bonemerge)
			for _, bone in pairs(bones) do
				local boneid = bonemerge:LookupBone(bone)
				if boneid and boneid > 0 then
					bonemerge:ManipulateBoneScale(boneid, Vector(math.Rand(0.5,2),math.Rand(0.5,2),math.Rand(0.5,2)))
				end
			end

			local scale = Vector(math.Rand(0.9,2),math.Rand(0.9,2),math.Rand(0.9,2))

			local mat = Matrix()
			mat:Scale(scale)
			bonemerge:EnableMatrix("RenderMultiply", mat)
		end
	end
	
	self:basicSetup()
end