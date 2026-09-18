ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Immortal"
ENT.Category = "NutScript - Combat (Husk)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.IdleAnim = "Idle_Alert_Shotgun_5"
ENT.WalkAnim = "Walk_AR2_Relaxed_All"
ENT.RunAnim = "Run_Holding_Ar2_All"

ENT.models = {
	"models/Humans/Group03/Female_01.mdl",
	"models/Humans/Group03/Female_02.mdl",
	"models/Humans/Group03/Female_03.mdl",
	"models/Humans/Group03/Female_04.mdl",
	"models/Humans/Group03/Female_06.mdl",
	"models/Humans/Group03/Female_07.mdl",
	
	"models/Humans/Group03/Male_01.mdl",
	"models/Humans/Group03/Male_02.mdl",
	"models/Humans/Group03/Male_03.mdl",
	"models/Humans/Group03/Male_04.mdl",
	"models/Humans/Group03/Male_05.mdl",
	"models/Humans/Group03/Male_06.mdl",
	"models/Humans/Group03/Male_07.mdl",
	"models/Humans/Group03/Male_08.mdl",
	"models/Humans/Group03/Male_09.mdl",
}

--all attributes
ENT.attribs = {
	["stm"] = 10,
	["str"] = 20,
	["accuracy"] = 30,
	["end"] = 50,
	["luck"] = -5,
	["perception"] = 10,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Pierce"] = 20,
}

ENT.hp = 500
ENT.armor = 0

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 20,
	["Blunt"] = 20,
	
	["Ichor"] = 25,
	["Blight"] = 25,
	["Shard"] = 25,
	["Distort"] = 0,
	["Time"] = 25,
	
	["Fire"] = 0,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 0,
	["Electric"] = 0,
}

ENT.StepData = {
	0.25,
	0.75,
}

ENT.FootstepSounds = {
	"npc/footsteps/hardboot_generic1.wav",
	"npc/footsteps/hardboot_generic2.wav",
	"npc/footsteps/hardboot_generic3.wav",
	"npc/footsteps/hardboot_generic4.wav",
	"npc/footsteps/hardboot_generic5.wav",
	"npc/footsteps/hardboot_generic6.wav",
}

function ENT:Initialize()
	self:basicSetup()
	
	-- Change appearance (color, material, etc)
	--self:SetColor(Color(200,200,200))

	self:SetMaterial("models/charple/charple2_sheet")
	
	if(SERVER) then
		self:EquipWeapon("models/weapons/w_crossbow.mdl", "models/props/cs_militia/milceil001")
	end
end

ENT.vectorMult = 0.05
function ENT:CustomThink()
	if(SERVER) then return end

	if(self.nextBoneUpdate or 0) < CurTime() then
		local curTime = CurTime()
	
		self.nextBoneUpdate = curTime + 0
		
		if(!self.targetBones) then
			self.targetBones = {}
		
			for i = 1, self:GetBoneCount() do
				self.targetBones[i] = Vector(math.random(-2,2),math.random(-2,2),math.random(-2,2))
			end
			
			self.startTime = curTime
		end

		if(curTime-self.startTime < 20) then
			for i = 1, self:GetBoneCount() do
				self:ManipulateBonePosition(i, self.targetBones[i] * math.min((curTime-self.startTime)*self.vectorMult, 1))
			end
		end
	end
end