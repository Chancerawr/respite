ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Combat Prop Base"
ENT.Category = "NutScript - Combat (Prop)"
ENT.Spawnable = false
ENT.AdminOnly = true

ENT.model = "models/Combine_Helicopter/helicopter_bomb01.mdl"

--[[
--all attributes
ENT.attribs = {
	["stm"] = 0,
	["str"] = 0,
	["accuracy"] = 0,
	["end"] = 0,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Blunt"] = 0,
}

ENT.armor = 0

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
}
--]]

function ENT:SpawnFunction(ply, tr, ClassName)
	if (!tr.Hit) then return end

	local SpawnPos = tr.HitPos + tr.HitNormal * 16

	local ent = ents.Create(ClassName)
	ent:SetPos(SpawnPos)
	ent:Spawn()
	ent:Activate()

	return ent
end

function ENT:Initialize()
	self:basicSetup()
end

function ENT:physicsSetup()
	if(SERVER) then
		--self:SetMoveType(MOVETYPE_STEP)
		self:DrawShadow(true)
		self:PhysicsInit(SOLID_VPHYSICS)
		--self:SetSolid(SOLID_BBOX)

		local physObj = self:GetPhysicsObject()
		if (IsValid(physObj)) then
		
			if(self.saveKey) then
				physObj:EnableMotion(false)
			else
				physObj:EnableMotion(true)
			end

			physObj:EnableGravity(true)
			--physObj:Sleep()
			physObj:EnableCollisions(true)
			physObj:Wake()

			if(!self.saveKey) then
				self:DropToFloor()
				
				if(self.PropHeight) then
					self:SetPos(self:GetPos()+Vector(0,0,self.PropHeight))
					
					physObj:EnableMotion(false)
				end
			end
		end
	end
	
	self:SetCollisionGroup(COLLISION_GROUP_WORLD)
end

function ENT:movementStart(position)
	if(SERVER) then
		local collisionMin, collisionMax = self:GetCollisionBounds()
		
		local height
		if(self.PropHeight) then
			height = Vector(0, 0, self.PropHeight)
		else
			height = Vector(0, 0, (collisionMax.z - collisionMin.z)*0.5)
		end
		
		local pointAt = (position - self:GetPos()):GetNormalized()
		local angle = pointAt:Angle()
		angle.z = 0
		
		self:SetPos(position + height)
		self:SetAngles(angle)
		
		local position
	end
end

function ENT:Think()
	self:CustomThink()
end