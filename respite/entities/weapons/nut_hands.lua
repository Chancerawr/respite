AddCSLuaFile()

if (CLIENT) then
	SWEP.PrintName = "Hands"
	SWEP.Slot = 0
	SWEP.SlotPos = 1
	SWEP.DrawAmmo = false
	SWEP.DrawCrosshair = false
end

SWEP.Author = "Chessnut"
SWEP.Instructions = "Primary Fire: [RAISED] Punch\nSecondary Fire: Knock/Pickup"
SWEP.Purpose = "Hitting things, knocking on doors, and moving things."

SWEP.ViewModelFOV = 45
SWEP.ViewModelFlip = false
SWEP.AnimPrefix	 = "rpg"

SWEP.ViewTranslation = 4

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = ""
SWEP.Primary.Damage = 5
SWEP.Primary.Delay = 0.75

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = 0
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = ""

SWEP.ViewModel = Model("models/weapons/c_arms_cstrike.mdl")
SWEP.WorldModel = ""

SWEP.UseHands = false
SWEP.LowerAngles = Angle(0, 5, -14)
SWEP.LowerAngles2 = Angle(0, 5, -22)

SWEP.FireWhenLowered = true
SWEP.HoldType = "fist"

function SWEP:PreDrawViewModel(viewModel, weapon, client)
	local hands = player_manager.TranslatePlayerHands(player_manager.TranslateToPlayerModelName(client:GetModel()))

	if (hands and hands.model) then
		viewModel:SetModel(hands.model)
		viewModel:SetSkin(hands.skin)
		viewModel:SetBodyGroups(hands.body)
	end
end

ACT_VM_FISTS_DRAW = 3
ACT_VM_FISTS_HOLSTER = 2

function SWEP:Deploy()
	if (!IsValid(self.Owner)) then
		return
	end

	local viewModel = self.Owner:GetViewModel()

	if (IsValid(viewModel)) then
		viewModel:SetPlaybackRate(1)
		viewModel:ResetSequence(ACT_VM_FISTS_DRAW)
	end

	return true
end

function SWEP:Holster()
	if (!IsValid(self.Owner)) then
		return
	end

	local viewModel = self.Owner:GetViewModel()

	if (IsValid(viewModel)) then
		viewModel:SetPlaybackRate(1)
		viewModel:ResetSequence(ACT_VM_FISTS_HOLSTER)
	end

	return true
end

function SWEP:Think()
	local client = self.Owner

	if (CLIENT) then
		if (IsValid(client)) then
			local viewModel = client:GetViewModel()

			if (IsValid(viewModel)) then
				viewModel:SetPlaybackRate(1)
			end
		end
	end

	if(SERVER) then
		if (client:KeyDown(IN_ATTACK) or client:KeyDown(IN_ATTACK2)) then
			local data = {}
				data.start = client:GetShootPos()
				data.endpos = data.start + client:GetAimVector()*84
				data.filter = {self, client}
			local trace = util.TraceLine(data)
			local entity = trace.Entity
			self.tracePos = trace.HitPos

			if (IsValid(entity)) then
				if (entity:IsPlayer() or entity:IsNPC()) then return end
				
				local physObj = entity:GetPhysicsObject()
				if(!IsValid(physObj)) then return end
				
				local mass = physObj:GetMass()
				if (mass > 100) then
					if((self.nextPush or 0) < CurTime()) then
						self.nextPush = CurTime() + 0.05
					
						if(client:KeyDown(IN_ATTACK)) then
							self:applyForce(entity, 7500)
						else
							self:applyForce(entity, -7500)
						end
					end
				--[[	
				elseif(entity:IsRagdoll()) then
					if((self.nextPush or 0) < CurTime()) then
						if(client:KeyDown(IN_ATTACK)) then
							self:applyForce(entity, 2500)
						else
							self:applyForce(entity, -2500)
						end
						
						self.nextPush = CurTime() + 0.05
					end
				--]]
				end
			end
		end
	end
end

function SWEP:Precache()
	util.PrecacheSound("npc/vort/claw_swing1.wav")
	util.PrecacheSound("npc/vort/claw_swing2.wav")
	util.PrecacheSound("physics/plastic/plastic_box_impact_hard1.wav")	
	util.PrecacheSound("physics/plastic/plastic_box_impact_hard2.wav")	
	util.PrecacheSound("physics/plastic/plastic_box_impact_hard3.wav")	
	util.PrecacheSound("physics/plastic/plastic_box_impact_hard4.wav")
	util.PrecacheSound("physics/wood/wood_crate_impact_hard2.wav")
	util.PrecacheSound("physics/wood/wood_crate_impact_hard3.wav")
end

function SWEP:Initialize()
	self:SetHoldType(self.HoldType)
	self.LastHand = 0
end

function SWEP:DoPunchAnimation()
	self.LastHand = math.abs(1 - self.LastHand)

	local sequence = 4 + self.LastHand
	local viewModel = self.Owner:GetViewModel()

	if (IsValid(viewModel)) then
		viewModel:SetPlaybackRate(0.5)
		viewModel:SetSequence(sequence)
	end
end

function SWEP:PrimaryAttack()
	if (!IsFirstTimePredicted()) then
		return
	end
	
	if(SERVER) then
		self:resetHeld(self.heldEntity)
	end

	self:SetNW2Bool("holdingObject", false)
	
	if (hook.Run("CanPlayerThrowPunch", self.Owner) == false) then
		return
	end	
	
	self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)

	local staminaUse = nut.config.get("punchStamina")

	if (staminaUse > 0) then
		local value = self.Owner:getLocalVar("stm", 0) - staminaUse

		if (value < 0) then
			return
		elseif (SERVER) then
			self.Owner:setLocalVar("stm", value)
		end
	end

	if (SERVER) then
		self.Owner:EmitSound("npc/vort/claw_swing"..math.random(1, 2)..".wav")
	end

	local damage = self.Primary.Damage

	self:DoPunchAnimation()

	self.Owner:SetAnimation(PLAYER_ATTACK1)
	self.Owner:ViewPunch(Angle(self.LastHand + 2, self.LastHand + 5, 0.125))

	timer.Simple(0.055, function()
		if (IsValid(self) and IsValid(self.Owner)) then
			local damage = self.Primary.Damage
			local context = {damage = damage}
			local result = hook.Run("PlayerGetFistDamage", self.Owner, damage, context)

			if (result != nil) then
				damage = result
			else
				damage = context.damage
			end

			self.Owner:LagCompensation(true)
			local data = {}
				data.start = self.Owner:GetShootPos()
				data.endpos = data.start + self.Owner:GetAimVector()*96
				data.filter = self.Owner
			local trace = util.TraceLine(data)

			if (SERVER and trace.Hit) then
				local entity = trace.Entity

				if (IsValid(entity)) then
					local damageInfo = DamageInfo()
						damageInfo:SetAttacker(self.Owner)
						damageInfo:SetInflictor(self)
						damageInfo:SetDamage(damage)
						damageInfo:SetDamageType(DMG_SLASH)
						damageInfo:SetDamagePosition(trace.HitPos)
						damageInfo:SetDamageForce(self.Owner:GetAimVector()*10000)
					entity:DispatchTraceAttack(damageInfo, data.start, data.endpos)

					self.Owner:EmitSound("physics/body/body_medium_impact_hard" ..math.random(1, 6).. ".wav", 80)
				end
			end

			hook.Run("PlayerThrowPunch", self.Owner, trace)
			self.Owner:LagCompensation(false)
		end
	end)
end

function SWEP:applyForce(entity, strength)
	local physicsObject = entity:GetPhysicsObject()

	if (!IsValid(physicsObject)) then
		return false
	end

	if(!physicsObject:IsMoveable()) then
		return false
	end

	physicsObject:ApplyForceOffset(self.Owner:GetAimVector() * strength, self.tracePos)
	self.tracePos = nil
end

function SWEP:resetHeld(entity)
	if(IsValid(entity)) then
		self.heldEntity = nil
		self:SetNW2Bool("holdingObject", false)
		
		if(entity.oldCollision) then
			entity:SetCollisionGroup(entity.oldCollision)
		end
	end
end

function SWEP:onCanPickup(entity)
	--ignores invalid entities, players, npcs, and nextbots
	if(!IsValid(entity) or entity:IsPlayer() or entity:IsNPC() or entity:IsNextBot()) then
		return false
	end
	
	--[[
	--ignores ragdolls
	if(entity:IsRagdoll()) then
		return false
	end
	--]]
	
	--if something is already being carried
	if (IsValid(self.heldEntity)) then 
		return false
	end

	local physicsObject = entity:GetPhysicsObject()

	if (!IsValid(physicsObject)) then
		return false
	end

	if(!physicsObject:IsMoveable()) then
		return false
	end
	
	--things that are too heavy to carry
	local mass = physicsObject:GetMass()
	if (physicsObject:GetMass() > 100) then
		return false
	end

	return true
end

function SWEP:Pickup(entity)
	if (entity:IsPlayerHolding()) then --if it is already being held
		return
	end
	
	if (self.heldEntity != entity) then
		self.heldEntity = nil
		self:SetNW2Bool("holdingObject", false)
	end

	self.heldEntity = entity
	self:SetNW2Bool("holdingObject", true)
	
	local physObj = entity:GetPhysicsObject()
	physObj:Wake()
	
	timer.Simple(0.1, function() --for some reason this only works on a timer
		if(IsValid(entity)) then
			local currentGroup = entity:GetCollisionGroup()
			
			if(currentGroup != COLLISION_GROUP_WEAPON) then
				entity.oldCollision = currentGroup
			end
			entity:SetCollisionGroup(COLLISION_GROUP_WEAPON)

			self.Owner:PickupObject(entity) 
			self.Owner:EmitSound("physics/body/body_medium_impact_soft"..math.random(1, 3)..".wav", 75)
		end
	end)

	self:SetNextSecondaryFire(CurTime() + 0.2)
end

local hull = Vector(4, 4, 4)
function SWEP:SecondaryAttack()
	if(CLIENT) then return false end

	if (!IsFirstTimePredicted()) then
		return
	end

	local client = self.Owner
	
	local data = {}
		data.start = client:GetShootPos()
		data.endpos = data.start + client:GetAimVector() * 200
		data.filter = {self, client}
		data.mins = -hull
		data.maxs = hull
	local trace = util.TraceHull(data)
	local entity = trace.Entity
	self.tracePos = trace.HitPos
	
	if (IsValid(entity)) then
		--drops a carried object if holding one
		if(IsValid(self.heldEntity)) then
			local isHeld = self.heldEntity == entity
		
			client:DropObject()

			self:resetHeld(entity)
			
			--drops the thing
			if(isHeld) then
				return
			end
		end
	
		if (entity:isDoor()) then
			if (hook.Run("PlayerCanKnock", client, entity) == false) then
				return
			end

			client:ViewPunch(Angle(-1.3, 1.8, 0))
			client:EmitSound("physics/wood/wood_crate_impact_hard"..math.random(2, 3)..".wav")	
			client:SetAnimation(PLAYER_ATTACK1)

			self:DoPunchAnimation()
			self:SetNextSecondaryFire(CurTime() + 0.1)
			self:SetNextPrimaryFire(CurTime() + 1)
		elseif (self:onCanPickup(entity)) then --if it can be picked up, then pick it up
			self:Pickup(entity)
		end
	elseif(!IsValid(entity)) then
		self:resetHeld(entity)
	end
end