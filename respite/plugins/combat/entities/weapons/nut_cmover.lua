local PLUGIN = PLUGIN

AddCSLuaFile()

SWEP.PrintName = "CEnt Mover"
SWEP.Slot = 0
SWEP.SlotPos = 1
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false

SWEP.Author = "Chancer"
--SWEP.Instructions = "Primary Fire: [RAISED] Punch\nSecondary Fire: Knock/Pickup"
--SWEP.Purpose = "Hitting things, knocking on doors, and moving things."

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

SWEP.UseHands = false
SWEP.LowerAngles = Angle(15, -10, -20)

SWEP.IsAlwaysLowered = true
SWEP.FireWhenLowered = true
SWEP.HoldType = "normal"

ALWAYS_RAISED["nut_cmover"] = true

SWEP.ViewModel = ""
SWEP.WorldModel = ""

SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.Category = "Nutscript - Combat"

function SWEP:Initialize()
	self:SetHoldType(self.HoldType)
end

function SWEP:selectTarget(entity)
	if(IsValid(entity) and entity.combat) then
		if(SERVER) then
			self:setNetVar("selected", entity)
			self:setNetVar("selectedName", entity:Name())
			self.Owner:notify("Selected " ..entity:Name().. ".")
		end
	else
		if(self:getNetVar("selected")) then
			if(SERVER) then
				self:setNetVar("selected", nil)
				self.Owner:notify("Deselected.")
			end
		end
	end
end

function SWEP:PrimaryAttack()
	self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)

	local data = {}
		data.start = self.Owner:GetShootPos()
		data.endpos = data.start + self.Owner:GetAimVector()*4096
		data.filter = {self.Owner, self}
	local trace = util.TraceLine(data)

	if (trace.HitPos) then
		local selected = self:getNetVar("selected")
		if(selected) then
			if(SERVER) then
				local tempEnt = ents.Create("info_particle_system")
				tempEnt:SetParent(self)
				tempEnt:SetPos(trace.HitPos)
				
				selected:PointAtEntity(tempEnt)
				local angle = selected:GetAngles()
				selected:SetAngles(Angle(0, angle.y, 0))
				
				selected:walkAnims()
				
				SafeRemoveEntity(tempEnt)
			end
			
			selected.desiredPos = trace.HitPos
		end
	end
end

function SWEP:SecondaryAttack()
	local data = {}
		data.start = self.Owner:GetShootPos()
		data.endpos = data.start + self.Owner:GetAimVector()*4096
		data.filter = {self.Owner, self}
	local trace = util.TraceLine(data)

	if (trace.Hit) then
		local entity = trace.Entity
		self:selectTarget(entity)
	end
end

function SWEP:Reload()

end

function SWEP:DrawHUD()
	if(CLIENT) then
		local alpha = 255
	
		if(self:getNetVar("selected")) then
			local name = self:getNetVar("selectedName", "Unnamed")
			
			nut.util.drawText(name.. " Selected", ScrW() * 0.5, ScrH() * 0.3, ColorAlpha(Color(50,50,255), alpha), 1, 1, "nutEntDesc", alpha * 1)
			nut.util.drawText("Primary Fire to move selected to location.", ScrW() * 0.5, ScrH() * 0.3 + 16, ColorAlpha(Color(50,255,50), alpha), 1, 1, "nutEntDesc", alpha * 1)
		end
		
		if((self.nextCEntTrace or 0) < CurTime()) then
			local data = {}
				data.start = self.Owner:GetShootPos()
				data.endpos = data.start + self.Owner:GetAimVector()*4096
				data.filter = {self.Owner, self}
			local trace = util.TraceLine(data)

			if (trace.Hit) then
				local entity = trace.Entity
				if(entity.combat) then
					self.viewed = entity:Name()
					
					self.nextCEntTrace = CurTime() + 1
				else
					self.viewed = nil
				end
			end
		end
		
		if(self.viewed) then
			local name = self.viewed
		
			nut.util.drawText(name.. " Viewed", ScrW() * 0.5, ScrH() * 0.7, ColorAlpha(Color(255,50,50), alpha), 1, 1, "nutEntDesc", alpha * 1)
		end
	end
end