AddCSLuaFile()

if (CLIENT) then
	SWEP.PrintName = "Trap Spawner"
	SWEP.Slot = 0
	SWEP.SlotPos = 2
	SWEP.DrawAmmo = false
	SWEP.DrawCrosshair = false
end

SWEP.Author = " "
SWEP.Instructions = "Primary Fire: Spawn Trap"
SWEP.Purpose = "Spawning traps."
SWEP.Drop = false

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

SWEP.ViewModel = Model("models/weapons/c_arms_animations.mdl")
SWEP.WorldModel = ""

SWEP.UseHands = false
SWEP.LowerAngles = Angle(0, 5, -14)
SWEP.LowerAngles2 = Angle(0, 5, -22)

SWEP.IsAlwaysLowered = true
SWEP.FireWhenLowered = true
SWEP.HoldType = "fist"

function SWEP:PreDrawViewModel(viewModel, weapon, client)
	local hands = player_manager.TranslatePlayerHands(player_manager.TranslateToPlayerModelName(client:GetModel()))

	if (hands and hands.model) then
		--viewModel:SetModel(hands.model)
		--viewModel:SetSkin(hands.skin)
		--viewModel:SetBodyGroups(hands.body)
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
		--viewModel:SetPlaybackRate(1)
		--viewModel:ResetSequence(ACT_VM_FISTS_DRAW)
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

function SWEP:Precache()
end

function SWEP:Initialize()
	self:SetHoldType(self.HoldType)
end

function SWEP:PrimaryAttack()
	self:SetNextPrimaryFire(CurTime() + 1)
	self:SetNextSecondaryFire(CurTime() + 1)

	if(!SERVER) then return end

	if (!IsFirstTimePredicted()) then
		return
	end
	
	local item = self.item
	if(!item) then return end
	
	local client = self.Owner
	
	local trace = self:GetOwner():GetEyeTrace()
	if (!trace.Hit) then return end

	local spawnPos = trace.HitPos + client:GetUp()*10

	local trap = ents.Create(item.class)
	if(IsValid(trap)) then
		trap:SetPos(spawnPos)
		trap:SetOwner(client)
		trap:Spawn()
		
		if(item.spawnFunc) then
			item:spawnFunc(client, trap)
		end
	end

	item:remove()
	client:StripWeapon("nut_trapspawner")
end

if(CLIENT) then
	function SWEP:MakeGhostEntity(model, pos, angle)
		util.PrecacheModel(model)
	
		if(IsValid(self.GhostEntity)) then
			SafeRemoveEntity(self.GhostEntity)
		end

		self.GhostEntity = ents.CreateClientProp(model)

		-- If there's too many entities we might not spawn..
		if (!IsValid(self.GhostEntity)) then
			self.GhostEntity = nil
			return
		end

		self.GhostEntity:SetModel(model)
		self.GhostEntity:SetPos(pos)
		self.GhostEntity:SetAngles(angle)
		self.GhostEntity:Spawn()

		self.GhostEntity:SetSolid(SOLID_VPHYSICS)
		self.GhostEntity:SetMoveType(MOVETYPE_NONE)
		self.GhostEntity:SetNotSolid(true)
		self.GhostEntity:SetRenderMode(RENDERMODE_TRANSALPHA)
		self.GhostEntity:SetColor(Color(255, 255, 255, 150))
	end
	
	function SWEP:UpdateGhostEntity()
		if (!IsValid(self.GhostEntity)) then self.GhostEntity = nil return end

		local trace = self:GetOwner():GetEyeTrace()
		if (!trace.Hit) then return end

		local TargetAngle = LocalPlayer():GetAngles()
		TargetAngle.x = 0

		self.GhostEntity:SetAngles(TargetAngle)
		local TargetPos = trace.HitPos

		self.GhostEntity:SetPos(TargetPos)
	end

	function SWEP:Think()
		local trace = self:GetOwner():GetEyeTrace()
		if (!trace.Hit) then return end
	
		local trapModel = self:GetNW2String("trapModel")
	
		if(trapModel) then
			self:MakeGhostEntity(trapModel or "models/hunter/blocks/cube05x05x05.mdl", trace.HitPos, Angle(0,0,0))
		else
			self:UpdateGhostEntity()
		end
	end
	
	function SWEP:OnRemove()
		SafeRemoveEntity(self.GhostEntity)
		self.GhostEntity = nil
	end
end