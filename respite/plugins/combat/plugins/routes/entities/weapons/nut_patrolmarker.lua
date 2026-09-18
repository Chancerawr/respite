local PLUGIN = PLUGIN
AddCSLuaFile()

SWEP.PrintName = "Patrol Marker"
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
SWEP.Primary.Delay = 0.5

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = 0
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = ""

SWEP.UseHands = false
SWEP.LowerAngles = Angle(15, -10, -20)

SWEP.IsAlwaysLowered = true
SWEP.FireWhenLowered = true
SWEP.HoldType = "normal"

ALWAYS_RAISED["nut_patrolmarker"] = true

SWEP.ViewModel = ""
SWEP.WorldModel = ""

SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.Category = "Nutscript - Combat"

function SWEP:Initialize()
	self:SetHoldType(self.HoldType)
end

function SWEP:Deploy()
	if(SERVER) then
		PLUGIN:NetworkRouteData(self.Owner)
	end
end

--primary fire to add people to selected turn
function SWEP:PrimaryAttack()
	if((self.nextPrimary or 0) < CurTime()) then
		self.nextPrimary = CurTime()+0.1
		
		if(CLIENT) then
			local client = self.Owner
			local trace = client:GetEyeTrace()
			if (trace.HitPos) then
				local routeData = self.routeData or {}
			
				routeData[#routeData+1] = trace.HitPos

				client.patrolMarker = routeData
				
				self.routeData = routeData
				self:SaveRoute()
			end
		end
	end
end

--secondary fire to switch team
function SWEP:SecondaryAttack()
	if(CLIENT) then
		local client = self.Owner

		local trace = client:GetEyeTrace()
		if (trace.HitPos) then
			local closest = math.huge
			local closestKey
			
			for k, v in pairs(self.routeData) do
				local dist = v:DistToSqr(trace.HitPos)
				if(dist < closest) then
					closest = dist
					closestKey = k
				end
			end
			
			if(closestKey and closest < 500) then
				--add range check here or something
				table.remove(self.routeData, closestKey)
			end
			
			client.patrolMarker = self.routeData
			
			self:SaveRoute()
		end
	end
end

--open turn menu
function SWEP:Reload()
	if((self.nextReload or 0) < CurTime()) then
		self.nextReload = CurTime() + 0.5

		if(CLIENT) then
			local routeID = self.routeID
			local routeData = self.routeData or {}
		
			local routeGUI = vgui.Create("nutRoutes")
			routeGUI.swep = self
			routeGUI.routeID = routeID
			routeGUI.routeData = routeData
			
			routeGUI:PopulateRoute(routeData)
		end
	end
end

function SWEP:SetRoute(ID, data)
	self.routeID = ID
	self.routeData = data
end

function SWEP:SaveRoute()
	local client = self.Owner

	if(CLIENT) then
		if(self.routeID) then
			netstream.Start("nut_routeSave", self.routeID, self.routeData)
		else
			nut.util.notify("No route name set, use reload for menu.")
		end
	else
		PLUGIN:UpdateRoute(ID, data)
	end
end

function SWEP:DrawHUD()
	if(CLIENT) then
		--[[
	
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
		--]]
	end
	
	hook.Add("PostDrawOpaqueRenderables", "nut_patrolmaker_renderables", function()
		local client = LocalPlayer()
		
		if(client.patrolMarker) then
			local swep = client:GetWeapon("nut_patrolmarker")
			local current = client:GetActiveWeapon()
			
			if(IsValid(swep) and swep.routeID and swep == current) then
				local routeData = swep.routeData or {}

				local prevPos
				for k, v in pairs(routeData) do
					render.DrawWireframeSphere(v, 16, 10, 10, Color(50, 255, 50), true)
					
					--connect this point to the previous point
					if(k > 1) then
						render.DrawLine(v+Vector(0,0,10), prevPos+Vector(0,0,10), Color(50, 255, 50))
					end
					prevPos = v
					
					--connect last point to first point, closing the loop
					if(k == #routeData) then
						render.DrawLine(v+Vector(0,0,10), routeData[1]+Vector(0,0,10), Color(50, 255, 50))
					end
					
					local position = v+Vector(0,0,30)
					local angles = Angle(0,0,0)

					cam.Start3D2D(position,angles,2)
						local textPosX = 0
						local textPosY = 0
					
						local text = k
						
						surface.SetFont("nutChatFontCombat")
					
						local textSizeX, textSizeY = surface.GetTextSize(text)
						
						surface.SetTextColor(0, 0, 255)
						surface.SetTextPos(textPosX-textSizeX*0.5, textPosY-textSizeY*0.5) 
						surface.DrawText(text)
					cam.End3D2D()
				end
			end
		end
	end)
end