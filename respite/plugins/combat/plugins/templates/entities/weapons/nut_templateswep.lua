local PLUGIN = PLUGIN

AddCSLuaFile()

SWEP.PrintName = "CEnt Templater"
SWEP.Slot = 0
SWEP.SlotPos = 1
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false

SWEP.Author = " "
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
SWEP.Primary.Delay = 0.75

SWEP.UseHands = false
SWEP.LowerAngles = Angle(15, -10, -20)

SWEP.IsAlwaysLowered = true
SWEP.FireWhenLowered = true
SWEP.HoldType = "normal"

ALWAYS_RAISED["nut_templateswep"] = true

SWEP.ViewModel = ""
SWEP.WorldModel = ""

SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.Category = "Nutscript - Combat"

function SWEP:Initialize()
	self:SetHoldType(self.HoldType)
end

--primary fire to add people to selected turn
function SWEP:PrimaryAttack()
	if(CLIENT) then return end

	self.template = self.template or {}

	local client = self.Owner

	local data = {}
		data.start = self.Owner:GetShootPos()
		data.endpos = data.start + self.Owner:GetAimVector()*4096
		data.filter = {self.Owner, self}
	local trace = util.TraceLine(data)

	if (trace.HitPos) then
		local entity = trace.Entity
	
		self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)

		if(IsValid(entity) and (entity.combat)) then
			if(!table.HasValue(self.template, entity)) then
				self.template[#self.template+1] = entity

				client:notify(entity:Name().. " added to template.")
			else
				client:notify(entity:Name().. " already in template.")
			end
		end
	end
end

--secondary fire to switch team
function SWEP:SecondaryAttack()
	if(CLIENT) then return end

	self.template = self.template or {}

	local client = self.Owner

	local data = {}
		data.start = self.Owner:GetShootPos()
		data.endpos = data.start + self.Owner:GetAimVector()*4096
		data.filter = {self.Owner, self}
	local trace = util.TraceLine(data)

	if (trace.HitPos) then
		local entity = trace.Entity
	
		self:SetNextSecondaryFire(CurTime() + self.Primary.Delay)

		if(IsValid(entity) and (entity.combat)) then
			if(table.HasValue(self.template, entity)) then
				table.RemoveByValue(self.template, entity)

				client:notify(entity:Name().. " removed from template.")
			else
				client:notify(entity:Name().. " is not in template.")
			end
		end
	end
end

--open turn menu
function SWEP:Reload()
	if((self.nextReload or 0) < CurTime()) then
		self.nextReload = CurTime() + 0.5

		if(SERVER) then
			netstream.Start(self.Owner, "CTemp_openTemplates", self, self.template or {})
		end
	end
end

function SWEP:SetTemplate(data)
	self.template = data
	
	if(SERVER) then
		timer.Simple(1, function()
			netstream.Start(self.Owner, "CTemp_openTemplates", self, self.template or {})
		end)
	end
end

function SWEP:DrawHUD()
	--[[
	if(CLIENT) then
		local alpha = 255
		
		local turnTable = PLUGIN.turns[self:getTurnID()]
		local teamID = self:getTeam()
		local order
		if(turnTable) then
			order = turnTable.order
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
		
			nut.util.drawText(name.. " Viewed", ScrW() * 0.5, ScrH() * 0.7, ColorAlpha(Color(255,50,50), alpha), 1, 1, "nutSmallFont", alpha * 1)
			
			if(order and order[teamID]) then
				nut.util.drawText("Primary Fire to add to " ..order[teamID].. " turn list.", ScrW() * 0.5, ScrH() * 0.3 + 16, ColorAlpha(Color(50,255,50), alpha), 1, 1, "nutSmallFont", alpha * 1)
			end
		end
	end
	--]]
end

if(SERVER) then
	--resets the selected template
	netstream.Hook("nutTempReset", function(client, swep)
		if(client:IsAdmin()) then
			swep:SetTemplate()
		end
	end)
	
	--teleports a player to a CEnt
	netstream.Hook("nutTempTP", function(client, entity)
		if(client:IsAdmin() and IsValid(entity)) then
			local pos = entity:GetPos()
		
			client:SetPos(pos)
		end
	end)
	
	--saves a template
	netstream.Hook("nutTempSave", function(client, swep, name, entities)
		if(client:IsAdmin()) then
			PLUGIN:saveTemplate(client, entities, name)
		end
	end)
	
	--loads a template
	netstream.Hook("nutTempLoad", function(client, swep, name)
		if(client:IsAdmin()) then
			PLUGIN:loadTemplate(client, name, swep)
		end
	end)
else --CLIENT
	netstream.Hook("CTemp_openTemplates", function(swep, data)
		if(swep.templateMenu) then
			swep.templateMenu.entities = data
			swep.templateMenu:PopulateTemplate(data)
		end
		
		local templates = vgui.Create("nutTemplates")
		templates.swep = swep
		templates:PopulateTemplate(data)
	end)
end