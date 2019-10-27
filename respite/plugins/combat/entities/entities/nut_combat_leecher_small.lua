ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Leecher (Small)"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/zombie/grabber_01.mdl"
ENT.name = "Small Leecher"

--all attributes
ENT.attribs = {
	["stm"] = 15,
	["str"] = 20,
	["accuracy"] = 15,
	["end"] = 25,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 5,
}

function ENT:Initialize()
	if(SERVER) then
		self:SetColor(Color(0,0,0,0))
		self:SetRenderMode(RENDERMODE_TRANSALPHA)
		self:SetMaterial("models/weapons/v_smg1/texture5")	

		self.OverlayModel = ents.Create("prop_dynamic")
			zm = self.OverlayModel
			zm:SetParent(self)
			zm:SetModel("models/player/slow/amberlyn/re5/uroboro/slow_public.mdl")
			zm.RenderGroup = RENDERGROUP_TRANSLUCENT
			zm:SetRenderMode(RENDERMODE_TRANSALPHA)

			zm:AddEffects(EF_BONEMERGE, EF_BONEMERGE_FASTCULL, EF_PARENT_ANIMATES )
			zm:SetBodygroup(1,1)

		self:PhysicsInitShadow(true, false)
	end

	self:basicSetup()
end

function ENT:die()
	if(!self.noRag) then
		local ragdoll = ents.Create("prop_ragdoll")
		if ragdoll:IsValid() then 
			ragdoll:SetPos(self:GetPos())
			ragdoll:SetModel("models/player/slow/amberlyn/re5/uroboro/slow_public.mdl")
			ragdoll:SetAngles(self:GetAngles())
			ragdoll:Spawn()
			ragdoll:SetSkin(self:GetSkin())
			ragdoll:SetColor(Color(255,255,255,255))
			--ragdoll:SetMaterial(self:GetMaterial())
			ragdoll:SetBloodColor(self:GetBloodColor())
				
			local num = ragdoll:GetPhysicsObjectCount()-1
	   
			for i=0, num do
				local bone = ragdoll:GetPhysicsObjectNum(i)

				if IsValid(bone) then
					local bp, ba = self:GetBonePosition(ragdoll:TranslatePhysBoneToBone(i))
					if bp and ba then
						bone:SetPos(bp)
						bone:SetAngles(ba)
					end
				end
			end
				
				--I hate this
			ragdoll:SetBodygroup(1, self:GetBodygroup(1))
			ragdoll:SetBodygroup(2, self:GetBodygroup(2))
			ragdoll:SetBodygroup(3, self:GetBodygroup(3))
			ragdoll:SetBodygroup(4, self:GetBodygroup(4))
			ragdoll:SetBodygroup(5, self:GetBodygroup(5))
			ragdoll:SetBodygroup(6, self:GetBodygroup(6))
			
			ragdoll:SetCollisionGroup(COLLISION_GROUP_DEBRIS_TRIGGER)
		end
			
		if (self:IsOnFire()) then --if the npc is on fire, set the ragdoll on fire too.
			ragdoll:Ignite(10,20)
		end
	end
	
	if(self.inv) then
		for k, v in pairs(self.inv) do
			nut.item.spawn(v, self:GetPos())
		end
	end
	
	SafeRemoveEntity( self )
end