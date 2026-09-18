ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Failure (1)"
ENT.Category = "NutScript - Combat (Husk)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.models = {
	"models/Zombie/Classic_torso.mdl",
}

--all attributes
ENT.attribs = {
	["stm"] = 15,
	["str"] = 30,
	["accuracy"] = 25,
	["end"] = 25,
	["luck"] = -5,
	["perception"] = 0,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Blunt"] = 30,
}

ENT.hp = 350
ENT.armor = 50

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
	self:SetColor(Color(200,200,200))
	
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
				self.targetBones[i] = Vector(math.random(-8,8),math.random(-8,8),math.random(-4,8))
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