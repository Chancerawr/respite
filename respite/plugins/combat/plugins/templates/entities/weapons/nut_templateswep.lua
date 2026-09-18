local PLUGIN = PLUGIN

AddCSLuaFile()

SWEP.PrintName = "CEnt Templater"
SWEP.Slot = 0
SWEP.SlotPos = 1
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false

SWEP.Instructions = "Primary Fire: Select CEnts\nSecondary Fire: Add CEnts to template.\nReload: Open Template menu."

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

--[[
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
--]]

function SWEP:Select(select)
	local client = self.Owner
	
	if(select) then
		if(istable(select)) then
			self.selected = select
		else
			self.selected = {}
			self.selected[select] = Vector(0,0,0)
			
			if(SERVER) then
				self:setNetVar("selected", select)

				--movement circle
				client:setNetVar("showAPCircle", select:GetPos())
			end
		end
		
		if(CLIENT) then
			if(!istable(select) or !table.IsEmpty(select)) then
				client:EmitSound("buttons/lightswitch2.wav", 75, 125, 1, CHAN_AUTO, 0, 1, {client})
			end
		end
	else
		if(CLIENT) then
			if(self.selected and !table.IsEmpty(self.selected)) then
				client:EmitSound("buttons/lightswitch2.wav", 75, 50, 1, CHAN_AUTO, 0, 1, {client})
			end
		end
	
		self.selected = {}
		
		if(SERVER) then
			self:setNetVar("selected", nil)
			
			--resets ap circle
			--if noclipped admin, we dont need it to be our own circle
			if(client:GetMoveType() == MOVETYPE_NOCLIP) then
				client:setNetVar("showAPCircle", nil)
			else
				client:setNetVar("showAPCircle", client:GetPos())
			end
		end
	end
end

function SWEP:PrimaryAttack()
	if((self.nextPrimary or 0) < CurTime()) then
		self.nextPrimary = CurTime() + self.Primary.Delay

		local client = self.Owner
		local trace = client:GetEyeTrace()

		self:Select()

		local entity = trace.Entity
		if(IsValid(entity) and entity.combat) then
			self:SingleSelect(trace)
		else
			self:MultiSelect(trace)
		end
	end
end

--secondary fire to switch team
function SWEP:SecondaryAttack()
	if(CLIENT) then return end

	self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)

	local client = self.Owner
	local selected = self.selected or {}

	self.template = self.template or {}

	for entity, _ in pairs(selected) do
		if(IsValid(entity) and (entity.combat)) then
			if(!table.HasValue(self.template, entity)) then
				self.template[#self.template+1] = entity
			end
		end
	end
	
	if(!table.IsEmpty(selected)) then
		client:notify(#selected.. " entities added to template.")
	else
		client:notify("Select CEnts with primary fire.")
	end
end

function SWEP:BoxSelect(mins, maxs)
	local client = self.Owner

	local mins = mins--client.centMoverMins
	local maxs = maxs+Vector(0,0,20)--hitPos+Vector(0,0,20)

	local distMin = math.huge
	local distMax = math.huge
	local nearestMin
	local nearestMax

	local targets = {}

	local entities = ents.FindInBox(mins, maxs)
	for k, entity in ipairs(entities) do
		if(!IsValid(entity)) then continue end
		if(!entity.combat) then continue end

		--creates a new box bound by the entities within it
		--this is so the offset is more sensible
		local pos = entity:GetPos()
		local dist1 = pos:DistToSqr(mins)
		if(dist1 < distMin) then
			nearestMin = pos
			distMin = dist1
		end

		local dist2 = pos:DistToSqr(maxs)
		if(dist2 < distMax) then
			nearestMax = pos
			distMax = dist2
		end

		targets[entity] = Vector(0,0,0) --temporary value
	end
	
	--updates the box
	mins = nearestMin or mins
	maxs = nearestMax or maxs
	
	--find the center of the box so we can create the offset
	local center = mins + (maxs - mins)/2
	
	for entity, _ in pairs(targets) do
		local offset = entity:GetPos() - center
		offset.z = 0
		
		targets[entity] = offset
	end

	self:Select(targets)

	client.centMoverMins = nil
	client.centMoverMaxs = nil
end

function SWEP:MultiSelect(trace)
	local client = self.Owner
	
	if (trace.Hit) then
		local hitPos = trace.HitPos
		if(!client.dragMins) then
			client.dragMins = hitPos
			client.selectSwep = self
		end
	end
end

function SWEP:SingleSelect(trace)
	local client = self.Owner
	
	if (trace.Hit) then
		local entity = trace.Entity
		
		if(IsValid(entity) and entity.combat) then
			if(
			self.Owner:IsAdmin() or 
			((entity.GetCreator and entity:GetCreator()) == self.Owner) or
			entity.playerControlled
			) then
				self:Select(entity)
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

if(SERVER) then
	--resets the selected template
	netstream.Hook("nutTempReset", function(client, swep)
		if(client:IsAdmin()) then
			swep:SetTemplate()
		end
	end)
	
	--removes a CEnt from the template
	netstream.Hook("nutTempRemove", function(client, entity, swep)
		if(client:IsAdmin() and IsValid(entity) and IsValid(swep)) then
			table.RemoveByValue(swep.template, entity)
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
			swep.templateMenu:PopulateTemplate(data, swep)
		end
		
		local templates = vgui.Create("nutTemplates")
		templates.swep = swep
		templates:PopulateTemplate(data, swep)
	end)
end