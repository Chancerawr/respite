local PLUGIN = PLUGIN
PLUGIN.name = "Fallover Enhancements"
PLUGIN.author = "Chancer"
PLUGIN.desc = "Slight changes to default /fallover command."

local playerMeta = FindMetaTable("Player")

function playerMeta:createRagdoll(freeze)
	local entity = ents.Create("prop_ragdoll")
	entity:SetPos(self:GetPos())
	entity:SetAngles(self:EyeAngles())
	entity:SetModel(self:GetModel())
	entity:SetMaterial(self:GetMaterial())
	entity:SetSkin(self:GetSkin())
	
	local bodyGroups = entity:GetBodyGroups()
	for k, v in pairs(bodyGroups or {}) do
		entity:SetBodygroup(v.id,self:GetBodygroup(v.id))
	end
	
	entity:Spawn()
	entity:SetCollisionGroup(COLLISION_GROUP_WEAPON)
	entity:Activate()
	
	local velocity = self:GetVelocity()

	for i = 0, entity:GetPhysicsObjectCount() - 1 do
		local physObj = entity:GetPhysicsObjectNum(i)
		if (IsValid(physObj)) then
			local index = entity:TranslatePhysBoneToBone(i)
			if (index) then
				local position, angles = self:GetBonePosition(index)

				physObj:SetPos(position)
				physObj:SetAngles(angles)
			end
			if (freeze) then
				physObj:EnableMotion(false)
			else
				physObj:SetVelocity(velocity)
			end
		end
	end

	return entity
end

function playerMeta:setRagdolled(state, time, getUpGrace)
	getUpGrace = getUpGrace or time or 5

	if (state) then
		local moveType = self:GetMoveType()
		if(moveType == MOVETYPE_NOCLIP) then
			return false
		end
	
		if (IsValid(self.nutRagdoll)) then
			self.nutRagdoll:Remove()
		end
		
		local weap = self:GetActiveWeapon()
		if(IsValid(weap)) then
			self.activeWeapon = weap:GetClass()
			self.activeWeaponR = self:isWepRaised()
		end

		local entity = self:createRagdoll()
		
		local function PhysCallback(ent, data) -- Function that will be called whenever collision happends
			if (data) then
				if data.Speed > 350 then
					util.Decal("Blood", data.HitPos + data.HitNormal, data.HitPos - data.HitNormal)
				end
			end
		end
		entity:AddCallback("PhysicsCollide", PhysCallback) -- Add Callback
		
		entity:setNetVar("player", self)
		entity:CallOnRemove("fixer", function()
			if (IsValid(self)) then
				self:setLocalVar("blur", nil)
				self:setLocalVar("ragdoll", nil)

				if (!entity.nutNoReset) then
					self:SetPos(entity:GetPos())
				end

				self:SetNoDraw(false)
				self:SetNotSolid(false)
				self:Freeze(false)
				self:SetMoveType(MOVETYPE_WALK)
				self:SetLocalVelocity(
					IsValid(entity)
					and entity.nutLastVelocity
					or vector_origin
				)
			end

			if (IsValid(self) and !entity.nutIgnoreDelete) then
				if (entity.nutWeapons) then
					for k, v in ipairs(entity.nutWeapons) do
						local weapon = self:Give(v.class)
						if(weapon) then
							weapon:SetClip1(v.clip)
							
							self:SetAmmo(v.ammo, v.ammoType)
						end
						
						--reapplies custom weapon attributes after falling over
						for k, v in pairs(self:getChar():getInv():getItems()) do
							if(v:getData("equip", false)) then
								if(IsValid(weapon)) then
									weapon.item = v
								end
								
								if(v.weaponCategory) then
									self.carryWeapons[v.weaponCategory] = weapon
								end
							end
						end
						
						--timer.Simple(0, function()
							if(self.activeWeapon) then
								self:SelectWeapon(self.activeWeapon)

								if(self.activeWeaponR) then
									timer.Simple(0, function()
										self:setWepRaised(true)
									end)
									
									self.activeWeaponR = nil
								end
								
								self.activeWeapon = nil
							end
						--end)
					end
					
					--clear this for future fallovers
					entity.nutWeapons = {}
				end

				if (self:isStuck()) then
					entity:DropToFloor()
					self:SetPos(entity:GetPos() + Vector(0, 0, 16))

					local positions = nut.util.findEmptySpace(
						self,
						{entity, self}
					)
					for k, v in ipairs(positions) do
						self:SetPos(v)

						if (!self:isStuck()) then
							return
						end
					end
				end
			end
		end)

		self:setLocalVar("blur", 5)
		self.nutRagdoll = entity
		self:setNetVar("nutRagdoll", entity:EntIndex())
		
		entity:setNetVar("playerRag", true)
		entity.nutPlayer = self

		if (getUpGrace) then
			entity.nutGrace = CurTime() + getUpGrace
		end

		if (time and time > 0) then
			entity.nutStart = CurTime()
			entity.nutFinish = entity.nutStart + time

			self:setAction(
				"@wakingUp",
				nil, nil,
				entity.nutStart, entity.nutFinish
			)
		end

		entity.nutWeapons = entity.nutWeapons or {}
		
		--makes sure this doesn't get duplicated values in any case
		if(#entity.nutWeapons < 1) then
			for k, v in ipairs(self:GetWeapons()) do
				entity.nutWeapons[#entity.nutWeapons + 1] = {
					class = v:GetClass(),
					clip = v:Clip1(),
					ammoType = v:GetPrimaryAmmoType(),
					ammo = self:GetAmmoCount(v:GetPrimaryAmmoType())
				}
			end
		end

		self:GodDisable()
		self:StripWeapons()
		self:Freeze(true)
		self:SetNoDraw(true)
		self:SetNotSolid(true)
		self:SetMoveType(MOVETYPE_NONE)

		if (time) then
			local time2 = time
			local uniqueID = "nutUnRagdoll"..self:SteamID()

			timer.Create(uniqueID, 0.33, 0, function()
				if (IsValid(entity) and IsValid(self)) then
					local velocity = entity:GetVelocity()
					entity.nutLastVelocity = velocity

					self:SetPos(entity:GetPos())

					if (velocity:Length2D() >= 8) then
						if (!entity.nutPausing) then
							self:setAction()
							entity.nutPausing = true
						end

						return
					elseif (entity.nutPausing) then
						if(self:Alive()) then
							self:setAction("@wakingUp", time)
							entity.nutPausing = false
						end
					end

					time = time - 0.33

					if (time <= 0) then
						entity:Remove()
						self:setNetVar("nutRagdoll", nil)
					end
				else
					self:setNetVar("nutRagdoll", nil)
					timer.Remove(uniqueID)
				end
			end)
		end

		self:setLocalVar("ragdoll", entity:EntIndex())
		hook.Run("OnCharFallover", self, entity, true)
	elseif (IsValid(self.nutRagdoll)) then
		self.nutRagdoll:Remove()

		self:setNetVar("nutRagdoll", nil)
		hook.Run("OnCharFallover", self, entity, false)
	end
end

function PLUGIN:EntityTakeDamage(entity, dmgInfo)
	if (IsValid(entity.nutPlayer)) then
		if (dmgInfo:IsDamageType(DMG_CRUSH)) then
			if ((entity.nutFallGrace or 0) < CurTime()) then
				if (dmgInfo:GetDamage() <= 10) then
					dmgInfo:SetDamage(0)
				end

				entity.nutFallGrace = CurTime() + 0.5
			else
				return
			end
		end
		
		dmgInfo:ScaleDamage(0.2)

		entity.nutPlayer:TakeDamageInfo(dmgInfo)
	end
end