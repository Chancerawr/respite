--from TFA Base

local vector_origin = Vector()

EFFECT.Life = 0.1
EFFECT.XFlashSize = 1
EFFECT.FlashSize = 1
EFFECT.SmokeSize = 1
EFFECT.SparkSize = 1
EFFECT.HeatSize = 1
EFFECT.Color = Color(255, 192, 64)
EFFECT.ColorSprites = false

local AddVel = Vector()
local ang

function EFFECT:Init(data)
	self.WeaponEnt = data:GetEntity()
	if not IsValid(self.WeaponEnt) then return end
	self.Attachment = data:GetAttachment()
	self.Position = self:GetTracerShootPos(data:GetOrigin(), self.WeaponEnt, self.Attachment)

	if IsValid(self.WeaponEnt:GetOwner()) then
		if self.WeaponEnt:GetOwner() == LocalPlayer() then
			if self.WeaponEnt:GetOwner():ShouldDrawLocalPlayer() then
				ang = self.WeaponEnt:GetOwner():EyeAngles()
				ang:Normalize()
				--ang.p = math.max(math.min(ang.p,55),-55)
				self.Forward = ang:Forward()
			else
				self.WeaponEnt = self.WeaponEnt:GetOwner():GetViewModel()
			end
			--ang.p = math.max(math.min(ang.p,55),-55)
		else
			ang = self.WeaponEnt:GetOwner():EyeAngles()
			ang:Normalize()
			self.Forward = ang:Forward()
		end
	end

	self.Forward = self.Forward or data:GetNormal()
	self.Angle = self.Forward:Angle()
	self.Right = self.Angle:Right()
	self.vOffset = self.Position
	local dir = self.Forward
	local ownerent = self.WeaponEnt:GetOwner()

	if not IsValid(ownerent) then
		ownerent = LocalPlayer()
	end

	AddVel = ownerent:GetVelocity()
	self.vOffset = self.Position
	AddVel = AddVel * 0.05
	local dot = dir:GetNormalized():Dot(GetViewEntity():EyeAngles():Forward())
	local halofac = math.abs(dot)
	local epos = ownerent:EyePos()
	local dlight = DynamicLight(ownerent:EntIndex())

	if (dlight) then
		dlight.pos = epos + ownerent:EyeAngles():Forward() * self.vOffset:Distance(epos) --self.vOffset - ownerent:EyeAngles():Right() * 5 + 1.05 * ownerent:GetVelocity() * FrameTime()
		dlight.r = self.Color.r
		dlight.g = self.Color.g
		dlight.b = self.Color.b
		dlight.brightness = 4.5
		dlight.decay = 200 / self.Life
		dlight.size = self.FlashSize * 96
		dlight.dietime = CurTime() + self.Life
	end

	self.Dist = self.vOffset:Distance(epos)
	self.DLight = dlight
	self.DieTime = CurTime() + self.Life
	self.OwnerEnt = ownerent
	local emitter = ParticleEmitter(self.vOffset)
	local sval = 1 - math.random(0, 1) * 2

	if self.WeaponEnt.XTick == nil then
		self.WeaponEnt.XTick = 0
	end

	self.WeaponEnt.XTick = 1 - self.WeaponEnt.XTick

	if self.WeaponEnt.XTick == 1 and self.XFlashSize > 0 then
		local particle = emitter:Add(self.ColorSprites and "effects/muzzleflashx_nemole_w" or "effects/muzzleflashx_nemole", self.vOffset + FrameTime() * AddVel)

		if (particle) then
			particle:SetVelocity(dir * 4 * self.XFlashSize)
			particle:SetLifeTime(0)
			particle:SetDieTime(self.Life / 2)
			particle:SetStartAlpha(math.Rand(200, 255))
			particle:SetEndAlpha(0)
			--particle:SetStartSize( 8 * (halofac*0.8+0.2), 0, 1)
			--particle:SetEndSize( 0 )
			particle:SetStartSize(3 * (halofac * 0.8 + 0.2) * self.XFlashSize)
			particle:SetEndSize(15 * (halofac * 0.8 + 0.2) * self.XFlashSize)
			local r = math.Rand(-10, 10) * 3.14 / 180
			particle:SetRoll(r)
			particle:SetRollDelta(r / 5)

			if self.ColorSprites then
				particle:SetColor(self.Color.r, self.Color.g, self.Color.b)
			else
				particle:SetColor(255, 255, 255)
			end

			particle:SetLighting(false)
			particle.FollowEnt = self.WeaponEnt
			particle.Att = self.Attachment
			particle:SetPos(vector_origin)
		end
		--particle:SetStartSize( 8 * (halofac*0.8+0.2), 0, 1)
		--particle:SetEndSize( 0 )
	elseif self.XFlashSize > 0 then
		local particle = emitter:Add(self.ColorSprites and "effects/muzzleflashx_nemole_w" or "effects/muzzleflashx_nemole", self.vOffset + FrameTime() * AddVel)

		if (particle) then
			particle:SetVelocity(dir * 4 * self.FlashSize)
			particle:SetLifeTime(0)
			particle:SetDieTime(self.Life / 2)
			particle:SetStartAlpha(math.Rand(200, 255))
			particle:SetEndAlpha(0)
			particle:SetStartSize(2 * (halofac * 0.8 + 0.2) * 0.3 * self.FlashSize)
			particle:SetEndSize(6 * (halofac * 0.8 + 0.2) * 0.3 * self.FlashSize)
			local r = math.Rand(-10, 10) * 3.14 / 180
			particle:SetRoll(r)
			particle:SetRollDelta(r / 5)

			if self.ColorSprites then
				particle:SetColor(self.Color.r, self.Color.g, self.Color.b)
			else
				particle:SetColor(255, 255, 255)
			end

			particle:SetLighting(false)
			particle.FollowEnt = self.WeaponEnt
			particle.Att = self.Attachment
			particle:SetPos(vector_origin)
		end
	end

	local flashCount = math.Round(self.FlashSize * 8)

	for i = 1, flashCount do
		local particle = emitter:Add(self.ColorSprites and "effects/scotchmuzzleflashw" or "effects/scotchmuzzleflash4", self.vOffset + FrameTime() * AddVel)

		if (particle) then
			particle:SetVelocity(dir * 300 * (0.2 + (i / flashCount) * 0.8) * self.FlashSize)
			particle:SetLifeTime(0)
			particle:SetDieTime(self.Life * 0.75)
			particle:SetStartAlpha(math.Rand(128, 255))
			particle:SetEndAlpha(0)
			--particle:SetStartSize( 7.5 * (halofac*0.8+0.2), 0, 1)
			--particle:SetEndSize( 0 )
			local szsc = 1 + (flashCount - i) * math.pow(1 / flashCount * 0.9,0.8)
			particle:SetStartSize(1.25 * math.Rand(1, 1.5) * szsc * self.FlashSize)
			particle:SetEndSize(6 * math.Rand(0.75, 1) * szsc * self.FlashSize)
			particle:SetRoll(math.rad(math.Rand(0, 360)))
			particle:SetRollDelta(math.rad(math.Rand(15, 30)) * sval)

			if self.ColorSprites then
				particle:SetColor(self.Color.r, self.Color.g, self.Color.b)
			else
				particle:SetColor(255, 255, 255)
			end

			particle:SetLighting(false)
			particle.FollowEnt = self.WeaponEnt
			particle.Att = self.Attachment
		end
	end

	for _ = 1, flashCount do
		local particle = emitter:Add("effects/scotchmuzzleflash1", self.vOffset + FrameTime() * AddVel)

		if (particle) then
			particle:SetVelocity(dir * 6 * self.FlashSize + 1.05 * AddVel)
			particle:SetLifeTime(0)
			particle:SetDieTime(self.Life * 1)
			particle:SetStartAlpha(math.Rand(40, 140))
			particle:SetEndAlpha(0)
			--particle:SetStartSize( 7.5 * (halofac*0.8+0.2), 0, 1)
			--particle:SetEndSize( 0 )
			particle:SetStartSize(2 * math.Rand(1, 1.5) * self.FlashSize)
			particle:SetEndSize(20 * math.Rand(0.5, 1) * self.FlashSize)
			particle:SetRoll(math.rad(math.Rand(0, 360)))
			particle:SetRollDelta(math.rad(math.Rand(30, 60)) * sval)

			if self.ColorSprites then
				particle:SetColor(self.Color.r, self.Color.g, self.Color.b)
			else
				particle:SetColor(255, 255, 255)
			end

			particle:SetLighting(false)
			particle.FollowEnt = self.WeaponEnt
			particle.Att = self.Attachment
		end
	end

	local glowCount = math.ceil(self.FlashSize * 3)

	for i = 1, glowCount do
		local particle = emitter:Add("effects/scotchmuzzleflash1", self.vOffset + dir * 0.9 * i)

		if (particle) then
			--particle:SetVelocity(dir * 32 )
			particle:SetLifeTime(0)
			particle:SetDieTime(self.Life * 0.75)
			particle:SetStartAlpha(255 * (1 - halofac))
			particle:SetEndAlpha(0)
			--particle:SetStartSize( 7.5 * (halofac*0.8+0.2), 0, 1)
			--particle:SetEndSize( 0 )
			particle:SetStartSize(math.max(12 - 12 / glowCount * i * 0.5, 1) * 0.2 * self.FlashSize)
			particle:SetEndSize(math.max(12 - 12 / glowCount * i * 0.5, 1) * 0.6 * self.FlashSize)
			particle:SetRoll(math.rad(math.Rand(0, 360)))
			particle:SetRollDelta(math.rad(math.Rand(15, 30)) * sval)

			if self.ColorSprites then
				particle:SetColor(self.Color.r, self.Color.g, self.Color.b)
			else
				particle:SetColor(255, 255, 255)
			end

			particle:SetLighting(false)
			particle.FollowEnt = self.WeaponEnt
			particle.Att = self.Attachment
		end
	end

	local smokeCount = math.ceil(self.SmokeSize * 6)

	for _ = 0, smokeCount do
		local particle = emitter:Add("particles/smokey", self.vOffset + dir * math.Rand(3, 14))

		if (particle) then
			particle:SetVelocity(VectorRand() * 10 * self.SmokeSize + dir * math.Rand(35, 50) * self.SmokeSize + 1.05 * AddVel)
			particle:SetDieTime(math.Rand(0.6, 1) * self.Life * 6)
			particle:SetStartAlpha(math.Rand(12, 24))
			particle:SetEndAlpha(0)
			particle:SetStartSize(math.Rand(5, 7) * self.SmokeSize)
			particle:SetEndSize(math.Rand(15, 20) * self.SmokeSize)
			particle:SetRoll(math.rad(math.Rand(0, 360)))
			particle:SetRollDelta(math.Rand(-0.8, 0.8))
			particle:SetLighting(true)
			particle:SetAirResistance(20)
			particle:SetGravity(Vector(0, 0, 60))
			particle:SetColor(255, 255, 255)
		end
	end

	local sparkcount = math.Round(math.random(8, 12) * self.SparkSize)

	for _ = 0, sparkcount do
		local particle = emitter:Add("effects/yellowflare", self.Position)

		if (particle) then
			particle:SetVelocity( VectorRand() * 30 * self.SparkSize)
			particle:SetVelocity(particle:GetVelocity() + 1.15 * AddVel )
			particle:SetVelocity( particle:GetVelocity() + dir * math.Rand(80, 100) * (1-math.abs(math.max(particle:GetVelocity():GetNormalized():Dot(-dir),0))) * self.SparkSize )
			particle:SetLifeTime(0)
			particle:SetDieTime(self.Life * math.Rand(0.9,1.1))
			particle:SetStartAlpha(255)
			particle:SetEndAlpha(0)
			particle:SetStartSize(0.6)
			particle:SetEndSize(1)
			particle:SetRoll(math.rad(math.Rand(0, 360)))
			particle:SetGravity(vector_origin)
			particle:SetAirResistance(1)
			particle:SetStartLength(0.1)
			particle:SetEndLength(0.05)

			if self.ColorSprites then
				particle:SetColor(self.Color.r, self.Color.g, self.Color.b)
			else
				particle:SetColor(255, math.random(192, 225), math.random(140, 192))
			end

			particle:SetVelocityScale(true)
			local sl = self.SparkSize

			particle:SetThinkFunction(function(pa)
				math.randomseed(SysTime())
				local spd = pa:GetVelocity():Length()*12
				pa.ranvel = pa.ranvel or VectorRand() * spd
				pa.ranvel:Add(VectorRand() * spd * math.sqrt(FrameTime()))
				pa:SetVelocity(pa:GetVelocity() + pa.ranvel * sl * FrameTime() )
				pa:SetNextThink(CurTime())
			end)

			particle:SetNextThink(CurTime() + 0.01)
		end
	end

	local particle = emitter:Add("sprites/heatwave", self.vOffset + dir*2)

	if (particle) then
		particle:SetVelocity(dir * 25 * self.HeatSize + 1.05 * AddVel)
		particle:SetLifeTime(0)
		particle:SetDieTime(self.Life)
		particle:SetStartAlpha(math.Rand(200, 225))
		particle:SetEndAlpha(0)
		particle:SetStartSize(math.Rand(3, 5) * self.HeatSize)
		particle:SetEndSize(math.Rand(8, 12) * self.HeatSize)
		particle:SetRoll(math.Rand(0, 360))
		particle:SetRollDelta(math.Rand(-2, 2))
		particle:SetAirResistance(5)
		particle:SetGravity(Vector(0, 0, 40))
		particle:SetColor(255, 255, 255)
	end

	emitter:Finish()
end

function EFFECT:Think()
	if CurTime() > self.DieTime then
		return false
	elseif self.DLight and IsValid(self.OwnerEnt) then
		self.DLight.pos = self.OwnerEnt:EyePos() + self.OwnerEnt:EyeAngles():Forward() * self.Dist
	end

	return true
end

function EFFECT:Render()
end