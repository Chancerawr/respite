local PLUGIN = PLUGIN
PLUGIN.name = "Fallover Enhancements"
PLUGIN.author = "Chancer"
PLUGIN.desc = "Slight changes to default /fallover command."

local playerMeta = FindMetaTable("Player")

--synchronizes decals from one model to another
function PLUGIN:DecalSync(model1, model2)
	--used to make the ragdoll and the player seem more consistently the same
	for k, client in ipairs(player.GetAll()) do
		netstream.Start(client, "nutRag_decalSync", model1, model2)
	end
end

if(CLIENT) then
	--gives the decals of model1 to model2
	function PLUGIN:DecalSync(model1, model2)
		if (IsValid(model1) and IsValid(model2)) then
			model1:SnatchModelInstance(model2)
		end
	end
	
	function PLUGIN:EntityRemoved(entity, fullUpdate)
		if(fullUpdate) then return end
		
		local client = entity:GetNWEntity("nutPlayer")
		if(client) then
			if(IsValid(client)) then
				PLUGIN:DecalSync(client, entity)
			end
		end
	end

	netstream.Hook("nutRag_decalSync", function(model1, model2)
		PLUGIN:DecalSync(model1, model2)
	end)
end

function playerMeta:createRagdoll(freeze)
	local entity = ents.Create("prop_ragdoll")
	entity:SetPos(self:GetPos())
	entity:SetAngles(self:EyeAngles())
	entity:SetModel(self:GetModel())
	entity:SetMaterial(self:GetMaterial())
	entity:SetSkin(self:GetSkin())
	entity:SetColor(self:GetColor())
	
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
		entity:SetNWEntity("nutPlayer", self)
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
				
				--this might not be necessary
				--hard to test since ragdolls dont really get up if moving so much
				--[[
				local physObj = entity:GetPhysicsObject()
				if(IsValid(physObj)) then
					self:SetVelocity(physObj:GetVelocity())
				end
				--]]
				
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
						if(IsValid(weapon)) then
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
						
						timer.Simple(0, function()
							if(self.activeWeapon) then
								self:SelectWeapon(self.activeWeapon)

								if(self.activeWeaponR) then
									timer.Simple(0.1, function()
										self:setWepRaised(true)
									end)
									
									self.activeWeaponR = nil
								end
								
								self.activeWeapon = nil
							end
						end)
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

		self:setLocalVar("blur", 2)
		self.nutRagdoll = entity
		self:setNetVar("nutRagdoll", entity:EntIndex())
		self:SetNW2Entity("nutRagdoll", entity)
		
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
		--self:Freeze(true)
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
				elseif(!IsValid(entity) and IsValid(self)) then
					self:setAction()
					self:setNetVar("nutRagdoll", nil)
					timer.Remove(uniqueID)
				else
					self:setNetVar("nutRagdoll", nil)
					timer.Remove(uniqueID)
				end
			end)
		end
		
		--synchronizes decals
		timer.Simple(0, function() --entity will be NULL if we do it too early
			PLUGIN:DecalSync(entity, self)
		end)

		self:setLocalVar("ragdoll", entity:EntIndex())
		hook.Run("OnCharFallover", self, entity, true)
		
		return entity
	elseif (IsValid(self.nutRagdoll)) then
		self.nutRagdoll:Remove()

		self:setNetVar("nutRagdoll", nil)
		hook.Run("OnCharFallover", self, entity, false)
	end
end

--reduces damage from falling/props, for fun
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
		
		dmgInfo:ScaleDamage(0.1)

		entity.nutPlayer:TakeDamageInfo(dmgInfo)
	end
end

nut.command.add("forcefallover", {
	adminOnly = true,
	syntax = "<string name>",
	onRun = function(client, arguments)
		if(!arguments[1]) then
			client:notify("Specify a target.")
			return false
		end
		
		local target = nut.command.findPlayer(client, arguments[1])
		if(IsValid(target)) then	
			target:setRagdolled(true)
			
			client:notify(target:Name().. " has been ragdolled.")
		end
	end
})

function PLUGIN:SetupMove(ply, mvd, cmd)
	if(SERVER) then
		local ragdoll = ply:GetNW2Entity("nutRagdoll")

		-- push attack
		if(ragdoll and IsValid(ragdoll)) then
			ply:SetVelocity(Vector(0,0,0)) --no moving while ragdolled
		
			--let them crawl
			if (mvd:KeyDown(IN_FORWARD)) then 

				local bones = {
					"ValveBiped.Bip01_R_Hand",
					"ValveBiped.Bip01_L_Hand",
				}
				
				for k, v in pairs(bones) do
					local bone = ply:LookupBone("ValveBiped.Bip01_L_Hand")

					local physBoneID = ragdoll:TranslateBoneToPhysBone(bone)
					
					local physBone = ragdoll:GetPhysicsObjectNum(physBoneID)
					if(IsValid(physBone)) then
						physBone:AddVelocity(ply:GetForward()*math.Rand(75,150))
					end
				end
			end
			
			if (mvd:KeyDown(IN_MOVELEFT) or mvd:KeyDown(IN_MOVERIGHT)) then 
				local bones = {
					"ValveBiped.Bip01_R_Thigh",
					"ValveBiped.Bip01_L_Thigh",
				}
				
				for k, v in pairs(bones) do
					local bone = ply:LookupBone("ValveBiped.Bip01_L_Hand")

					local physBoneID = ragdoll:TranslateBoneToPhysBone(bone)
					
					local physBone = ragdoll:GetPhysicsObjectNum(physBoneID)
					if(IsValid(physBone)) then
						if(mvd:KeyDown(IN_MOVERIGHT)) then
							print("Add velo right")
							physBone:AddVelocity(ply:GetRight()*math.Rand(75,150))
						else
							print("Add velo left")
							physBone:AddVelocity(ply:GetRight()*math.Rand(75,150)*-1)
						end
					end
				end
			end
			
			if (mvd:KeyDown(IN_BACK)) then 
				local bones = {
					"ValveBiped.Bip01_R_Thigh",
					"ValveBiped.Bip01_L_Thigh",
				}
				
				for k, v in pairs(bones) do
					local bone = ply:LookupBone("ValveBiped.Bip01_L_Hand")

					local physBoneID = ragdoll:TranslateBoneToPhysBone(bone)
					
					local physBone = ragdoll:GetPhysicsObjectNum(physBoneID)
					if(IsValid(physBone)) then
						physBone:AddVelocity(ply:GetForward()*math.Rand(75,150)*-1)
					end
				end
			end
		end
	end
end
