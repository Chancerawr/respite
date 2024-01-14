ENT.Type = "anim"
ENT.PrintName = "Red Beacon"
ENT.Author = "Black Tea"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.Category = "NutScript Throwable"
ENT.RenderGroup 		= RENDERGROUP_BOTH

ENT.configLifetime = 1800
ENT.configPayload = .7

ENT.beaconColor = Color(255, 50, 50)
ENT.beaconSounds = {
	"common/warning.wav",
	"HL1/fvox/blip.wav",
	"HL1/fvox/bell.wav",
	"HL1/fvox/beep.wav"
}

if (SERVER) then
	function ENT:Initialize()
		self:SetModel("models/Items/grenadeAmmo.mdl")
		self:SetMaterial("phoenix_storms/bluemetal")
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self.lifetime = CurTime() + self.configLifetime
		self.payload = CurTime() + self.configLifetime * self.configPayload
		self:SetDTInt(0,math.random(1,4))
		self:SetDTBool(0,true)
		self:SetUseType(SIMPLE_USE)
		
		local physicsObject = self:GetPhysicsObject()
		if (IsValid(physicsObject)) then
			physicsObject:Wake()
		end
	end
	
	function ENT:OnRemove()
	end

	function ENT:Think()
		if self.payload < CurTime() then
			if self:GetDTBool(0) then
				self:SetDTBool(0,false)
				--self:Payload()
			end
		end
		
		if self.lifetime < CurTime() then
			nut.item.spawn("j_grenade_used", self:GetPos())
			self:Remove()
		end
		
		return CurTime()
	end
	
	function ENT:Use(activator)
	end
else
	function ENT:Initialize()
		self.lifetime = CurTime() + self.configLifetime
		self.beep = 255
		
		self.beaconSound = self.beaconSounds[math.random(#self.beaconSounds)]
	end
	
	function ENT:Draw()
		self:DrawModel()
	end
	
	function ENT:BeepLight()
		local firepos = self:GetPos() + ( self:GetUp() * 5 )
		local col = self.beaconColor
		local dlight = DynamicLight(self:EntIndex())
		dlight.Pos = firepos
		dlight.r = col.r
		dlight.g = col.g
		dlight.b = col.b
		dlight.Brightness = 5
		dlight.Size = 128 
		dlight.Decay = 256
		dlight.DieTime = CurTime() + 0.5
	end
	
	function ENT:Think()
		if self:GetDTBool(0) then
			self.beep = self.beep - FrameTime()*500
			if self.beep <= 0 then
				self.beep = 255
				self:EmitSound(self.beaconSound, 70, 150)
				self:BeepLight()
			end
		else
			self.beep = 0
		end
	end
	
	local GLOW_MATERIAL = Material("sprites/glow04_noz.vmt")
	function ENT:DrawTranslucent()
		if self:GetDTBool(0) then
			local firepos = self:GetPos() + ( self:GetUp() * 5 )
			local size = self.beep/5
			local col = self.beaconColor
			render.SetMaterial(GLOW_MATERIAL)
			render.DrawSprite(firepos, size, size, col )
		end
	end
end

function ENT:PhysicsCollide(data, phys)
	if data.Speed > 50 then
		self.Entity:EmitSound( Format( "physics/metal/metal_grenade_impact_hard%s.wav", math.random( 1, 3 ) ) ) 
	end
	
	local impulse = -data.Speed * data.HitNormal * 0.1 + (data.OurOldVelocity * -0.6)
	phys:ApplyForceCenter(impulse)
end
