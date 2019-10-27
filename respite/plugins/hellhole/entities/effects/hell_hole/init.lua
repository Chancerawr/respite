local Effect_Scale = 0.5

local DebrisRand = {'models/props_debris/concrete_chunk02b.mdl', 'models/props_debris/concrete_chunk02a.mdl', 'models/props_debris/broken_pile001a.mdl', 'models/props_debris/concrete_chunk01a.mdl'}
local ParticleColor = Color( 230, 0, 0 )
local function nodraw() end
local increment = 0

// Utility functions
local function SetDesiredSequence( Ent, Seqs )
	for k, v in pairs( Seqs ) do
		local Seq = Ent:LookupSequence( v )
		if Seq == -1 then continue end
		Ent:ResetSequence( Seq )
	end
end

local function GetPlayerColor( self )
	return self.PlyCol
end

local function Cleanup( self )
	--self.CineDebris:Remove()
	self.Hand:Remove()
	self.Rim:Remove()
	
	if(self.FakeEnt) then
		self.FakeEnt:Remove()
	end
	
	for k, v in pairs( self.Debris ) do
		SafeRemoveEntity( v )
	end
end

// RenderOverrides

local function DrawFakeEnt( self )
	if !IsValid( self.Hell ) then return end
	
	local Col = 1 - self.Hell.PercentOpen
	local Col2 = Lerp( self.Hell.PercentOpen, 1, 0.65 )
	
	self:FrameAdvance( CurTime() - self.LastTick )
	self.LastTick = CurTime()
	
	self:SetPlaybackRate( 1 + self.Hell.PercentOpen )
	self:SetPoseParameter( "move_x", 0.5 )
	self:SetPoseParameter( "move_y", 2 )
	self:SetPoseParameter( "move_yaw",  60 )
	self:SetPoseParameter( "body_yaw",  90 )
	self:SetPoseParameter( "spine_yaw", 80 )
	
	render.SetColorModulation( Col2, Col, Col )
		self:DrawModel()
	render.SetColorModulation( 1, 1, 1 )
end

local function RenderDebris( self )
	if self.Hell.State == 2 then
		render.SetBlend( self.Hell.PercentOpen )
	end
	
	self:DrawModel()
	
	render.SetBlend( 1 )
end

local function DrawCineDebris( self )
	if self.Hell.State == 2 then
		render.SetBlend( self.Hell.PercentOpen )
	end
	
	self:SetRenderOrigin( self:GetPos() )
	self:SetRenderAngles( self:GetAngles() )
	self:DrawModel()
	
	self:FrameAdvance( CurTime() - self.LastTick )
	self.LastTick = CurTime()
	
	render.SetBlend( 1 )
end

/* Main effect code */

function EFFECT:Init(data)
	local Ent = data:GetEntity()

	// Save all the information we will need for later
	if(IsValid(Ent)) then
		self.Ent = Ent
	end
	
	if(self.Ent) then
		self.StartRenderOrigin = Ent:GetPos()
		self.StartRenderAngles = Ent:GetAngles()	
		self.EntRadius = Ent:BoundingRadius()
		self.EntOBBC = Ent:OBBCenter()
		self.StartPos = Ent:LocalToWorld( Ent:OBBCenter() ) + vector_up*Ent:OBBMins():Distance( Ent:OBBMaxs() ) 
	else
		self.StartRenderOrigin = data:GetOrigin()
		self.StartRenderAngles = data:GetAngles()
		self.StartPos = data:GetOrigin()
	end
	
	// Find good location
	local TD = {}
	TD.start = self.StartPos
	TD.endpos = self.StartPos - vector_up*810524
	TD.filter = Ent
	TD.mask = MASK_NPCWORLDSTATIC
	local Trace = util.TraceLine(TD)
	
	local Pos = Trace.HitPos
	
	if self.StartPos.z - Pos.z > 4096 then
		self.StartPos.z = Pos.z + 4096
	end
	
	//if self.StartPos.z:Distance( Pos.z ) > 
	//self.StartPos.z = math.min( 
	
	// Set up local variables
	self.Opened = false
	self.OpenTime = 4
	self.HandDelay = 3
	self.HandTime = 3
	self.CloseTime = 4
	
	self.State = 0
	self.StartTime = CurTime()
	self.PercentOpen = 0
	
	self.TotalTime = self.StartTime + self.OpenTime + self.HandTime + self.HandDelay + self.CloseTime
	self.HandGrabTime = self.StartTime + self.OpenTime + self.HandDelay + 0.5
	self.Grabbed = false
	
	self.NextVictimParticle = CurTime()
	self.NextOpenParticle = CurTime()
	self.NextOpenDebris = CurTime()
	self.NextHandParticle = CurTime()
	
	self.Debris = {}
	
	// Place hole
	self:SetModel( "models/props_combine/combine_citadelcloudcenter.mdl" )
	self:SetPos( Pos )
	self:SetAngles( Angle( 0, 0, 180 ) )
	self:SetColor(Color(150,0,0))
	self:DrawShadow( false )
	self:SetModelScale( Effect_Scale, 0 )
	
	// Set up rim (so you can't see stencil edge)
	self.Rim = ClientsideModel( "models/props_phx/construct/metal_angle360.mdl", RENDERGROUP_BOTH )
	self.Rim:SetColor(Color(150,0,0))
	self.Rim:SetMaterial("models/props_combine/masterinterface01c")
	self.Rim:SetRenderMode(RENDERMODE_TRANSALPHA)
	self.Rim:SetRenderFX(kRenderFxDistort)
	self.Rim:SetPos(Pos)
	self.Rim:SetNoDraw( true )
	self.Rim:DrawShadow( false )
	self.Rim:SetModelScale( Effect_Scale * 10, 0 )
	
	// Set up cinematic debris
	--[[
	self.CineDebris = ClientsideModel( "models/turtle/cinematic_debris.mdl", RENDERGROUP_BOTH )
	self.CineDebris.Hell = self
	self.CineDebris:SetPos( Pos )
	self.CineDebris:SetSequence( self.CineDebris:LookupSequence( "rip_open" ) )
	self.CineDebris:SetPlaybackRate( 1 )
	self.CineDebris:DrawShadow( false )
	self.CineDebris.LastTick = CurTime()
	self.CineDebris:SetModelScale( Effect_Scale, 0 )
	self.CineDebris.RenderOverride = DrawCineDebris
	--]]
	
	// Set up hand model
	self.Hand = ClientsideModel( "models/turtle/hell_hole_hand.mdl", RENDERGROUP_BOTH )
	self.Hand:SetPos( Pos )
	self.Hand:SetSequence( self.Hand:LookupSequence( "hand_grab" ) )
	self.Hand:SetPlaybackRate( 1 )
	self.Hand:SetNoDraw( true )
	self.Hand:DrawShadow( false )
	self.Hand.LastTick = CurTime()
	self.Hand:SetModelScale( Effect_Scale, 0 )
	self.WristBone = self.Hand:LookupBone( "grab_pos" )

	if(self.Ent) then
		// Set up fake entity that will be grabbed by the hand
		self.FakeEnt = ClientsideModel( Ent:GetModel(), RENDERGROUP_BOTH )
		self.FakeEnt:SetPos( Ent:GetPos() )
		self.FakeEnt:SetAngles( Ent:GetAngles() )
		self.FakeEnt:DrawShadow( false )
		self.FakeEnt.Hell = self
		self.FakeEnt.RenderOverride = DrawFakeEnt
		SetDesiredSequence(self.FakeEnt, {'run_all_01', 'run_all'})
		self.FakeEnt:SetPlaybackRate( 1 )
		self.FakeEnt:SetCycle( 0 )
		self.FakeEnt.LastTick = CurTime()
		//self.FakeEnt:SetIK( false )
		if self.Ent:IsPlayer() then
			self.FakeEnt.PlyCol = self.Ent:GetPlayerColor()
			self.FakeEnt.GetPlayerColor = GetPlayerColor
		end
	end
	
	--[[
	// Remove the old player model
	Ent:SetNoDraw(true)
	if Ent:IsPlayer() then
		for k, v in pairs(Ent:GetWeapons()) do
			v:SetNoDraw(true)
		end
	end
	Ent.RenderOverride = nodraw
	--]]
	
	// Extra death sounds
	util.ScreenShake(Pos, 50, 10, self.OpenTime + 0.5, 512) 
	sound.Play("weapons/debris1.wav", self:GetPos(), 120, 30)
	sound.Play("weapons/debris2.wav", self:GetPos(), 120, 30)
	sound.Play("weapons/debris3.wav", self:GetPos(), 120, 30)
	
	// Apply clean-up
	increment = increment+1
	self:CallOnRemove( 'HellHoleCleanup.'..increment, Cleanup )
end

local function PointInSphere( Pos, r )
	local theta = math.random()*2*math.pi
	local phi = math.Rand( -math.pi/2, math.pi/2 )
	
	return Pos + Vector( r * math.cos(theta) * math.cos(phi), r * math.sin(phi), r * math.sin(theta) * math.cos(phi) )
end

function EFFECT:VictimFloating()
	local Angles = self.StartRenderAngles
	local Pos = LerpVector( self.PercentOpen, self.StartRenderOrigin, self.StartPos )

	local P = math.sin( CurTime() )*0.25
	local Y = CurTime()%360
	local R = math.cos( CurTime() )*0.25
	
	Angles:RotateAroundAxis( Vector(1,0,0), P )
	Angles:RotateAroundAxis( Vector(0,1,0), R )
	
	local NewPos = Pos + vector_up*math.cos( CurTime() )*16

	self.FakeEnt:SetRenderOrigin( NewPos )
	self.FakeEnt:SetRenderAngles( Angles )
	
	local OBBC = Vector()+self.EntOBBC
	OBBC:Rotate( Angles )
	
	return OBBC + NewPos
end

function EFFECT:VictimParticles()
	local NewCenter = self:VictimFloating()

	local SpriteSize1 = (self.EntRadius*10)*self.PercentOpen
	local SpriteSize2 = (self.EntRadius*2.5)
	
	if self.NextVictimParticle > CurTime() then return end
	
	local NumParticles = 32

	local emitter = ParticleEmitter( self.FakeEnt:GetPos(), false )
		for i=0, NumParticles do
			local Pos = self.FakeEnt:GetPos()
	
			local particle = emitter:Add( "models/weapons/w_smg1/smg_crosshair", PointInSphere( NewCenter, self.EntRadius ) )
			if (particle) then
			
				local Vel = VectorRand()*80
				particle:SetVelocity( Vel + VectorRand()*100 )
		
				particle:SetLifeTime( 0 )
				particle:SetDieTime( 1 )
				
				particle:SetStartAlpha( 255 )
				particle:SetEndAlpha( 0 )
				
				particle:SetStartSize( 0 )
				particle:SetEndSize( 8*self.PercentOpen )
				
				particle:SetAirResistance( 200 )
				particle:SetGravity( Vector( math.Rand( -400, 400 ) , math.Rand( -400, 400 ) , math.Rand( -400, 400 )) )
				
				local RandDarkness = math.Rand( 0.8, 1.0 )
				particle:SetColor( 230, 0, 0 )
				
				particle:SetCollide( false )
				particle:SetLighting( false )
				
			end
		end
	emitter:Finish()
	
	self.NextVictimParticle = CurTime()+0.1
end

function EFFECT:OpenParticles()
	if self.NextOpenParticle > CurTime() then return end
	
	local NumParticles = 32
	
	local emitter = ParticleEmitter( self:GetPos(), false )
		for i=0, NumParticles do
			local angle = math.random()*2*math.pi
			local Pos = Vector( math.cos(angle)*(self.PercentOpen*420), math.sin(angle)*(self.PercentOpen*420), math.Rand(1,16) )*Effect_Scale
	
			local particle = emitter:Add( "effects/blood_drop", self:GetPos() + Pos )
			if (particle) then
			
				local Vel = Vector( math.cos(angle)*( (1 - self.PercentOpen)*450)*math.Rand(2,3), math.sin(angle)*( (1 - self.PercentOpen)*450)*math.Rand(2,3), math.Rand(200,300) )*Effect_Scale
				particle:SetVelocity( Vel + VectorRand()*100 )
				
				local Size = 0.5 + (1 - self.PercentOpen)*math.Rand( 60, 120 )*Effect_Scale
				
				particle:SetLifeTime( 0 )
				particle:SetDieTime( 2 )
				
				particle:SetStartAlpha( 255 )
				particle:SetEndAlpha( 0 )
				
				
				particle:SetStartSize( Size )
				particle:SetEndSize( Size*math.Rand( 2, 3 ) )
				
				particle:SetRoll( math.Rand(0, 360) )
				particle:SetRollDelta( math.Rand(-2, 2) )
				
				particle:SetAirResistance( 100 )
				particle:SetGravity( Vector( math.Rand( -400, 400 ) , math.Rand( -400, 400 ) ,-300) )
				
				local RandDarkness = math.Rand( 0.8, 1.0 )
				particle:SetColor( 127.5*RandDarkness, 115*RandDarkness, 100*RandDarkness )
				
				
				particle:SetCollide( true )
				particle:SetLighting( true )
				
			end
		end
	emitter:Finish()
	
	self.NextOpenParticle = CurTime()+0.1
end

function EFFECT:OpenDebris()
	if self.NextOpenDebris > CurTime() then return end
	
	local angle = math.random()*2*math.pi
	local Pos = Vector( math.cos(angle)*(self.PercentOpen*512), math.sin(angle)*(self.PercentOpen*512), math.Rand(1,16) )*Effect_Scale
	local Vel = Vector( math.cos(angle)*( (1 - self.PercentOpen)*450)*math.Rand(3,4), math.sin(angle)*( (1 - self.PercentOpen)*450)*math.Rand(3,4), math.Rand(200,300) )*Effect_Scale
	
	local Rock = ents.CreateClientProp()
	Rock:SetModel( table.Random(DebrisRand) )
	
	Rock:PhysicsInit( SOLID_VPHYSICS )
	Rock:SetMoveType( MOVETYPE_VPHYSICS )
	Rock:SetSolid( SOLID_VPHYSICS )
	
	Rock:SetPos( self:GetPos() + Pos + vector_up*32 )
	Rock:SetAngles( Angle( math.Rand(-180,180), math.Rand(-180,180), math.Rand(-180,180) ) )

	Rock:SetModelScale( math.Rand( 0.5, 2 )*Effect_Scale, 0 )
	
	local Brightness = math.Rand(0.6, 0.9)
	
	Rock:SetColor( Color( 250*Brightness, 240*Brightness, 240*Brightness ) )
	
	Rock.Hell = self
	Rock.RenderOverride = RenderDebris
	Rock:Spawn()
	
	local Phys = Rock:GetPhysicsObject()
	if Phys:IsValid() then
		Phys:Wake()				
		Phys:SetVelocity( Vel + VectorRand()*100 )
		Phys:AddAngleVelocity( VectorRand()*100 )
	end
	
	table.insert( self.Debris, Rock )
	
	self.NextOpenDebris = CurTime()+0.1
end

function EFFECT:HandParticles()
	if self.NextHandParticle > CurTime() then return end
	
	local NumParticles = 32
	
	local emitter = ParticleEmitter( self:GetPos(), false )
		for i=0, NumParticles do
			local angle = math.random()*2*math.pi
			local RandomRadius = math.Rand(0,450)
			local Pos = Vector( math.cos(angle)*(self.PercentOpen*RandomRadius), math.sin(angle)*(self.PercentOpen*RandomRadius), math.Rand(0,128) )*Effect_Scale
	
			local particle = emitter:Add( "effects/blood_drop", self:GetPos() + Pos )
			if (particle) then
			
				particle:SetVelocity( vector_up*500 )
				
				particle:SetLifeTime( 0 )
				particle:SetDieTime( 1.5 )
				
				particle:SetStartAlpha( 255 )
				particle:SetEndAlpha( 0 )
				
				local Size = math.Rand( 8, 32 )
				particle:SetStartSize( 0 )
				particle:SetEndSize( Size )
				
				particle:SetStartLength( math.Rand(60,90) )
				particle:SetEndLength( math.Rand( 90, 150) )
				
				
				particle:SetRoll( math.Rand(0, 360) )
				particle:SetRollDelta( math.Rand(-2, 2) )
				
				particle:SetAirResistance( 0 )
				particle:SetGravity( Vector(0,0,800)*Effect_Scale )
				
				particle:SetColor( 100*math.Rand(1, 2), 0, 0 )
				
				particle:SetCollide( true )
				particle:SetLighting( false )
				
			end
		end
	emitter:Finish()
	
	self.NextHandParticle = CurTime()+0.1
end

function EFFECT:ObjectGrabbed()	
	if(self.Ent) then
		SetDesiredSequence( self.FakeEnt, {'idle_all_01', 'idle_all'} )
	end
end

function EFFECT:OnOpen()
	if(self.Ent) then
		self.FakeEnt:SetNoDraw( true )
	end
	self:SetRenderBounds( Vector(-523, -551, -1794.919678),	Vector(546, 516, 10000794) )
end

function EFFECT:Think( )
	local TimeDifference = ( CurTime() - self.StartTime )
	if TimeDifference <= self.OpenTime then
		self.State = 0
		self.PercentOpen = (TimeDifference/self.OpenTime)
	elseif TimeDifference <= self.OpenTime+self.HandDelay+self.HandTime then
		self.State = 1
	else
		self.State = 2
		self.PercentOpen = (self.TotalTime - CurTime())/self.CloseTime
	end

	if(self.State != 2) then
		if((self.nextThinkSound or 0) < CurTime()) then
			self.nextThinkSound = CurTime() + 0.5
			sound.Play("weapons/debris" ..math.random(1,3).. ".wav", self:GetPos(), 120, math.random(20,30))
		end
	end	
	
	if !self.Grabbed && CurTime() >= self.HandGrabTime then
		self.Grabbed = true
		self:ObjectGrabbed()
	end
	
	if ( self.TotalTime > CurTime() ) then
		return true
	end
	
	return false
end

function EFFECT:TimeHandler()
	local DrawHand = false
	local TimeDifference = ( CurTime() - self.StartTime )
	if self.State == 0 then
		self:OpenParticles()
		--self:OpenDebris()
	elseif self.State == 1 then
		self:HandParticles()
		if TimeDifference >= self.OpenTime+self.HandDelay then
			if !self.Opened then
				self.Opened = true
				self:OnOpen()
			end
			
			self.Hand:SetRenderOrigin( self.StartPos )
			self.Hand:SetRenderAngles( self:GetAngles() + Angle(0,-90,0) )
			self.Hand:FrameAdvance( CurTime() - self.Hand.LastTick )
			self.Hand.LastTick = CurTime()
			
			DrawHand = false
		end
	else
		self:OpenParticles()
	end

	return DrawHand
end

function EFFECT:DrawMask( size, segments ) // I'm pretty sure most of this is from Jinto
	local pos = self:GetPos() + self:GetAngles():Up()*2
	local up = self:GetAngles():Right()
	local right = self:GetAngles():Forward()

	render.SetColorMaterial()
	mesh.Begin( MATERIAL_POLYGON, segments )

	for i = 0, segments - 1 do
		local rot = math.pi * 2 * ( i / segments )
		local sin = math.sin( rot ) * size
		local cos = math.cos( rot ) * size

		mesh.Position( pos + ( up * sin ) + ( right * cos ) )
		mesh.AdvanceVertex()
	end

	mesh.End()
end

function EFFECT:SetupStencils( Size )
	render.ClearStencil()
	render.SetStencilEnable( true )
	render.SetStencilCompareFunction( STENCIL_ALWAYS )
	render.SetStencilPassOperation( STENCIL_REPLACE )
	render.SetStencilFailOperation( STENCIL_KEEP )
	render.SetStencilZFailOperation( STENCIL_KEEP )
	render.SetStencilWriteMask( 1 )
	render.SetStencilTestMask( 1 )
	render.SetStencilReferenceValue( 1 )
	
	self:DrawMask( Size, 32 )

	render.SetStencilCompareFunction( STENCIL_EQUAL )
	render.ClearBuffersObeyStencil( 0, 0, 0, 0, true )
end

function EFFECT:SetupFog()
	local DistanceFix = EyePos():Distance( self:GetPos() )
	render.FogMode(MATERIAL_FOG_LINEAR)
	render.FogStart(80 + DistanceFix )
	render.FogEnd(1228 + DistanceFix)
	render.FogMaxDensity( 1 )
	render.FogColor(255, 10, 10) 
end

function EFFECT:RenderRim()
	--render.SetColorModulation(0.5, 0.5, 0.5)
		self.Rim:ManipulateBoneScale( 0, Vector( self.PercentOpen, self.PercentOpen, self.PercentOpen^2 ) )
		self.Rim:SetRenderOrigin( self:GetPos() + Vector( 0, 0, 2 + self.PercentOpen*2 ) )
		self.Rim:SetRenderAngles( self:GetAngles() )
		self.Rim:DrawModel()
	--render.SetColorModulation( 1, 1, 1 )
end

function EFFECT:CalculateFakePerson()
	--local Pos, Ang = self.Hand:GetBonePosition( self.WristBone )
	--self.FakeEnt:SetRenderOrigin( Pos )
	--self.FakeEnt:SetRenderAngles( Ang )
end

function EFFECT:DrawHand()
	local normal = Vector( 0, 0, 1 )
	local distance = normal:Dot( self:GetPos() )
	local alreadyClipping = render.EnableClipping( true )
	render.PushCustomClipPlane( normal, distance )
	
		--self.FakeEnt:DrawModel()
		--self.Hand:DrawModel()
	
	render.PopCustomClipPlane()
	render.EnableClipping( alreadyClipping )
end

function EFFECT:Render()
	local DrawHand = self:TimeHandler()
	
	self:SetupStencils( self.PercentOpen*495*Effect_Scale )
	self:SetupFog()
	
	render.SuppressEngineLighting( true )
		self:DrawModel()
	render.SuppressEngineLighting( false )

	if self.Grabbed then
		--self.FakeEnt:DrawModel()
		self:CalculateFakePerson()
	end
	
	if DrawHand then
		self.Hand:DrawModel()
	end
	
	render.SetStencilEnable( false )
	render.FogMode(MATERIAL_FOG_NONE)
	
	self:RenderRim()
	
	if DrawHand then
		self:DrawHand()
	end
	
	if(self.Ent) then
		if CurTime() <= self.HandGrabTime then
			self:VictimParticles()
		else
			self.FakeEnt:SetNoDraw(true)
		end
	end
	
	return true
end