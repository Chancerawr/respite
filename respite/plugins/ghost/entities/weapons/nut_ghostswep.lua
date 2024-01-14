local PLUGIN = PLUGIN

AddCSLuaFile()

SWEP.PrintName = "Ghost"
SWEP.Slot = 0
SWEP.SlotPos = 1
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false

SWEP.Author = ""
SWEP.Instructions = "Primary Fire: Spawn selected.\nSecondary Fire: Open menu."
SWEP.Purpose = "Spawning NPCs, items, etc."

SWEP.ViewModelFOV = 45
SWEP.ViewModelFlip = false
SWEP.AnimPrefix	 = "rpg"

SWEP.ViewTranslation = 4

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = ""
SWEP.Primary.Delay = 0.25

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

ALWAYS_RAISED["nut_ghostswep"] = true

SWEP.ViewModel = ""
SWEP.WorldModel = ""

SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.Category = "Nutscript - Combat"

function SWEP:Initialize()
	self:SetHoldType(self.HoldType)
end

function SWEP:Deploy()
	if(CLIENT) then
		if(self.selection) then
			local actionTbl = self.selection
			local trace = self:GetOwner():GetEyeTrace()
			
			self:MakeGhostEntity(actionTbl.model or "models/hunter/blocks/cube05x05x05.mdl", trace.HitPos, Angle(0,0,0))
		end
	end
end

function SWEP:Holster(weapon)
	if(CLIENT) then
		if(IsValid(self.GhostEntity)) then
			SafeRemoveEntity(self.GhostEntity)
		end
	end

	return true
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

	local data = {}
		data.start = self.Owner:GetShootPos()
		data.endpos = data.start + self.Owner:GetAimVector()*4096
		data.filter = {self.Owner, self}
	local trace = util.TraceLine(data)

	if(trace.HitPos) then
		self:createSelected(trace.HitPos)
		
		self:SetNextPrimaryFire(CurTime() + self.Primary.Delay) -- this wasnt working properly for no reason
	end
end

function SWEP:SecondaryAttack()
	if((self.nextSecondary or 0) > CurTime()) then return end

	self:openGhostMenu()
	
	self:SetNextSecondaryFire(CurTime() + self.Secondary.Delay)
	self.nextSecondary = CurTime() + self.Secondary.Delay
end

function SWEP:openGhostMenu()
	if(CLIENT) then
		local ghostMenu = vgui.Create("nutGhostMenu")
		ghostMenu.swep = self
	end
end

function SWEP:setSelected(action)
	if(!action) then return end
	
	local actionTbl = PLUGIN.actions[action]
	if(!actionTbl) then return end

	self.selection = actionTbl
	
	if(CLIENT) then
		netstream.Start("nut_ghostSwepSelect", action, self)
		
		local trace = self:GetOwner():GetEyeTrace()
		self:MakeGhostEntity(actionTbl.model or "models/hunter/blocks/cube05x05x05.mdl", trace.HitPos, Angle(0,0,0))
	end
end

--keeps track of and updates cooldowns
function SWEP:checkCD(data)
	if(!self.cdTbl) then
		self.cdTbl = {}
	end

	local cdTbl = self.cdTbl or {}
	
	local CD = cdTbl[data.name]
	if(CD) then
		--still on cooldown
		if(CD > CurTime()) then
			return CD
		else --off cooldown
			self.cdTbl[data.name] = nil
			return false
		end
	end
	
	return false
end

--keeps track of and updates cooldowns
function SWEP:addCD(data)
	if(!self.cdTbl) then
		self.cdTbl = {}
	end

	self.cdTbl[data.name] = CurTime() + data.CD
end

function SWEP:createSelected(position)
	if(!self.selection) then return end
	
	local client = self.Owner

	local onCD = self:checkCD(self.selection)

	-- checks if swep is off cooldown
	--if((self.nextCreation or 0) > CurTime()) then
	if(onCD) then
		local remainingTime = math.Round(onCD - CurTime(), 2)
	
		client:notify(self.selection.name.. " on cooldown for another " ..remainingTime.. " seconds.")
		
		return false
	end
	
	--check if a player can see that location
	local checkLOS = self:checkLOS(position)
	if(checkLOS) then
		if(checkLOS == 1) then
			client:notify("A player can see that location.")
		elseif(checkLOS == 2) then
			client:notify("Too close to a player.")
		end

		return false
	end
	
	--local points = self:getNetVar("points", 0)
	local points = client:GetNW2Int("ghostPoints", 0)
	
	--checks if they hav eenough points
	if(self.selection.cost) then
		if(points < self.selection.cost) then
			client:notify("You do not have enough points to do that.")
			
			return false
		else
			--self:setNetVar("points", points - self.selection.cost)
			client:SetNW2Int("ghostPoints", points - self.selection.cost)
		end
	end

	--run special functions
	if(self.selection.useFunction) then
		if(!self.selection.useFunction(client, position, self.selection)) then --if failed, refund
			--self:setNetVar("points", points)
			client:SetNW2Int("ghostPoints", points)
			self.nextCreation = CurTime()
			
			client:notify("Action failed. Points refunded.")
			
			return false
		end
	end
	
	--if the ability has a cooldown
	if(self.selection.CD) then
		self:addCD(self.selection)
	end
end

function SWEP:checkLOS(position)
	for k, client in ipairs(player.GetAll()) do
		if(client:GetMoveType() != MOVETYPE_NOCLIP) then
			local eyePos = client:EyePos()
		
			local data = {}
				data.start = position
				data.endpos = eyePos
				data.filter = {client, self.Owner}
				data.mask = MASK_SOLID
			local trace = util.TraceLine(data)
			
			if(!trace.Hit) then
				local distSqr = eyePos:DistToSqr(position)

				if(distSqr < 6250000) then
					-- a player can see this location
					return 1
				end
			elseif(trace.Hit) then
				local distSqr = eyePos:DistToSqr(position)
				if(distSqr < 250000) then
					-- too close to a player
					return 2
				end
			end
		end
	end
end

function SWEP:Think()
	if(SERVER) then
		--moved to sh_plugin
		--[[
		if((self.nextPoints or 0) < CurTime()) then
			self.nextPoints = CurTime() + 10

			local points = self:getNetVar("points", 0)
			self:setNetVar("points", points + 5)
		end
		--]]
	else
		self:UpdateGhostEntity()
	end
end

if(SERVER) then
	netstream.Hook("nut_ghostSwepSelect", function(client, action, swep)
		swep:setSelected(action)
	end)
end

if(CLIENT) then
	function SWEP:MakeGhostEntity(model, pos, angle)
		if (SERVER) then return end
		--if (!IsFirstTimePredicted()) then return end

		util.PrecacheModel(model)

		-- The reason we need this is because in multiplayer, when you holster a tool serverside,
		-- either by using the spawnnmenu's Weapons tab or by simply entering a vehicle,
		-- the Think hook is called once after Holster is called on the client, recreating the ghost entity right after it was removed.
		--if (self.GhostEntityLastDelete && self.GhostEntityLastDelete + 0.1 > CurTime()) then return end

		-- Release the old ghost entity
		--self:ReleaseGhostEntity()

		-- Don't allow ragdolls/effects to be ghosts
		--if (!util.IsValidProp(model)) then return end
	
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
		
		self.GhostEntity:ResetSequence(math.random(1,5))

		self.GhostEntity:SetSolid(SOLID_VPHYSICS)
		self.GhostEntity:SetMoveType(MOVETYPE_NONE)
		self.GhostEntity:SetNotSolid(true)
		self.GhostEntity:SetRenderMode(RENDERMODE_TRANSALPHA)
		self.GhostEntity:SetColor(Color(255, 255, 255, 180))
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

	function SWEP:DrawHUD()
		local client = LocalPlayer()

		local alpha = 255
		
		local scrModX = 1920/ScrW()
		local scrModY = 1080/ScrH()

		local posY = ScrH() - 100 * scrModY
		local posX = ScrW() - 220 * scrModX
		local textX = ScrW() - (120 * scrModX)
		
		posX = ScrW() - 210 * scrModX
		posY = 100 * scrModY
		
		--points display
		--local points = self:getNetVar("points", 0)
		local points = client:GetNW2Int("ghostPoints", 0)
		if(points) then
			local textX = ScrW() - (120 * scrModX)
			local heightPoints = (45) * scrModY
		
			surface.SetDrawColor(0,0,0)
			surface.DrawRect(posX, posY, 180 * scrModX, heightPoints)
			
			posY = posY + 10
			nut.util.drawText("(Points)", textX, posY, ColorAlpha(Color(255,255,255), alpha), 1, 1, "nutSmallFont", alpha * 1)
			
			posY = posY + 20
			nut.util.drawText(points, textX, posY, ColorAlpha(Color(255,255,255), alpha), 1, 1, "nutSmallFont", alpha * 1)
		end
		
		if(self.selection) then
			nut.util.drawText("Primary Fire to create " ..self.selection.name.. ". Cost: [" ..self.selection.cost.. "p]" .. " CD: [" ..self.selection.CD.. "s]", ScrW() * 0.5, ScrH() * 0.7 + 16, ColorAlpha(Color(200,50,50), alpha), 1, 1, "nutMediumFont", alpha * 1)
		end
	end
end