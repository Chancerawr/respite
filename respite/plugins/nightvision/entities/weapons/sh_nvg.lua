AddCSLuaFile()

SWEP.Base = "weapon_base"
SWEP.PrintName = "Night Vision Goggles"
SWEP.Author = "Tazmily"
SWEP.Instructions = "Reload to activate night vision."
SWEP.Spawnable = true
SWEP.AdminSpawnable = false
SWEP.Category = "Nutscript 1.1 Miscellaneous"

SWEP.HoldType = "normal"
SWEP.ViewModel = Model("models/weapons/c_arms.mdl")
SWEP.WorldModel = ""

SWEP.HitDistance = 50

SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "none"
SWEP.Primary.Delay = 1

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"
SWEP.Secondary.Delay = 5

SWEP.Nightvision = false
SWEP.NextReload = CurTime()

SWEP.Slot				= 3
SWEP.SlotPos			= 4

if ( SERVER ) then
	util.AddNetworkString( "AM_NightvisionOn" )
	util.AddNetworkString( "AM_NightvisionOff" )
end

function SWEP:Initialize()

	self:SetWeaponHoldType( self.HoldType )
	
end


function SWEP:PrimaryAttack()

end


function SWEP:SecondaryAttack()

end


function SWEP:Reload()

	if ( SERVER ) then
		if self.NextReload > CurTime() then return end
	
		self.NextReload = CurTime() + 2
		local ply = self:GetOwner()
		if self.Nightvision == false then
			self.Nightvision = true
			net.Start( "AM_NightvisionOn" )
			net.WriteEntity( ply )
			net.Send( ply )
		elseif self.Nightvision == true then
			self.Nightvision = false
			net.Start( "AM_NightvisionOff" )
			net.WriteEntity( ply )
			net.Send( ply )
		end
	end
	
end


function SWEP:OnRemove()
	
	if ( SERVER ) then
		if self.Nightvision == true then
			self.Nightvision = false
			local ply = self:GetOwner()
			net.Start( "AM_NightvisionOff" )
			net.WriteEntity( ply )
			net.Send( ply )
		end
	end
	
end



if( CLIENT ) then

	net.Receive( "AM_NightvisionOn", function ( len, ply )
	
		local ply = net.ReadEntity()
		am_nightvision = DynamicLight( 0 )
		if ( am_nightvision ) then
			am_nightvision.Pos = ply:EyePos()
			am_nightvision.r = 255
			am_nightvision.g = 255
			am_nightvision.b = 255
			am_nightvision.Brightness = 4
			am_nightvision.Size = 10000
			am_nightvision.DieTime = CurTime()+100000
			am_nightvision.Style = 1
		end
		timer.Create( "AM_LightTimer", 0.05, 0, function()
			am_nightvision.Pos = ply:EyePos()
		end)
	end)
	
	net.Receive( "AM_NightvisionOff", function ( len, ply )
		local ply = net.ReadEntity()
		timer.Destroy( "AM_LightTimer" )
		if am_nightvision then
			am_nightvision.DieTime = CurTime()+0.1
		end
	end)

end