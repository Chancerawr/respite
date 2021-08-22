-- This is used for custom CEnt generating things
ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Custom"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = false
ENT.AdminOnly = true

ENT.model = "models/am_npc/amputated.mdl"

--ENT.WalkAnim = "walk"
--ENT.RunAnim = "walk"
--ENT.IdleAnim = "tantrum"

--ENT.AttackAnim = ACT_MELEE_ATTACK1

--all attributes
ENT.attribs = {}

function ENT:Initialize()
	if(SERVER) then
		self:SetUseType(SIMPLE_USE)
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
	
	timer.Simple(0.5, function()
		if (IsValid(self)) then
			self:setAnim()
		end
	end)
end