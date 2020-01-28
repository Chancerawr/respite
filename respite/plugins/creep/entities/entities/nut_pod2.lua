ENT.Type = "anim"
ENT.PrintName = "Meat Pod"
ENT.Category = "NutScript"
ENT.Spawnable = false
ENT.AdminOnly = true
ENT.contact = false

ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

function ENT:Initialize()
	if SERVER then
		self:SetModel("models/gibs/humans/mgib_01.mdl")
		self:SetColor(Color(155, 255, 155, 255))
		self:SetMaterial("models/flesh")
		self:SetRenderMode(RENDERMODE_TRANSALPHA)
		--self:SetColor(Color(0,0,0,0))		

		self:SetModelScale(2, 0)
		self:PhysicsInitSphere(18)
		self:SetSolid(SOLID_VPHYSICS)
		self:SetCollisionGroup(COLLISION_GROUP_PROJECTILE)
		
		local phys = self:GetPhysicsObject()
		if phys:IsValid() then
			phys:SetMass(1)
			phys:SetBuoyancyRatio(0.001)
			phys:EnableMotion(true)
			phys:Wake()
		end
		
		self.removeTime = CurTime() + 5
	else
		self:SetModelScale(1.5, 0)

		self.Emitter = ParticleEmitter(self:GetPos())
		self.Emitter:SetNearClip(16, 24)
	end
end

function ENT:Think()
	if(SERVER) then
		if(self.contact) then
			if(IsValid(self)) then
				if(math.random(0,1) == 1) then 
					util.Decal("bloodpool" .. math.random(1,3) .. "", self:GetPos() - Vector(0,0,20), self:GetPos() - Vector(0,0,20))
				else
					util.Decal("Blood", self:GetPos() - Vector(0,0,20), self:GetPos() - Vector(0,0,20))
				end

				local creatures = {
					"spore",
					"amputated",
					"nz_waste",
					"nz_thrower",
					"resp_smog",
					"cof_faceless",

				}
				local creature = table.Random(creatures)
				
				local fire = ents.Create(creature)
				fire:SetPos(self:GetPos())
				fire:Spawn()
				table.insert(nut.plugin.list["creep"].spawns, fire)
				
				self:Remove()
			end
		end
	
		if (CurTime() > self.removeTime) then
			--self:Remove()
		end
	end
end

function ENT:PhysicsCollide(data, physobj)
	if SERVER then		
		local ent = data.HitEntity
		
		if ent and ent:IsValid() then
			self.contact = true
		else			
			self.contact = true
		end
	end
end

function ENT:ShouldNotCollide(ent)
	return ent:IsPlayer() 
end

function ENT:Draw()
	self:DrawModel()
	if(!self.nextEmit) then
		self.nextEmit = CurTime() + 0.05
	end
	
	if CurTime() >= self.nextEmit and self:GetVelocity():Length() >= 16 then
		self.nextEmit = CurTime() + 0.05

		local particle = self.Emitter:Add("effects/blood_core", self:GetPos())
		particle:SetVelocity(VectorRand():GetNormalized() * math.Rand(8, 16))
		particle:SetDieTime(1)
		particle:SetStartAlpha(230)
		particle:SetEndAlpha(230)
		particle:SetStartSize(10)
		particle:SetEndSize(0)
		particle:SetRoll(math.Rand(0, 360))
		particle:SetRollDelta(math.Rand(-25, 25))
		particle:SetColor(150, 0, 0)
		particle:SetLighting(true)
	end
end