ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Leecher (Big)"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/zombie/poison.mdl"
ENT.name = "Leecher"

--all attributes
ENT.agil = 10
ENT.stre = 50
ENT.accu = 25
ENT.craf = 0
ENT.endu = 70
ENT.luck = 0
ENT.perc = 0
ENT.fort = 10

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
		
		self:SetModelScale( 2, 0 )
		self:PhysicsInitShadow(true, false)
	end

	self:basicSetup()
end