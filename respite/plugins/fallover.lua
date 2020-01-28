local PLUGIN = PLUGIN
PLUGIN.name = "Fallover Enhancements"
PLUGIN.author = "Chancer"
PLUGIN.desc = "Slight changes to default /fallover command."

local playerMeta = FindMetaTable("Player")

function playerMeta:setRagdolled(state, time, getUpGrace)
	getUpGrace = getUpGrace or time or 5

	if (state) then
		if (IsValid(self.nutRagdoll)) then
			self.nutRagdoll:Remove()
		end
		
		local weap = self:GetActiveWeapon()
		if(weap) then
			self.activeWeapon = weap:GetClass()
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
						local weapon = self:Give(v)
						
						--reapplies custom weapon attributes after falling over
						timer.Simple(0, function()
							for k, v in pairs(self:getChar():getInv():getItems()) do
								if(v:getData("equip", false)) then
									if(weapon and weapon.Primary) then
										local custom = v:getData("custom", {})
										
										if(custom.wepDmg) then
											weapon.Primary.Damage = tonumber(custom.wepDmg)
										end
										
										if(custom.wepSpd) then
											weapon.Primary.RPM = tonumber(custom.wepSpd)
										end
										
										if(custom.wepRec and weapon.Primary.KickUp) then
											weapon.Primary.KickUp = weapon.Primary.KickUp * custom.wepRec
											weapon.Primary.KickDown = weapon.Primary.KickDown * custom.wepRec
											weapon.Primary.KickHorizontal = weapon.Primary.KickHorizontal * custom.wepRec
											weapon.Primary.StaticRecoilFactor = weapon.Primary.StaticRecoilFactor * custom.wepRec
										end

										if(custom.wepAcc and weapon.Primary.Spread) then
											weapon.Primary.Spread = weapon.Primary.Spread * custom.wepAcc
											weapon.Primary.IronAccuracy = weapon.Primary.IronAccuracy * custom.wepAcc
										end

										if(custom.wepMag) then
											weapon.Primary.ClipSize = tonumber(custom.wepMag)
										end
										
										timer.Simple(1, function()
											if(nut.plugin.list["customization"]) then
												nut.plugin.list["customization"]:updateSWEP(self, v)
											end
										end)
									end
									
									if(v.weaponCategory) then
										self.carryWeapons[v.weaponCategory] = weapon
									end
								end
							end
							
							timer.Simple(0.1, function()
								if(self.activeWeapon) then
									self:SelectWeapon(self.activeWeapon)
									self.activeWeapon = nil
								end
							end)
						end)
						
						if (entity.nutAmmo) then
							for k2, v2 in ipairs(entity.nutAmmo) do
								if v == v2[1] then
									self:SetAmmo(v2[2], tostring(k2))
								end
							end
						end
					end
					
					for k, v in ipairs(self:GetWeapons()) do
						v:SetClip1(0)
					end
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

		self:setLocalVar("blur", 11)
		self.nutRagdoll = entity

		entity.nutWeapons = {}
		entity.nutAmmo = {}
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

		for k, v in ipairs(self:GetWeapons()) do
			entity.nutWeapons[#entity.nutWeapons + 1] = v:GetClass()
			local clip = v:Clip1()
			local reserve = self:GetAmmoCount(v:GetPrimaryAmmoType())
			local ammo = clip + reserve
			
			self:SetAmmo(ammo, v:GetPrimaryAmmoType())
			
			entity.nutAmmo[v:GetPrimaryAmmoType()] = {v:GetClass(), ammo}
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
						self:setAction("@wakingUp", time)
						entity.nutPausing = false
					end

					time = time - 0.33

					if (time <= 0) then
						entity:Remove()
					end
				else
					timer.Remove(uniqueID)
				end
			end)
		end

		self:setLocalVar("ragdoll", entity:EntIndex())
		hook.Run("OnCharFallover", self, entity, true)
	elseif (IsValid(self.nutRagdoll)) then
		self.nutRagdoll:Remove()

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