local PLUGIN = PLUGIN

nut.util.include("sh_anim.lua")
nut.util.include("sh_buffs.lua")
nut.util.include("sh_helpers.lua")

ENT.Type = "nextbot"
ENT.Base = "base_nextbot"
ENT.PrintName = "Combat Base"
ENT.Category = "NutScript"
ENT.Spawnable = false
ENT.AdminOnly = true
ENT.combat = true

ENT.model = "models/Humans/Group01/male_02.mdl"

--ENT.name = "Bob"

ENT.hpMax = 0
ENT.mpMax = 0

--[[
ENT.dmg = {
	["Slash"] = 0,
}

ENT.armor = 0

ENT.attribs = {
	["stm"] = 0,
	["str"] = 0,
	["accuracy"] = 0,
	["medical"] = 0,
	["end"] = 0,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 0,
}

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 0,
	["Blight"] = 0,
	["Shard"] = 0,
	["Distort"] = 0,
	
	["Cold"] = 0,
	["Fire"] = 0,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 0,
	["Electric"] = 0,
}

ENT.tags = {
	["Humanoid"] = true,
}

ENT.tagsBonus = {
	["Humanoid"] = 1,
}
--]]

ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

--ENT.material = "phoenix_storms/mrref2"

function ENT:Initialize()
	self:basicSetup()
end

--this is just here because it's a nextbot
function ENT:RunBehaviour()
	while (true) do
		coroutine.wait(60)
		
		coroutine.yield()
	end
end

function ENT:basicSetup()
	self:SetRenderMode(RENDERMODE_TRANSALPHA)

	if (SERVER) then
		--self.attribs = self.savedAttribs or self.attribs or {}
		self.inv = self.inv or {}
	
		local model
		if(self.models) then
			model = table.Random(self.models)
		else
			model = self.model
		end

		self:SetModel(self.savedModel or model)
		self:SetMaterial(self.savedMat or self.material or self:GetMaterial())
		self:SetColor(self.savedColor or self.color)
		
		self:SetUseType(SIMPLE_USE)
		
		if(!self.saveKey) then
			self:DropToFloor()
		end
		
		--self:setNetVar("name", self:getNetVar("name", self.name or self.PrintName))
		--self:setNetVar("desc", self:getNetVar("desc", self.desc or ""))
	end
	
	self:physicsSetup()
	
	timer.Simple(1, function()
		if (IsValid(self)) then
			self:setAnim()
		end
	end)
end

function ENT:physicsSetup()
	if(SERVER) then
		--self:SetMoveType(MOVETYPE_STEP)
		self:DrawShadow(true)
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetSolid(SOLID_BBOX)

		local physObj = self:GetPhysicsObject()
			
		if (IsValid(physObj)) then
			physObj:EnableMotion(false)
			physObj:EnableGravity(false)
			--physObj:Sleep()
			physObj:EnableCollisions(false)
		end
		
		if(self.loco) then
			self.loco:SetAcceleration(900)
			self.loco:SetDeceleration(100000)
			self.loco:SetGravity(0)
			
			self:SetGravity(0)
		end
	end
	
	self:SetCollisionBounds(Vector(-20,-20,0), Vector(20,20,100))
	self:SetCollisionGroup(COLLISION_GROUP_WORLD)
end

function ENT:getSaveData()
	local saveData = {}
	saveData.name = self:Name()
	saveData.desc = self:Desc()
	saveData.hp = self:getHP()
	saveData.hpMax = self:getMaxHP()
	saveData.mp = self:getMP()
	saveData.mpMax = self:getMaxMP()
	saveData.attribs = self.attribs
	saveData.actions = self.actions
	saveData.dmg = self.dmg
	saveData.res = self:getNetVar("res")
	saveData.amp = self:getNetVar("amp")
	saveData.model = self:GetModel()
	saveData.mat = self:GetMaterial()
	saveData.anim = self:GetSequence()
	saveData.color = self:GetColor()
	
	saveData.bodygroups = {
		self:GetBodygroup(1),
		self:GetBodygroup(2),
		self:GetBodygroup(3),
		self:GetBodygroup(4),
		self:GetBodygroup(5),
		self:GetBodygroup(6),
		self:GetBodygroup(7),
		self:GetBodygroup(8),
		self:GetBodygroup(9),
	}
	
	return saveData
end

function ENT:Think()
	self:CustomThink()

	if(SERVER) then	
		if(!self.loco) then return end
	
		if(self:IsPlayerHolding()) then
			--if held with physgun while moving, will teleport to end when hold ends
			if(self.desiredPos) then 
				self.nudged = true
			end
		else
			local physObj = self:GetPhysicsObject()
			
			if(IsValid(physObj) and !physObj:IsAsleep()) then
				physObj:Sleep()
			end
			
			--if held with physgun while moving, will teleport to end when hold ends
			if(self.nudged and self.desiredPos) then
				self:SetPos(self.desiredPos)
				self.desiredPos = nil
				self.nudged = nil
				
				self:resetAnim()
			end
			
			if(!self.desiredPos) then
				self.loco:SetVelocity(Vector(0,0,0))
			elseif(self.desiredPos and !self.loco:IsOnGround()) then --basically they drift off into the sunset if you dont do this
				self:SetPos(self.desiredPos)
				self.desiredPos = nil
				
				self:resetAnim()
			end
		end
		
		if(self.desiredPos) then
			self.loco:Approach(self.desiredPos, 1)
			
			local stuck = self.loco:IsStuck()
			
			if(self:GetRangeSquaredTo(self.desiredPos) < 128 or stuck) then
				self.loco:SetVelocity(Vector(0,0,0))

				self:SetPos(self.desiredPos)
				
				self.desiredPos = nil
				
				self:resetAnim()
			end
		end

		if(IsValid(self.follow) and !self.desiredPos and !(self.follow and self.follow:InVehicle())) then
			local followPos = self.follow:GetPos() + self.follow:GetRight() * -50
		
			local range = self:GetRangeSquaredTo(followPos)
		
			if(range > 32768 and !stuck) then
				self:movementStart(followPos)
			
				self.desiredPos2 = followPos
			elseif((self.desiredPos2 and range < 256) or stuck) then
				self.loco:SetVelocity(Vector(0,0,0))

				self:SetPos(followPos)
				
				self.desiredPos2 = nil
				
				self:resetAnim()
			end
			
			if(self.desiredPos2) then
				self.loco:Approach(followPos, 1)
			end
		end
	end
end

function ENT:CustomThink()

end

function ENT:HandleStuck()

end

--death
function ENT:die()
	if(!self.noRag) then
		local ragdoll = ents.Create("prop_ragdoll")
		if ragdoll:IsValid() then 
			ragdoll:SetPos(self:GetPos())
			ragdoll:SetModel(self:GetModel())
			ragdoll:SetAngles(self:GetAngles())
			ragdoll:Spawn()
			ragdoll:SetSkin(self:GetSkin())
			ragdoll:SetColor(self:GetColor())
			ragdoll:SetMaterial(self:GetMaterial())
			ragdoll:SetBloodColor(self:GetBloodColor())
				
			local num = ragdoll:GetPhysicsObjectCount()-1
	   
			for i=0, num do
				local bone = ragdoll:GetPhysicsObjectNum(i)

				if IsValid(bone) then
					local bp, ba = self:GetBonePosition(ragdoll:TranslatePhysBoneToBone(i))
					if bp and ba then
						bone:SetPos(bp)
						bone:SetAngles(ba)
					end
				end
			end
				
			--I hate this
			ragdoll:SetBodygroup(1, self:GetBodygroup(1))
			ragdoll:SetBodygroup(2, self:GetBodygroup(2))
			ragdoll:SetBodygroup(3, self:GetBodygroup(3))
			ragdoll:SetBodygroup(4, self:GetBodygroup(4))
			ragdoll:SetBodygroup(5, self:GetBodygroup(5))
			ragdoll:SetBodygroup(6, self:GetBodygroup(6))
			
			ragdoll:SetCollisionGroup(COLLISION_GROUP_DEBRIS_TRIGGER)
			
			if (self:IsOnFire()) then --if the npc is on fire, set the ragdoll on fire too.
				ragdoll:Ignite(10,20)
			end
			
			ragdoll.hasMenu = true
		end
	
		--gets rid of ragdolls that dont have phys objects, just a cautionary thing.
		if(!IsValid(ragdoll:GetPhysicsObject())) then
			SafeRemoveEntity(ragdoll)
		end		
	end
	
	if(self.inv) then
		for k, v in pairs(self.inv) do
			nut.item.spawn(v, self:GetPos())
		end
	end
	
	SafeRemoveEntity( self )
end

function ENT:movementStart(position)
	if(SERVER) then
		local tempEnt = ents.Create("info_particle_system")
		tempEnt:SetParent(self)
		tempEnt:SetPos(position)
		
		self:PointAtEntity(tempEnt)
		local angle = self:GetAngles()
		self:SetAngles(Angle(0, angle.y, 0))
		
		SafeRemoveEntity(tempEnt)
		
		self.desiredPos = position
		
		self:walkAnims(self:GetPos():Distance(position))
	end
end

--dont do anything
function ENT:OnTakeDamage(dmginfo)
end

--dont do it
function ENT:OnTraceAttack( dmginfo, dir, trace )
end

--no
function ENT:OnKilled( dmginfo )
end

function ENT:turnProcess(turn, you)
	if(you) then		
		for k, v in pairs(self:getBuffs()) do
			if(v.func) then
			
			end
		
			if(v.dmg) then --damaging spells
				local dmgT = v.dmgT or "Blunt"
				local dmg = self:receiveDamage(v.dmg, dmgT) --gets the damage based on their resistances
				self:addHP(dmg * -1) --reduce their hp by the dmg
			end
		
			if(v.duration) then --counts down the duration
				v.duration = v.duration - 1
				if(v.duration <= 0) then
					self:removeBuff(v, v.uid)
				else

				end
			end
		end		
	else

	end
end

--adds a weapon model to a CEnt's hands
function ENT:EquipWeapon(modelPath, materialPath)
	if(IsValid(self.weapon)) then 
		SafeRemoveEntity(self.weapon)
	end

	self.WeaponMount = self:LookupAttachment("anim_attachment_RH")
	self.WeaponPosition = self:GetAttachment(self.WeaponMount)

	self.weapon = ents.Create("prop_dynamic")
	self.weapon:SetModel(modelPath)
	
	if(materialPath) then
		self.weapon:SetModel(materialPath)
	end
	
	self.weapon:Spawn()
	self.weapon:SetParent(self, self.WeaponMount)
	
	self.weapon:SetMoveType(MOVETYPE_NONE)
	self.weapon:SetLocalPos(Vector(0, 0, 0))
	self.weapon:SetLocalAngles(Angle(0, 0, 0))
	self.weapon:AddEffects(EF_BONEMERGE)
end

if (CLIENT) then
	function ENT:Draw()
		self:DrawModel()
	end

	local TEXT_OFFSET = Vector(0, 0, 0)
	local toScreen = FindMetaTable("Vector").ToScreen
	local colorAlpha = ColorAlpha
	local drawText = nut.util.drawText
	local configGet = nut.config.get

	ENT.DrawEntityInfo = true

	function ENT:onDrawEntityInfo(alpha)
		--local position = toScreen(self:LocalToWorld(self, self:WorldSpaceCenter(self)) + TEXT_OFFSET)
		local position = toScreen(self:WorldSpaceCenter(self))
		local x, y = position.x, position.y
		drawText(self:Name(), x, y, colorAlpha(Color(190,50,50), alpha), 1, 1, nil, alpha * 0.65)

		if (self:Desc()) then
			drawText(self:Desc(), x, y + 16, colorAlpha(color_white, alpha), 1, 1, "nutSmallFont", alpha * 0.65)
		end
	end
end

PLUGIN.CEntBase = ENT