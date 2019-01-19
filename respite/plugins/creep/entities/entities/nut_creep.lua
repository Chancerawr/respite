ENT.Type = "anim"
ENT.PrintName = "Creep"
ENT.Category = "NutScript"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.creationTime = 0 --when the fire was created (for duration)
ENT.duration = 240 --how long the fire will last (in seconds)
ENT.size = 0 --the current size
ENT.type = 0 --the type of fire it is (house, car, gas station)
ENT.nextSpread = 0
ENT.spreadTime = 60
ENT.health = 100

ENT.models = {
	"models/props_foliage/tree_deciduous_01a.mdl",
	"models/props_foliage/tree_deciduous_02a.mdl",
	"models/props_foliage/tree_deciduous_03a.mdl",
	"models/props_foliage/tree_deciduous_03b.mdl"
}

ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

function ENT:Initialize()
	if SERVER then
		--self:selectModel()
		self:SetModel("models/props_foliage/tree_deciduous_03b.mdl")
		self:SetHealth(self.health)
		
		self:PhysicsInit( SOLID_VPHYSICS )
		local phys = self:GetPhysicsObject()  	
		if phys:IsValid() then
			phys:EnableMotion(false)
			phys:Sleep()  	
		end
		
		self.size = 0
		
		self:SetMaterial("models/flesh")
		self:SetRenderMode(RENDERMODE_TRANSALPHA)
		
		self.creationTime = CurTime()
		self.spreadTime = nut.config.get("creepSpreadRate", 60)
		self.nextSpread = CurTime() + self.spreadTime
		
		self:SetPos(self:GetPos() - Vector(0,0,20))
		
		local ranAng = Angle(0,math.random(0,360),0)
		self:SetAngles(ranAng)
		
		nut.plugin.list["creep"].amt = nut.plugin.list["creep"].amt + 1
	else
		local mat = Matrix()
		mat:Scale( Vector(math.random(50,75)*0.01, math.random(50,75)*0.01, math.random(50,75)*0.01) )
		self:EnableMatrix( "RenderMultiply", mat )	
	end
end

function ENT:selectModel()
	self:SetModel(table.Random(self.models))
end

function ENT:SpawnFunction(client, trace)
	local angles = (trace.HitPos - client:GetPos()):Angle()
	angles.r = 0
	angles.p = 0
	angles.y = angles.y + 180

	local entity = ents.Create("nut_creep")
	entity:SetPos(trace.HitPos)
	entity:SetAngles(angles)
	entity:Spawn()
	
	return entity
end

function ENT:Think()
	if(SERVER) then
		--spreading
		if(CurTime() > self.nextSpread) then
			if(self.size == 15) then
				self:createSpread() --makes the fire spread
			
				if(!nut.plugin.list["creep"].heart) then
					nut.plugin.list["creep"].heart = true
					self.heart = true
					
					local stage = {
						"models/props_foliage/oak_tree01.mdl"
					}
	
					self:SetModel(table.Random(stage))
					self:PhysicsInit( SOLID_VPHYSICS )
					local phys = self:GetPhysicsObject()  	
					if phys:IsValid() then
						phys:EnableMotion(false)
						phys:Sleep()  	
					end
					
					self:SetHealth(self:Health() + 1000)
				else
					if(self.size > 3) then
						self.size = 3
					end
				end
			elseif(self.size >= 3) then
				self:createSpread() --makes the fire spread
				
				if(!nut.plugin.list["creep"].heart) then
					self.size = self.size + 1
				else
					if(self.size > 3) then
						self.size = 3
					end
				end
			elseif(self.size == 2) then
				local stage = {
					"models/props_foliage/tree_deciduous_01a.mdl",
					"models/props_foliage/tree_deciduous_02a.mdl"
				}
				
				self:SetModel(table.Random(stage))
				self:PhysicsInit( SOLID_VPHYSICS )
				local phys = self:GetPhysicsObject()  	
				if phys:IsValid() then
					phys:EnableMotion(false)
					phys:Sleep()  	
				end
				
				self.size = self.size + 1
				self:SetHealth(self:Health() + 100)
			elseif(self.size == 1) then
				local stage = {
					"models/props_foliage/tree_deciduous_03a.mdl"
				}
			
				self:SetModel(table.Random(stage))
				self:PhysicsInit( SOLID_VPHYSICS )
				local phys = self:GetPhysicsObject()  	
				if phys:IsValid() then
					phys:EnableMotion(false)
					phys:Sleep()  	
				end
				
				self.size = self.size + 1
				self:SetHealth(self:Health() + 100)
			else
				self.size = self.size + 1
				self:SetHealth(self:Health() + 100)
			end
			
			self.nextSpread = CurTime() + self.spreadTime
		end
		
		--npc spawning
		if(!self.nextSpawn) then self.nextSpawn = CurTime() end
		if(self.size == 20 and CurTime() > self.nextSpawn) then
			self:createPod() --makes the fire spread
				
			self.nextSpawn = CurTime() + nut.config.get("creepSpawnRate", 600)
		end
	end
end

function ENT:createSpread()
	if(nut.plugin.list["creep"].amt > nut.config.get("maxCreep", 50)) then return end

	local spread = ents.Create("nut_creepspread")
			
	if spread:IsValid() and self:IsValid() then
		spread:SetPos(self:GetPos() + Vector(0,0,30))
		spread:Spawn()
		spread:SetOwner( self )
							
		local phys = spread:GetPhysicsObject()
					
		if phys:IsValid() then
			local ang = self:EyeAngles()
			ang:RotateAroundAxis(ang:Forward(), math.random(-15, 15))
			ang:RotateAroundAxis(ang:Up(), math.random(-15, 15))
			ang:RotateAroundAxis(ang:Right(), math.random(-15, 15))
			phys:SetVelocityInstantaneous(ang:Up() * (math.random(500, 550) + (15 * self.size)))
		end
	end
end

function ENT:createPod()
	if(table.Count(nut.plugin.list["creep"].spawns) > nut.config.get("maxCreepSpawns", 15)) then return end

	local spread = ents.Create("nut_pod")
			
	if spread:IsValid() and self:IsValid() then
		spread:SetPos(self:GetPos() + Vector(0,0,30))
		spread:Spawn()
		spread:SetOwner( self )
							
		local phys = spread:GetPhysicsObject()
					
		if phys:IsValid() then
			local ang = self:EyeAngles()
			ang:RotateAroundAxis(ang:Forward(), math.random(-15, 15))
			ang:RotateAroundAxis(ang:Up(), math.random(-15, 15))
			ang:RotateAroundAxis(ang:Right(), math.random(-15, 15))
			phys:SetVelocityInstantaneous(ang:Up() * (math.random(500, 550) + (15 * self.size)))
		end
	end
end

function ENT:OnTakeDamage( dmginfo )
	if(dmginfo:IsDamageType(DMG_BURN) or dmginfo:IsDamageType(DMG_BLAST)) then
		self:Ignite(45)
		self:SetColor(Color(200,200,200,255))
	end
	
	self:SetHealth(self:Health() - dmginfo:GetDamage())
	
	if(self:Health() <= 0 and !self.dead) then
		if(self.size >= 3) then
			if(self.heart) then
				local spread = ents.Create("nz_leecher")
				spread:SetPos(self:GetPos() + Vector(0,0,30))
				spread:Spawn()
				spread:SetOwner(self)
			else
				local spread = ents.Create("nz_freak")
				spread:SetPos(self:GetPos() + Vector(0,0,30))
				spread:Spawn()
				spread:SetOwner(self)
				spread:SetMaterial("models/flesh")
			end
			self.dead = true
		end
		
		if(self.size > 1) then
			nut.item.spawn("food_monster_meat", self:GetPos() + Vector(0,0,30))
		end
		
		SafeRemoveEntity(self)
	end
end

function ENT:OnRemove()
	nut.plugin.list["creep"].amt = nut.plugin.list["creep"].amt - 1
	if(self.heart == true) then
		nut.plugin.list["creep"].heart = false
	end
end