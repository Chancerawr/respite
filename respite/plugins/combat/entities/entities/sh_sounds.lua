local PLUGIN = PLUGIN

function ENT:FootstepSound()
	local sound = self.FootstepSounds
	if(!sound) then return end
	
	if(istable(sound)) then
		sound = table.Random(sound)
		if(!sound) then return end
	end

	local pitch = self.StepPitch or 100
	if(istable(pitch)) then
		pitch = math.random(pitch[1], pitch[2])
	end

	self:EmitSound(sound, 75, pitch)
end

function ENT:AttackSound()
	local sound = self:getNetVar("AttackSounds", self.AttackSounds)
	if(!sound) then return end
	
	if(istable(sound)) then
		sound = table.Random(sound)
		if(!sound) then return end
	end
	
	if(!sound) then return end
	
	local pitch = self.AttackPitch or self.SoundPitch or 100
	if(istable(pitch)) then
		pitch = math.random(pitch[1], pitch[2])
	end

	local volume = self.SoundVolume or 1

	if(self.weapon) then
		self:EmitSound(sound, 120, pitch, volume, CHAN_AUTO, 0, self.SoundDSP or 1)
	else
		self:EmitSound(sound, 90, pitch, volume, CHAN_AUTO, 0, self.SoundDSP or 1)
	end
end

function ENT:SelectSound()
	local sound = self.SelectSounds
	if(!sound) then return end
	
	if(istable(sound)) then
		sound = table.Random(sound)
		if(!sound) then return end
	end
	
	if(!sound) then return end
	
	local pitch = self.SelectPitch or self.SoundPitch or 100
	if(istable(pitch)) then
		pitch = math.random(pitch[1], pitch[2])
	end

	local volume = self.SoundVolume or 1

	self:EmitSound(sound, 90, pitch, volume, CHAN_AUTO, 0, self.SoundDSP or 1)
end

function ENT:IdleSound()
	local sound = self.IdleSounds
	if(!sound) then return end
	
	if((self.nextIdleSound or 0) > CurTime()) then return end
	self.nextIdleSound = CurTime()+15
	
	if(istable(sound)) then
		sound = table.Random(sound)
		if(!sound) then return end
	end
	
	if(!sound) then return end
	
	local pitch = self.IdlePitch or self.SoundPitch or 100
	if(istable(pitch)) then
		pitch = math.random(pitch[1], pitch[2])
	end

	local volume = self.SoundVolume or 1

	self:EmitSound(sound, 75, pitch, volume, CHAN_AUTO, 0, self.SoundDSP or 1)
end

function ENT:DeathSound(ragdoll)
	local sound = self.DeathSounds
	if(!sound) then return end
	
	if(istable(sound)) then
		sound = table.Random(sound)
		if(!sound) then return end
	end
	
	if(!sound) then return end
	
	local pitch = self.DeathPitch or self.SoundPitch or 100
	if(istable(pitch)) then
		pitch = math.random(pitch[1], pitch[2])
	end

	local volume = self.SoundVolume or 1

	if(ragdoll) then
		ragdoll:EmitSound(sound, 90, pitch, volume, CHAN_AUTO, 0, self.SoundDSP or 1)
	else
		self:EmitSound(sound, 90, pitch, volume, CHAN_AUTO, 0, self.SoundDSP or 1)
	end
end

function ENT:PainSound()
	local sound = self.PainSounds
	if(!sound) then return end
	
	if(istable(sound)) then
		sound = table.Random(sound)
		if(!sound) then return end
	end
	
	if(!sound) then return end
	
	local pitch = self.PainPitch or self.SoundPitch or 100
	if(istable(pitch)) then
		pitch = math.random(pitch[1], pitch[2])
	end

	local volume = self.SoundVolume or 1

	self:EmitSound(sound, 90, pitch, volume, CHAN_AUTO, 0, self.SoundDSP or 1)
end

function ENT:HitSound(target)
	local sound = self.HitSounds
	if(!sound) then return end
	
	if(istable(sound)) then
		sound = table.Random(sound)
		if(!sound) then return end
	end
	
	if(!sound) then return end
	
	local pitch = self.HitPitch or 100
	if(istable(pitch)) then
		pitch = math.random(pitch[1], pitch[2])
	end
	
	if(target) then
		target:EmitSound(sound, 90, pitch)
	else
		self:EmitSound(sound, 90, pitch)
	end
end