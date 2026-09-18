local PLUGIN = PLUGIN

AddCSLuaFile()

SWEP.PrintName = "Turns Manager"
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
SWEP.Primary.Delay = 0.1

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = 0
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = ""
SWEP.Secondary.Delay = 0.01

SWEP.UseHands = false
SWEP.LowerAngles = Angle(15, -10, -20)

SWEP.IsAlwaysLowered = true
SWEP.FireWhenLowered = true
SWEP.HoldType = "normal"

ALWAYS_RAISED["nut_turnswep"] = true

SWEP.ViewModel = ""
SWEP.WorldModel = ""

SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.Category = "Nutscript - Combat"

function SWEP:Initialize()
	self:SetHoldType(self.HoldType)
end

--[[
function SWEP:getTurnID()
	return self:getNetVar("turns")
end

function SWEP:getTeam()
	return self:getNetVar("team", 1)
end
--]]

--primary fire to add people to selected turn
function SWEP:PrimaryAttack()
	if((self.nextPrimary or 0) > CurTime()) then return end

	local client = self.Owner
	local trace = client:GetEyeTrace()

	self:Select()

	local entity = trace.Entity
	if(IsValid(entity) and entity.combat) then
		self.nextPrimary = CurTime() + 0.1
		self:SingleSelect(trace)
	else
		self:MultiSelect(trace)
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

function SWEP:MultiSelect(trace)
	local client = self.Owner
	
	if (trace.Hit) then
		local hitPos = trace.HitPos
		if(!client.dragMins) then
			client.selectSwep = self
			client.dragMins = hitPos
		end
	end
end

function SWEP:Select(select)
	local client = self.Owner
	
	if(select) then
		if(istable(select)) then
			self.selected = select
		else
			self.selected = {}
			self.selected[select] = Vector(0,0,0)
		end
		
		client.highlightEnts = self.selected
		
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
		client.highlightEnts = nil
		
		if(SERVER) then
			self:setNetVar("selected", nil)
		end
	end
end

--secondary fire to switch team
function SWEP:SecondaryAttack()
	if((self.nextSecondary or 0) > CurTime()) then return false end
	self.nextSecondary = CurTime() + 0.5
	
	if(CLIENT) then
		local client = self.Owner
	
		local turnID = client:getTurnID()
	
		if(!turnID) then 
			nut.util.notify("You are not in a turn system. Press R and join one.")
			return 
		end
		
		local turnTable = PLUGIN.turns[turnID]
		if(!turnTable) then return end
	
		local order = turnTable.order
		
		local frame = vgui.Create("DFrame")
		frame:SetSize(300, 400)
		frame:Center()
		frame:SetTitle("Add Selected To Team")
		frame:MakePopup()
		frame:ShowCloseButton(true)
		
		local scroll = vgui.Create("DScrollPanel", frame)
		scroll:Dock(FILL)
		
		frame.buttons = {} --for button stuff
		
		for teamID, team in pairs(order) do
			local button = vgui.Create("DButton", scroll)
			button:SetText(team)
			button:Dock(TOP)
			button:DockMargin(2,2,2,2)
			
			button:SetFont("nutSmallFont")
			button:SetTextColor(Color(255,255,255,255))
			
			button.Paint = function(panel, w, h)
				surface.SetDrawColor(Color(0, 0, 0, 255))
				surface.DrawRect(0, 0, w, h)
			end
			
			button.DoClick = function(this)
				for k, v in pairs(frame.buttons) do
					v.active = false
					v:SetTextColor(Color(255,255,255,255))
				end
			
				button:SetTextColor(Color(100,100,200,255))
				button.active = true
				
				netstream.Start("nut_turnSwepAdd", self, turnID, teamID)
				
				nut.util.notify("Added entities to " ..team.. ".")
			end			
			
			frame.buttons[#frame.buttons + 1] = button
		end
	end
end

--open turn menu
function SWEP:Reload()
	if((self.nextReload or 0) < CurTime()) then
		self.nextReload = CurTime() + 0.5

		local client = self.Owner

		if(SERVER) then
			PLUGIN:turnSyncAll(client)
		else
			local turnList = vgui.Create("nutTurnList")

			local turnID = client:getTurnID()
			if(turnID) then
				turnList.turnID = turnID
				turnList:Refresh()
			end
			
			turnList.swep = self
		end
	end
end

function SWEP:Holster()
	local client = self.Owner
	
	client.centMoverMins = nil
	
	self:Select()

	return true
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

function SWEP:DrawHUD()
	if(CLIENT) then
		local client = LocalPlayer()
		
		local trace = client:GetEyeTrace()
		local target = trace.Entity
		
		if(IsValid(target) and target.combat) then
			local name = target:Name()
		
			nut.util.drawText(name.. " Viewed", ScrW() * 0.5, ScrH() * 0.7, ColorAlpha(Color(255,50,50), alpha), 1, 1, "nutSmallFont", 255)
			
			nut.util.drawText("Primary Fire click or drag to select.", ScrW() * 0.5, ScrH() * 0.3 + 16, ColorAlpha(Color(50,255,50), 255), 1, 1, "nutSmallFont", 255)
		elseif(self.selected) then
			local count = table.Count(self.selected)
		
			nut.util.drawText(count.. " entities selected.", ScrW() * 0.5, ScrH() * 0.7, ColorAlpha(Color(255,50,50), 255), 1, 1, "nutSmallFont", 255)
			
			nut.util.drawText("Secondary Fire to assign to a team.", ScrW() * 0.5, ScrH() * 0.3 + 16, ColorAlpha(Color(50,255,50), 255), 1, 1, "nutSmallFont", 255)
		end
	end
end