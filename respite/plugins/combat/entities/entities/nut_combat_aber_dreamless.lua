ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Dreamless"
ENT.Category = "NutScript - Combat (Other)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Dreamless"

ENT.model = "models/player/group01/male_04.mdl"
ENT.material = "models/effects/splode_sheet"
ENT.color = Color(112,0,255)

ENT.models = {
	"models/player/group01/female_01.mdl",
	"models/player/group01/female_02.mdl",
	"models/player/group01/female_03.mdl",
	"models/player/group01/female_04.mdl",
	"models/player/group01/female_05.mdl",
	"models/player/group01/female_06.mdl",
	"models/player/group01/male_01.mdl",
	"models/player/group01/male_02.mdl",
	"models/player/group01/male_03.mdl",
	"models/player/group01/male_04.mdl",
	"models/player/group01/male_05.mdl",
	"models/player/group01/male_06.mdl",
	"models/player/group01/male_07.mdl",
	"models/player/group01/male_08.mdl",
	"models/player/group01/male_09.mdl",
	"models/player/group02/male_02.mdl",
	"models/player/group02/male_04.mdl",
	"models/player/group02/male_06.mdl",
	"models/player/group02/male_08.mdl",
	"models/player/group03/female_01.mdl",
	"models/player/group03/female_02.mdl",
	"models/player/group03/female_03.mdl",
	"models/player/group03/female_04.mdl",
	"models/player/group03/female_05.mdl",
	"models/player/group03/female_06.mdl",
	"models/player/group03/male_01.mdl",
	"models/player/group03/male_02.mdl",
	"models/player/group03/male_03.mdl",
	"models/player/group03/male_04.mdl",
	"models/player/group03/male_05.mdl",
	"models/player/group03/male_06.mdl",
	"models/player/group03/male_07.mdl",
	"models/player/group03/male_08.mdl",
	"models/player/group03/male_09.mdl",
	"models/player/hostage/hostage_01.mdl",
	"models/player/hostage/hostage_02.mdl",
	"models/player/hostage/hostage_03.mdl",
	"models/player/hostage/hostage_04.mdl"
}

ENT.WalkAnim = "zombie_walk_01"
ENT.RunAnim = "zombie_walk_01"
ENT.IdleAnim = "zombie_idle_01"

--all attributes
ENT.attribs = {
	["stm"] = 5,
	["str"] = 15,
	["accuracy"] = 15,
	["end"] = 15,
	["luck"] = 0,
	["perception"] = 15,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Slash"] = 20,
}

ENT.hp = 200
ENT.armor = 0

ENT.res = {
	["Pierce"] = 5,
	["Slash"] = 5,
	["Blunt"] = 5,
	
	["Ichor"] = -100,
	["Blight"] = -100,
	["Shard"] = -100,
	["Distort"] = 50,
	
	["Fire"] = 0,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 0,
	["Electric"] = 0,
	["Time"] = 100,
}

function ENT:Initialize()
	self.HeadBone = self:LookupBone("ValveBiped.Bip01_Head1")
	self.NeckBone = self:LookupBone("ValveBiped.Bip01_Neck1")

	self:basicSetup()
end

local maxGhosts = 3

function ENT:CustomThink()
	if(CLIENT) then
		if((self.nextGhost or 0) < CurTime()) then
			self.nextGhost = CurTime() + 0.05
		
			if(!self.GhostEntity) then 
				self.GhostEntity = {} 
			elseif(#self.GhostEntity > maxGhosts) then
				local removeGhost = self.GhostEntity[1]
				table.remove(self.GhostEntity, 1)
				SafeRemoveEntity(removeGhost)
			end

			local ghost = ents.CreateClientProp(self:GetModel())
			
			--ghost.RenderGroup = RENDERGROUP_TRANSLUCENT
			--ghost:SetRenderMode(RENDERMODE_TRANSALPHA)
			
			ghost:SetModel(self:GetModel())
			ghost:SetMaterial(self:GetMaterial())
			ghost:SetPos(self:GetPos())
			ghost:SetAngles(self:GetAngles())
			ghost:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
			
			ghost:ResetSequence(self:GetSequence())
			
			--ghost:SetPoseParameter("move_x", math.Rand(0,1))
			
			for i = 0, self:GetNumPoseParameters() - 1 do
				local sPose = self:GetPoseParameterName(i)
				ghost:SetPoseParameter(sPose, math.Rand(0,1))
			end
			
			ghost:SetPlaybackRate(0)
			
			local color = self:GetColor()
			
			ghost:SetColor(Color(color.r, color.g, color.b, math.random(40,80)))
			ghost:Spawn()

			ghost:SetSolid(SOLID_VPHYSICS)
			ghost:SetMoveType(MOVETYPE_NONE)
			ghost:SetNotSolid(true)
			ghost:SetRenderMode(RENDERMODE_TRANSALPHA)
			
			table.insert(self.GhostEntity, ghost)
		end
	end
end

function ENT:Draw()
	local TEMP_Cyc = self:GetCycle()
	local TEMP_NewCyc = TEMP_Cyc
	
	local TEMP_HeadAng = Angle(0,0,0)
	local TEMP_HeadPos = Vector(0,0,0)
	local TEMP_NeckAng = Angle(0,0,0)
	local TEMP_NeckPos = Vector(0,0,0)

	TEMP_HeadAng = Angle(0,0,0)
	--TEMP_HeadPos = Vector(math.random(-1,1),math.random(-1,1),math.random(-1,1))
	TEMP_HeadScale = Vector(1,1,1)
	TEMP_NeckAng = Angle(0,0,0)
	TEMP_NeckPos = Vector(0,0,0)
	 
	local twitch_ang1 = math.random(-3,3)
	
	TEMP_HeadAng = TEMP_HeadAng+Angle(math.random(-1,1)*15,math.random(-1,1)*15,math.random(-1,1)*15)
	--TEMP_NeckAng = TEMP_HeadAng+Angle(twitch_ang1,twitch_ang1,twitch_ang1)
	
	self:ManipulateBoneAngles(self.HeadBone,TEMP_HeadAng)
	
	self:DrawModel()
	self:SetupBones()

	self.PrevCycle = TEMP_Cyc
end

function ENT:OnRemove()
	if(CLIENT) then
		if(self.GhostEntity) then
			for k, v in pairs(self.GhostEntity or {}) do
				SafeRemoveEntity(v)
			end
		end
	end
end