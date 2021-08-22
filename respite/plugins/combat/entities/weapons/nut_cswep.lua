local PLUGIN = PLUGIN

AddCSLuaFile()

SWEP.PrintName = "Combat"
SWEP.Slot = 0
SWEP.SlotPos = 1
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false

SWEP.Author = ""
SWEP.Instructions = "Primary Fire: Use selected command. (Default: Attack)\nSecondary Fire: Select/Deselect targeted entity.\nReload: Cycle through actions."
SWEP.Purpose = "Managing the attacks and actions of yourself or a Combat Entity."

SWEP.ViewModelFOV = 45
SWEP.ViewModelFlip = false
SWEP.AnimPrefix	 = "rpg"

SWEP.ViewTranslation = 4

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = ""
SWEP.Primary.Delay = 1

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = 0
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = ""

SWEP.UseHands = false
SWEP.LowerAngles = Angle(15, -10, -20)

SWEP.IsAlwaysLowered = true
SWEP.FireWhenLowered = true
SWEP.HoldType = "normal"

ALWAYS_RAISED["nut_cswep"] = true

SWEP.ViewModel = ""
SWEP.WorldModel = ""

SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.Category = "Nutscript - Combat"

function SWEP:Initialize()
	self:SetHoldType(self.HoldType)
	
	self:SetActions(self.Owner)
	self.actNum = 1	
end

function SWEP:Deploy()
	self:SetActions(self.Owner)
	self.actNum = 1
end

function SWEP:Reload()
	if(!self.actions) then
		self:SetActions(self.Owner)
	end

	if((self.nextReload or 0) < CurTime()) then
		self.nextReload = CurTime() + 0.5
		
		self:OpenActionList()
	end
end

function SWEP:OpenActionList()
	self:SetActions(self:getNetVar("selected", self.Owner))
	
	if(CLIENT) then
		local actionList = vgui.Create("nutActionList")
		actionList.swep = self
		actionList.actions = self:GetActions()
	end
end

function SWEP:GetActions()
	if(!self.actions) then
		self:SetActions()
	end
	
	local actions = self:getNetVar("actions", self.actions)
	
	return actions
end

function SWEP:SetActions(target)
	if(!IsValid(target)) then return end

	local actions = target:getActions()
	self.actions = actions
end

--this is clientside
function SWEP:selectAction(actNum)
	self.actNum = actNum
	netstream.Start("CSWep_action", actNum, self)
end

if(SERVER) then
	netstream.Hook("CSWep_action", function(client, actNum, swep)
		if(IsValid(swep) and swep.GetActions) then
			local actions = swep:GetActions()
		
			swep.actNum = actNum
			client:notify("Selected " ..(actions[actNum] and actions[actNum].name or ""))
		end
	end)
end

function SWEP:selectTarget(entity)
	if(CLIENT) then return end

	self:setNetVar("actions", nil)

	if(IsValid(entity) and entity.combat) then
		self:setNetVar("selected", entity)
		self:setNetVar("selectedName", entity:Name())
		self.Owner:notify("Selected " ..entity:Name().. ".")

		self.actNum = 1
		self:SetActions(entity) --sets potential actions to the selected units'
	else
		if(self:getNetVar("selected")) then
			self:setNetVar("selected", nil)
			self.Owner:notify("Deselected.")
			
			self.actNum = 1
			self:SetActions(self.Owner) --sets potential actions to the wielder of the weapon
		end
	end
end

--more will be added to this later
function SWEP:canAttackPlayer()
	return true
	
	--[[
	if(IsValid(self:getNetVar("selected")) or self.Owner:IsAdmin()) then
		return true
	else
		return false
	end
	--]]
end

function SWEP:PrimaryAttack()
	local data = {}
		data.start = self.Owner:GetShootPos()
		data.endpos = data.start + self.Owner:GetAimVector()*4096
		data.filter = {self.Owner, self}
	local trace = util.TraceLine(data)

	local actions = self:GetActions()
	local action = actions[self.actNum]
	
	if(!action) then return end
	
	if (SERVER and trace.Hit) then
		local client = self.Owner
		local attacker = self:getNetVar("selected", client)
		
		local actionTbl = {}
		
		if(action.uid) then
			actionTbl = ACTS.actions[action.uid]
		end
		
		--deletes consumable items upon use, should probably be moved elsewhere
		if(action.consumable) then
			local Amount = action.consumable:getData("Amount", 1)
		
			if(Amount > 1) then
				action.consumable:setData("Amount", Amount - 1)
			else
				action.consumable:remove()
			end
			
			self.actNum = 1
		end
		
		if(!action.attackOverwrite and !actionTbl.attackOverwrite) then --this lets you make actions that just print stuff or run functions
			PLUGIN:attackStart(client, attacker, trace, action, partString)
		else
			actionTbl:attackOverwrite(attacker, trace)
		end
	
		self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
	end
end

function SWEP:SecondaryAttack()
	if(SERVER) then
		local data = {}
			data.start = self.Owner:GetShootPos()
			data.endpos = data.start + self.Owner:GetAimVector()*4096
			data.filter = {self.Owner, self}
		local trace = util.TraceLine(data)

		if (trace.Hit) then
			local entity = trace.Entity
			
			if(IsValid(entity) and (self.Owner:IsAdmin() or (entity.combat and entity:GetCreator() == self.Owner))) then
				self:selectTarget(entity)
			else
				self:selectTarget() --reset target
			end
		end
	end
end

function SWEP:DrawHUD()
	if(CLIENT) then
		local client = LocalPlayer()

		local alpha = 255
		
		local actions = self:GetActions()
		local action = actions[self.actNum]

		if(self:getNetVar("selected")) then
			local name = self:getNetVar("selectedName", "Unnamed")
			
			nut.util.drawText(name.. " Selected", ScrW() * 0.5, ScrH() * 0.3, ColorAlpha(Color(50,50,255), alpha), 1, 1, "nutEntDesc", alpha * 1)
		end
		
		local altPressed
		if(client:KeyDown(IN_WALK)) then --self targetting
			altPressed = true
		end
		
		if((self.nextCEntTrace or 0) < CurTime()) then
			local data = {}
				data.start = self.Owner:GetShootPos()
				data.endpos = data.start + self.Owner:GetAimVector()*4096
				data.filter = {self.Owner, self}
			local trace = util.TraceLine(data)

			if (trace.Hit) then
				local entity = trace.Entity
				if(entity.combat or entity:IsPlayer()) then
					self.viewed = entity:Name()
					
					self.nextCEntTrace = CurTime() + 1
				else
					self.viewed = nil
				end
				
				if(action and action.radius) then
					client.ccAreaShow = {trace.HitPos, action.radius}
				else
					client.ccAreaShow = nil
				end
			end
		end
		
		if(self.viewed) then
			local name = self.viewed
		
			if((action and action.selfOnly) or altPressed) then
				name = self:getNetVar("selectedName", client:Name())
			end
		
			nut.util.drawText(name.. " Viewed", ScrW() * 0.5, ScrH() * 0.7, ColorAlpha(Color(255,50,50), alpha), 1, 1, "nutEntDesc", alpha * 1)
			
			if(action) then
				nut.util.drawText("Primary Fire to " ..action.name.. ".", ScrW() * 0.5, ScrH() * 0.7 + 16, ColorAlpha(Color(255,50,50), alpha), 1, 1, "nutEntDesc", alpha * 1)
			end
		end
	end
end

--sends CEnt action lists to client
if(CLIENT) then
	netstream.Hook("CSWep_loadActions", function(swep, actions)
		swep.actions = util.JSONToTable(actions)
	end)
end