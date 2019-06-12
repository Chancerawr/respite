
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include('shared.lua')

/*---------------------------------------------------------
Initialize
---------------------------------------------------------*/
function ENT:Initialize()

	self.Entity:SetModel("models/Items/grenadeAmmo.mdl")
	self.Entity:SetMaterial("models/props_interiors/radiator_albedo")
	self.Entity:PhysicsInit( SOLID_VPHYSICS )
	self.Entity:SetMoveType( MOVETYPE_VPHYSICS )
	self.Entity:SetSolid( SOLID_VPHYSICS )
	self.Entity:DrawShadow( false )
	
	-- Don't collide with the player
	self.Entity:SetCollisionGroup( COLLISION_GROUP_WEAPON )
	self.Entity:SetNetworkedString("Owner", "World")
	
	local phys = self.Entity:GetPhysicsObject()
	
	if (phys:IsValid()) then
		phys:Wake()
	end
	
  			local trail = util.SpriteTrail(self.Entity, self.Entity:LookupAttachment("fuse"), Color(255,0, 0), true, 8, 1, 1, (1 / 9) * 0.5, "sprites/bluelaser1.vmt");
			
			if (IsValid(trail)) then
				self.Entity:DeleteOnRemove(trail);
			end
	
	self.timer = CurTime() + 3
end

local exp

/*---------------------------------------------------------
Think
---------------------------------------------------------*/
function ENT:Think()
	if self.timer < CurTime() then

--	cbt_hcgexplode( self.Entity:GetPos(), 75, 200, 6)

	self:Explosion()
	self.Entity:Remove()
	end
end

/*---------------------------------------------------------
HitEffect
---------------------------------------------------------*/
function ENT:HitEffect()
	for k, v in pairs ( ents.FindInSphere( self.Entity:GetPos(), 600 ) ) do
		if v:IsValid() && v:IsPlayer() then
		end	
	end
end

/*---------------------------------------------------------
Explosion
---------------------------------------------------------*/
function ENT:Explosion()

	local effectdata = EffectData()
	effectdata:SetOrigin( self.Entity:GetPos() )
	util.Effect( "ManhackSparks", effectdata )

	local effectdata2 = EffectData()
	effectdata2:SetOrigin( self.Entity:GetPos() )
	util.Effect( "ManhackSparks", effectdata2 )
	
	self:EmitSound("physics/metal/metal_box_impact_bullet"..math.random(1,3)..".wav")
	self:EmitSound("physics/metal/metal_box_impact_bullet"..math.random(1,3)..".wav")
	self:EmitSound("physics/metal/metal_box_impact_bullet"..math.random(1,3)..".wav")
	self:EmitSound("physics/metal/metal_box_impact_bullet"..math.random(1,3)..".wav")
	self:EmitSound("physics/metal/metal_box_impact_bullet"..math.random(1,3)..".wav")
	self:EmitSound("physics/metal/metal_box_impact_bullet"..math.random(1,3)..".wav")
	
	nut.item.spawn("j_scrap_nails", self:GetPos())
	
	local explo = ents.Create( "env_explosion" )
		explo:SetOwner( self.GrenadeOwner )
		explo:SetPos( self.Entity:GetPos() )
		explo:SetKeyValue( "iMagnitude", "150" )
		explo:SetKeyValue( "radius", "100" )
		explo:SetKeyValue( "spawnflags", "64" )
		explo:Spawn()
		explo:Activate()
		explo:Fire( "Explode", "", 0 )
	
	
	local shake = ents.Create( "env_shake" )
		shake:SetOwner( self.Owner )
		shake:SetPos( self.Entity:GetPos() )
		shake:SetKeyValue( "amplitude", "500" )	-- Power of the shake
		shake:SetKeyValue( "radius", "300" )	-- Radius of the shake
		shake:SetKeyValue( "duration", "1" )	-- Time of shake
		shake:SetKeyValue( "frequency", "100" )	-- How har should the screenshake be
		shake:SetKeyValue( "spawnflags", "4" )	-- Spawnflags( In Air )
		shake:Spawn()
		shake:Activate()
		shake:Fire( "StartShake", "", 0 )
	
	
	--[[
	local ar2Explo = ents.Create( "env_ar2explosion" )
		ar2Explo:SetOwner( self.GrenadeOwner )
		ar2Explo:SetPos( self.Entity:GetPos() )
		ar2Explo:Spawn()
		ar2Explo:Activate()
		ar2Explo:Fire( "Explode", "", 0 )
	--]]

	--[[
	for k, v in pairs ( ents.FindInSphere( self.Entity:GetPos(), 250 ) ) do
		v:Fire( "EnableMotion", "", math.random( 0, 0.5 ) )
	end
	--]]
	
end

/*---------------------------------------------------------
OnTakeDamage
---------------------------------------------------------*/
function ENT:OnTakeDamage( dmginfo )
end


/*---------------------------------------------------------
Use
---------------------------------------------------------*/
function ENT:Use( activator, caller, type, value )
end


/*---------------------------------------------------------
StartTouch
---------------------------------------------------------*/
function ENT:StartTouch( entity )
end


/*---------------------------------------------------------
EndTouch
---------------------------------------------------------*/
function ENT:EndTouch( entity )
end


/*---------------------------------------------------------
Touch
---------------------------------------------------------*/
function ENT:Touch( entity )
end