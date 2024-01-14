local PLUGIN = PLUGIN

AddCSLuaFile()

SWEP.PrintName = "Ghost Mover"
SWEP.Slot = 0
SWEP.SlotPos = 1
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false

SWEP.Author = ""
SWEP.Instructions = "Primary Fire: Select.\nSecondary Fire: Order NPC."
SWEP.Purpose = "Selecting and moving NPCs."

SWEP.ViewModelFOV = 45
SWEP.ViewModelFlip = false
SWEP.AnimPrefix	 = "rpg"

SWEP.ViewTranslation = 4

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = ""
SWEP.Primary.Delay = 0.1

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = 0
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = ""
SWEP.Secondary.Delay = 1

SWEP.UseHands = false
SWEP.LowerAngles = Angle(15, -10, -20)

SWEP.IsAlwaysLowered = true
SWEP.FireWhenLowered = true
SWEP.HoldType = "normal"

ALWAYS_RAISED["nut_ghostmover"] = true

SWEP.ViewModel = ""
SWEP.WorldModel = ""

SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.Category = "Nutscript - Combat"

function SWEP:Initialize()
	self:SetHoldType(self.HoldType)
end

function SWEP:Deploy()
end

function SWEP:Reload()
	if((self.nextReload or 0) < CurTime()) then
		self.nextReload = CurTime() + 0.5
		
		self.selection = nil
		
		if(CLIENT) then
			SafeRemoveEntity(self.GhostEntity)
			self.GhostEntity = nil
		end
	end
end

function SWEP:PrimaryAttack()
	if(CLIENT) then return end
	if((self.nextPrimary or 0) > CurTime()) then return end
	self.nextPrimary = CurTime() + self.Primary.Delay

	local client = self.Owner

	local data = {}
		data.start = self.Owner:GetShootPos()
		data.endpos = data.start + self.Owner:GetAimVector()*4096
		data.filter = {self.Owner, self}
	local trace = util.TraceLine(data)

	if(trace.HitPos) then
		local entity = self:GetNW2Entity("selected")
		
		if(IsValid(entity)) then
			--local tempEnt = ents.Create("info_particle_system")
			--tempEnt:SetParent(self)
			--tempEnt:SetPos(trace.HitPos)
			
			entity.rallyPoint = trace.HitPos
			entity.nextRally = 0
			entity.OldPos = nil
			--entity:SetEnemy(tempEnt, 600)

			--SafeRemoveEntityDelayed(tempEnt, 5)
		
			--self.Owner:notify("NPC ordered.")
			
			client:EmitSound("buttons/blip1.wav", 30, 75, 100)
		else
			client:notify("No valid NPC selected.")
		end

		self:SetNextPrimaryFire(CurTime() + self.Primary.Delay) -- this wasnt working properly for no reason
	end
end

function SWEP:SecondaryAttack()
	if((self.nextSecondary or 0) > CurTime()) then return end

	local data = {}
		data.start = self.Owner:GetShootPos()
		data.endpos = data.start + self.Owner:GetAimVector()*4096
		data.filter = {self.Owner, self}
	local trace = util.TraceLine(data)

	if (trace.Hit) then
		local entity = trace.Entity
		
		--if(entity:GetOwner() == self.Owner) then
			self:selectTarget(entity)
		--end	
	end
	
	self:SetNextSecondaryFire(CurTime() + self.Secondary.Delay)
	self.nextSecondary = CurTime() + self.Secondary.Delay
end

function SWEP:selectTarget(entity)
	if(IsValid(entity) and entity.respite and entity:IsNextBot()) then
		if(SERVER) then
			self:SetNW2Entity("selected", entity)
			self:SetNW2String("selectedName", entity:GetName())
			
			self.Owner:notify("Selected " ..entity:GetName().. ".")
		end
	else
		if(self:GetNW2Entity("selected")) then
			if(SERVER) then
				self:SetNW2Entity("selected", nil)
				
				self.Owner:notify("Deselected.")
			end
		end
	end
end