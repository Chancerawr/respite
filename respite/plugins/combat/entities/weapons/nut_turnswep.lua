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

ALWAYS_RAISED["nut_turnswep"] = true

SWEP.ViewModel = ""
SWEP.WorldModel = ""

SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.Category = "Nutscript - Combat"

function SWEP:Initialize()
	self:SetHoldType(self.HoldType)
end

function SWEP:getTurnID()
	return self:getNetVar("turns")
end

function SWEP:getTeam()
	return self:getNetVar("team", 1)
end

--primary fire to add people to selected turn
function SWEP:PrimaryAttack()
	--if(CLIENT) then return end

	local client = self.Owner

	local turnID = self:getTurnID()
	if(!turnID) then
		if(SERVER) then
			client:notify("Select a turn group with reload.")
		end
		
		return false
	end

	local data = {}
		data.start = self.Owner:GetShootPos()
		data.endpos = data.start + self.Owner:GetAimVector()*4096
		data.filter = {self.Owner, self}
	local trace = util.TraceLine(data)

	if (trace.HitPos) then
		local entity = trace.Entity
	
		if(client:KeyDown(IN_WALK)) then --self targetting
			entity = client
		end
	
		self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)

		if(IsValid(entity) and (entity:IsPlayer() or entity.combat)) then
			PLUGIN:turnAdd(turnID, entity, self:getTeam())
			
			if(SERVER) then
				local turnTable = PLUGIN.turns[turnID]
				local teamID = self:getTeam()
			
				client:notify(entity:Name().. " added to " ..turnTable.order[teamID].. ".")
			end
		end
	end
end

--secondary fire to switch team
function SWEP:SecondaryAttack()
	if((self.nextSecondary or 0) < CurTime()) then
		self.nextSecondary = CurTime() + 0.5
	else
		return
	end
	
	if(CLIENT) then
		local turnTable = PLUGIN.turns[self:getTurnID()]

		if(!turnTable) then return end
	
		local order = turnTable.order
		
		local frame = vgui.Create("DFrame")
		frame:SetSize(300, 600)
		frame:Center()
		frame:SetTitle("Select Team")
		frame:MakePopup()
		frame:ShowCloseButton(true)
		
		local scroll = vgui.Create("DScrollPanel", frame)
		scroll:Dock(FILL)
		
		frame.buttons = {} --for button stuff
		
		for orderID, team in pairs(order) do
			local button = vgui.Create("DButton", scroll)
			button:SetText(team)
			button:Dock(TOP)
			button:DockMargin(2,2,2,2)
			
			button:SetFont("nutSmallFont")
			button:SetTextColor(Color(255,255,255,255))
			
			button.Paint = function(panel, w, h)
				surface.SetDrawColor(Color(70, 80, 100, 220))
				surface.DrawRect(0, 0, w, h)
			end
			
			button.DoClick = function()
				for k, v in pairs(frame.buttons) do
					v.active = false
					v:SetTextColor(Color(255,255,255,255))
				end
			
				button:SetTextColor(Color(100,100,200,255))
				button.active = true
				
				netstream.Start("nutTurnTeamS", self, orderID)
				
				nut.util.notify("Selected " ..team.. ".")
			end			
			
			frame.buttons[#frame.buttons + 1] = button
		end
	end

	--[[
	local data = {}
		data.start = self.Owner:GetShootPos()
		data.endpos = data.start + self.Owner:GetAimVector()*4096
		data.filter = {self.Owner, self}
	local trace = util.TraceLine(data)

	if (trace.Hit) then
		local entity = trace.Entity
		
		if(self.Owner:IsAdmin() or entity:GetCreator() == self.Owner) then
			self:selectTarget(entity)
		end	
	end
	--]]
end

--open turn menu
function SWEP:Reload()
	if((self.nextReload or 0) < CurTime()) then
		self.nextReload = CurTime() + 0.5

		if(CLIENT) then
			local turnList = vgui.Create("nutTurnList")
			turnList.id = self:getTurnID()
			turnList.swep = self
		end
	end
end

function SWEP:DrawHUD()
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
end

if(SERVER) then
	netstream.Hook("nutTurnTeamS", function(client, swep, orderID)
		swep:setNetVar("team", orderID)
	end)
	
	netstream.Hook("nutTurnTblS", function(client, swep, turnID)
		swep:setNetVar("turns", turnID)
	end)
	
	netstream.Hook("nutTurnRemove", function(client, turnID, entity)
		PLUGIN:turnRemove(turnID, entity)
	end)
	
	netstream.Hook("nutTurnNext", function(client, turnID, entity)
		local team = PLUGIN:turnAdvance(turnID)
		
		if(team) then
			client:notify(team.. "'s turn.")
		end
	end)
end