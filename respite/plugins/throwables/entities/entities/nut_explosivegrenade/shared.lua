ENT.Type = "anim"
ENT.PrintName		= "EXPLOSIVE GRENADE"
ENT.Author			= "WORSHIPPER"
ENT.Contact			= ""
ENT.Purpose			= ""
ENT.Instructions	= ""

/*---------------------------------------------------------
OnRemove
---------------------------------------------------------*/
function ENT:OnRemove()
end

/*---------------------------------------------------------
PhysicsUpdate
---------------------------------------------------------*/
function ENT:PhysicsUpdate()
end

/*---------------------------------------------------------
PhysicsCollide
---------------------------------------------------------*/
function ENT:PhysicsCollide(data,phys)
	if data.Speed > 50 then
		self.Entity:EmitSound( Format( "physics/metal/metal_grenade_impact_hard%s.wav", math.random( 1, 3 ) ) )
	end
	
	local impulse = -data.Speed * data.HitNormal * .4 + (data.OurOldVelocity * -.6)
	phys:ApplyForceCenter(impulse)
end
