-- Flashbang Entity originally made by Cheesylard but modified by me. Cheesy, if you really don't appreciate what I take from you, just tell me, I'll remove this flash.

AddCSLuaFile("shared.lua")
include("shared.lua")

/*---------------------------------------------------------
Initialize
---------------------------------------------------------*/
function ENT:Initialize()
	self.Entity:SetModel("models/Items/grenadeAmmo.mdl")
	self.Entity:SetMaterial("models/flesh")
	self.Entity:PhysicsInit(SOLID_VPHYSICS)
	self.Entity:SetMoveType(MOVETYPE_VPHYSICS)
	self.Entity:SetSolid(SOLID_VPHYSICS)
	self.Entity:DrawShadow(false)
	
	-- Don't collide with the player
	self.Entity:SetCollisionGroup(COLLISION_GROUP_WEAPON)
	self.Entity:SetNetworkedString("Owner", "World")
	
	local phys = self.Entity:GetPhysicsObject()
	
	if (phys:IsValid()) then
		phys:Wake()
	end
	
	self.timer = CurTime() + 3
	
	local trail = util.SpriteTrail(self.Entity, self.Entity:LookupAttachment("fuse"), Color(255, 0, 0), true, 8, 1, 1, (1 / 9) * 0.5, "sprites/bluelaser1.vmt");
	
	if (IsValid(trail)) then
		self.Entity:DeleteOnRemove(trail)
	end
	
	timer.Simple(1, function()
		if self.Entity then 
			self:Explode() 
		end
	end)
end

/*---------------------------------------------------------
Explode
---------------------------------------------------------*/
function ENT:Explode()
	self.Entity:EmitSound("physics/flesh/flesh_bloody_break.wav", 95, 150)

	local entities = ents.FindInSphere(self:GetPos(), 400) 
	
	for k, v in pairs(entities) do
		if(!IsValid(v)) then continue end
	
		if(v.respite) then
			v.team = math.random(7,20)
		end
	end
	
	local blood
	blood = ents.Create("env_smoketrail")
	blood:SetKeyValue("startsize","100000")
	blood:SetKeyValue("endsize","130")
	blood:SetKeyValue("spawnradius","250")
	blood:SetKeyValue("minspeed","0.1")
	blood:SetKeyValue("maxspeed","0.5")
	blood:SetKeyValue("startcolor","200 0 0")
	blood:SetKeyValue("endcolor","200 0 0")
	blood:SetKeyValue("opacity","1")
	blood:SetKeyValue("spawnrate","15")
	blood:SetKeyValue("lifetime","15")
	blood:SetPos(self:GetPos())
	--blood:SetParent(self)
	blood:Spawn()
	blood:Fire("kill", "", 20)

	nut.item.spawn("j_grenade_used", self:GetPos())

	self.Entity:Remove()
end

/*---------------------------------------------------------
Think
---------------------------------------------------------*/
function ENT:Think()
end

/*---------------------------------------------------------
OnTakeDamage
---------------------------------------------------------*/
function ENT:OnTakeDamage()
end

/*---------------------------------------------------------
Use
---------------------------------------------------------*/
function ENT:Use()
end

/*---------------------------------------------------------
StartTouch
---------------------------------------------------------*/
function ENT:StartTouch()
end

/*---------------------------------------------------------
EndTouch
---------------------------------------------------------*/
function ENT:EndTouch()
end

/*---------------------------------------------------------
Touch
---------------------------------------------------------*/
function ENT:Touch()
end