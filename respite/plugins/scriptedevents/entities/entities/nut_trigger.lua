if (SERVER) then
	AddCSLuaFile()
end
local PLUGIN = PLUGIN

ENT.Type 			= "anim"
ENT.PrintName		= "Trigger"
ENT.Author			= ""
ENT.Category			= "Nutscript"
ENT.Information         = ""

ENT.Spawnable			= false
ENT.AdminSpawnable		= true

function ENT:SpawnFunction(ply, trace, ClassName)
	if (!trace.Hit) then return end

	local normal = trace.HitNormal

	local SpawnPos = trace.HitPos + normal
	local SpawnAng = normal:Angle() + Angle(90,0,0)--Angle(normal.x*180, normal.y*180, normal.z*180)

	local ent = ents.Create(ClassName)
	ent:SetPos(SpawnPos)
	ent:SetAngles(SpawnAng)

	ent:Spawn()
	ent:Activate()
	
	return ent
end

function ENT:Initialize()
	if(SERVER) then
		self:SetModel("models/hunter/blocks/cube025x025x025.mdl")
		
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetSolid(SOLID_OBB)
		self:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		
		local physObj = self:GetPhysicsObject()
		
		if (IsValid(physObj)) then
			physObj:EnableMotion(false)
			physObj:EnableGravity(false)
			--physObj:EnableCollisions(true)
			
			physObj:SetMass(101)
		end
		
		self:SetTrigger(true)
	end
end

function ENT:SetEvent(eventID)
	self.event = eventID
end

function ENT:GetEvent()
	return self.event
end

function ENT:Use(client, caller)
	VOTV:Use(self, client)
end

function ENT:OnRemove()
end

function ENT:Touch(entity)
	--self:OnTouch(entity)
end

function ENT:StartTouch(entity)
	if(entity:IsPlayer() and !entity.propTrigger) then
		self:OnTrigger(entity)
	elseif(self.propTrigger) then
		self:OnTrigger(entity)
	end
end

function ENT:EndTouch(entity)
	--self:OnEndTouch(entity)
end

function ENT:OnTrigger(entity)
	local event = self:GetEvent()
	
	if(event) then
		PLUGIN:RunScript(event, entity)
		
		SafeRemoveEntity(self)
	end
end

if(CLIENT) then
	local triggerDev = Material("models/debug/debugwhite")

	function ENT:Draw()
		--[[
		local collisionMin, collisionMax = self:GetCollisionBounds()
	
		render.SetMaterial(triggerDev)
		render.DrawBox(self:GetPos(), Angle(0,0,0), collisionMin, collisionMax, Color(255, 255, 255))
		--]]
		--self:DrawModel()
	end
end