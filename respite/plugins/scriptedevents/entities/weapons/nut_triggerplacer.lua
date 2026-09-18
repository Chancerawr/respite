AddCSLuaFile()

if (CLIENT) then
	SWEP.PrintName = "Trigger Helper"
	SWEP.Slot = 0
	SWEP.SlotPos = 1
	SWEP.DrawAmmo = false
end

SWEP.Category 				= "Nutscript"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Author = " "
SWEP.Instructions = " "
SWEP.Purpose = " "
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

SWEP.ViewModel = Model("models/weapons/c_arms_citizen.mdl")
SWEP.WorldModel = ""

SWEP.UseHands = false
SWEP.LowerAngles = Angle(0, 5, -14)
SWEP.LowerAngles2 = Angle(0, 5, -22)

SWEP.FireWhenLowered = true
SWEP.HoldType = "fist"

if (CLIENT) then
	function SWEP:PreDrawViewModel(viewModel, weapon, client)
	end
end

function SWEP:Think()
end

function SWEP:Initialize()
	self:SetHoldType(self.HoldType)
end

function SWEP:OnRemove()
end

if(SERVER) then
	function SWEP:PrimaryAttack()
		
	end

	function SWEP:SecondaryAttack()
		
	end

	function SWEP:Reload()
	end
else
	--point selector
	function SWEP:PrimaryAttack()
		local client = self.Owner
	
		local trace = client:GetEyeTrace()
		
		local pos = trace.HitPos
		if(pos) then
			if(client.triggerMins) then
				client.triggerMaxs = trace.HitPos
			else
				client.triggerMins = trace.HitPos
			end
		end
	end

	--reset
	function SWEP:SecondaryAttack()
		local client = self.Owner
	
		client.triggerMins = nil
		client.triggerMaxs = nil
	end

	--paste the stuff into console or something
	function SWEP:Reload()
		if((self.nextReload or 0) < CurTime()) then
			self.nextReload = CurTime()+1
		
			local client = self.Owner
		
			local mins = client.triggerMins
			local maxs = client.triggerMaxs
		
			if(mins and maxs) then
				local center = mins + (maxs - mins)/2
					
				local minActual = mins - center
				local maxActual = maxs - center
				
				print("pos = Vector(" ..center.x.. "," ..center.y.. "," ..center.z.. "),")
				print("mins = Vector(" ..minActual.x.. "," ..minActual.y.. "," ..minActual.z.. "),")
				print("maxs = Vector(" ..maxActual.x.. "," ..maxActual.y.. "," ..maxActual.z..  "),")
			end
		end
	end
	
	function SWEP:Holster()
		local client = self.Owner
		
		client.triggerMins = nil
		client.triggerMaxs = nil
	end
	
	function SWEP:DrawHUD()
		--[[
		local w, h = ScrW(), ScrH()
		local cury = h/4*3
		local tx, ty = draw.SimpleText("Left Click: Select Entity", "nutMediumFont", w/2, cury, color_white, 1, 1)
		cury = cury + ty
		local tx, ty = draw.SimpleText("Right Click: Deselect Entity", "nutMediumFont", w/2, cury, color_white, 1, 1)
		cury = cury + ty
		local tx, ty = draw.SimpleText("Reload: Register Area", "nutMediumFont", w/2, cury, color_white, 1, 1)
		--]]
	end
	
	--[[
	function ENT:Draw()
	
	end
	--]]
	
	hook.Add("PostDrawOpaqueRenderables", "triggerPlacerDrawBox", function()
		local client = LocalPlayer()

		local mins = client.triggerMins
		local maxs = client.triggerMaxs
		
		if(mins) then
			if(!maxs) then
				local trace = client:GetEyeTrace()
		
				local pos = trace.HitPos
				
				maxs = pos
			end
			
			local center = (maxs - mins)/2
			
			local minActual = mins - center
			local maxActual = maxs - center
		
			render.DrawWireframeBox(center, Angle(0,0,0), minActual, maxActual, Color(255, 255, 255))
		end
	end)
end