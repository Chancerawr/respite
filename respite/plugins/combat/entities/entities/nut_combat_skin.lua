ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Skin"
ENT.Category = "NutScript - Combat (Husk)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.models = {
	"models/player/group01/male_01.mdl",
	"models/player/group01/male_02.mdl",
	"models/player/group01/male_03.mdl",
	"models/player/group01/male_04.mdl",
	"models/player/group01/male_05.mdl",
	"models/player/group01/male_06.mdl",
	"models/player/group01/male_07.mdl",
	"models/player/group01/male_08.mdl",
	"models/player/group01/male_09.mdl",
	
	"models/player/group01/female_01.mdl",
	"models/player/group01/female_02.mdl",
	"models/player/group01/female_03.mdl",
	"models/player/group01/female_04.mdl",
	"models/player/group01/female_05.mdl",
	"models/player/group01/female_06.mdl",
}

--all attributes
ENT.attribs = {
	["stm"] = 3,
	["str"] = 6,
	["accuracy"] = 4,
	["end"] = 4,
	["luck"] = 0,
	["perception"] = 2,
	["fortitude"] = 3,
}

ENT.dmg = {
	["Blunt"] = 20,
}

ENT.hp = 500
ENT.armor = 50

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 20,
	["Blunt"] = 20,
	
	["Ichor"] = 0,
	["Blight"] = 25,
	["Shard"] = 25,
	["Distort"] = 0,
	
	["Fire"] = 0,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 0,
	["Electric"] = 0,
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
	
	self.WalkAnim = "Zombie Walk 0" ..math.random(1,6)
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