local PLUGIN = PLUGIN

ENT.Type = "anim"
ENT.PrintName = "Combat Projectile"
ENT.Category = "NutScript"
ENT.Spawnable = false
ENT.AdminOnly = true

function ENT:Initialize()
	--[[
	self:SetModel(self.model or "models/hunter/blocks/cube025x025x025.mdl")
	if(self.material) then
		self:SetMaterial(self.material)
	end
	--]]
	
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetCollisionGroup(COLLISION_GROUP_PROJECTILE)

	local phys = self:GetPhysicsObject()
	if IsValid(phys) then
		phys:SetBuoyancyRatio(0.002)
		phys:Wake()
		phys:SetMass(self.mass or 1)
		
		if(self.direction) then
			local velo = self.direction*(self.force or 1)
		
			phys:SetVelocityInstantaneous(velo)
		end
	end

	--SafeRemoveEntityDelayed(self, self.Time) 
end

function ENT:Think()
	if(self.dead) then
		SafeRemoveEntity(self)
	end
end

function ENT:PhysicsCollide(data, physobj)
	if(IsValid(self)) then
		if SERVER then
			local entity = data.HitEntity
			if (IsValid(entity) and !self.dead) then
				self.dead = true
			end
		end
	end
end
