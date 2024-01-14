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
	local actions = self:SetActions(self:getNetVar("selected", self.Owner))
	
	if(SERVER) then
		netstream.Start(self.Owner, "CSWep_openActionMenu", self)
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

	if(SERVER) then
		self:setNetVar("actions", actions)
	end

	self.actions = actions
	
	return self.actions
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
	
	--for consumable items
	if(action.itemUse) then
		self.actNum = 1
	end
	
	if (SERVER and trace.Hit) then
		local client = self.Owner
		local attacker = self:getNetVar("selected", client)
		
		local actionTbl = {}
		
		if(action.uid) then
			actionTbl = ACTS.actions[action.uid]
		end
		
		if(actionTbl.attackOverwrite) then --this lets you make actions that just print stuff or run functions
			actionTbl:attackOverwrite(attacker, trace)
		else
			PLUGIN:attackStart(client, attacker, trace, action)
		end
		
		if(attacker.AttackAnim) then
			attacker:attackAnimStart()
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

		if (trace.Hit and IsValid(trace.Entity)) then
			local entity = trace.Entity

			local allow = entity.combat and 
				(
				self.Owner:IsAdmin()
				or entity:GetCreator() == self.Owner
				or entity.playerControlled
				)

			if(allow) then
				self:selectTarget(entity)
			else
				self:selectTarget() --reset target
			end
		else
			self:selectTarget()
		end
	end
end

function SWEP:Holster(weapon)
	local client = self.Owner
	
	client.combatAOE_S = nil
	client.combatAOE_B = nil
	
	return true
end

function SWEP:DrawHUD()
	if(CLIENT) then
		local client = LocalPlayer()

		local alpha = 255
		
		local scrModX = 1920/ScrW()
		local scrModY = 1080/ScrH()
		
		local actions = self:GetActions()
		local action = actions[self.actNum]

		local user = self:getNetVar("selected", client)

		if(self:getNetVar("selected")) then
			local name = self:getNetVar("selectedName", "Unnamed")
			
			nut.util.drawText(name.. " Selected", ScrW() * 0.5, ScrH() * 0.3, ColorAlpha(Color(50,50,255), alpha), 1, 1, "nutSmallFont", alpha * 1)
		end
		
		--[[
		local AP = (user.getAP and user:getAP()) or 0
		local APMax = (user.getAPMax and user:getAPMax()) or 0

		if(AP and APMax) then
			surface.SetDrawColor(0,0,0)
			surface.DrawRect(ScrW() - (120 * scrModX), 20 * scrModY, 100 * scrModX, 40 * scrModY)
			
			nut.util.drawText(AP.. "/" ..APMax.. " AP", ScrW() - (70 * scrModX), 40 * scrModY, ColorAlpha(Color(255,255,255), alpha), 1, 1, "nutSmallFont", alpha * 1)
		end
		--]]
		
		local posY = ScrH() - 100 * scrModY
		local posX = ScrW() - 220 * scrModX
		local textX = ScrW() - (120 * scrModX)
		
		local hp = user.getHP and user:getHP()
		local mp = user.getMP and user:getMP()
		
		if(hp and mp) then
			local hpMax = user:getMaxHP()
			local mpMax = user:getMaxMP()
		
			local textX = ScrW() - 120 * scrModX
			local boxHeight = 30 * scrModY
		
			surface.SetDrawColor(0,0,0)
			surface.DrawRect(posX, posY, 200 * scrModX, boxHeight)
			
			posY = posY + 15
			nut.util.drawText("Health: (" ..hp.. "/" ..hpMax.. ")", textX, posY, ColorAlpha(Color(255,150,150), alpha), 1, 1, "nutMediumFont", alpha * 1)

			posY = posY + 30
			surface.SetDrawColor(0,0,0)
			surface.DrawRect(posX, posY, 200 * scrModX, boxHeight)
			
			posY = posY + 15
			nut.util.drawText("Mind: (" ..mp.. "/" ..mpMax.. ")", textX, posY, ColorAlpha(Color(150,150,255), alpha), 1, 1, "nutMediumFont", alpha * 1)
		end
		
		posX = ScrW() - 210 * scrModX
		posY = 100 * scrModY
		
		--buff display
		local buffs = user.getBuffs and user:getBuffs()
		if(buffs) then
			
			local textX = ScrW() - (120 * scrModX)
			local heightBuff = (25 + 20 * table.Count(buffs)) * scrModY
		
			surface.SetDrawColor(0,0,0)
			surface.DrawRect(posX, posY, 180 * scrModX, heightBuff)
			
			posY = posY + 10
			nut.util.drawText("(BUFFS)", textX, posY, ColorAlpha(Color(255,255,255), alpha), 1, 1, "nutSmallFont", alpha * 1)
			
			for k, v in pairs(buffs) do
				if(v.name) then
					posY = posY + 20
				
					local nameDur = v.name..((v.duration and (" " ..v.duration.. "T")) or "")
				
					nut.util.drawText(nameDur, textX, posY, ColorAlpha(Color(255,255,255), alpha), 1, 1, "nutSmallFont", alpha * 1)
				end
			end
		end
		
		--cooldown display
		local cooldowns = user.getCooldowns and user:getCooldowns()
		if(cooldowns) then
			posY = posY + 40
			local heightCD = (25 + 20 * table.Count(cooldowns)) * scrModY
		
			surface.SetDrawColor(0,0,0)
			surface.DrawRect(posX, posY, 180 * scrModX, heightCD)
			
			posY = posY + 10
			nut.util.drawText("(COOLDOWNS)", textX, posY, ColorAlpha(Color(255,255,255), alpha), 1, 1, "nutSmallFont", alpha * 1)
			
			for k, v in pairs(cooldowns) do
				local action = ACTS.actions[k]
				if(action) then
					posY = posY + 20
				
					local nameDur = (action.name or "Unknown").. " " ..v.. "T"
				
					nut.util.drawText(nameDur, textX, posY, ColorAlpha(Color(255,255,255), alpha), 1, 1, "nutSmallFont", alpha * 1)
				end
			end
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
				
				if(action) then
					if(action.radius) then
						client.combatAOE_S = {trace.HitPos, action.radius}
					elseif(action.box) then
						client.combatAOE_B = action.box
					else
						client.combatAOE_S = nil
						client.combatAOE_B = nil
					end
				else
					client.combatAOE_S = nil
					client.combatAOE_B = nil
				end
			end
		end
		
		if(self.viewed) then
			local name = self.viewed
		
			if((action and action.selfOnly) or altPressed) then
				name = self:getNetVar("selectedName", client:Name())
			end
		
			nut.util.drawText(name.. " Viewed", ScrW() * 0.5, ScrH() * 0.7, ColorAlpha(Color(255,50,50), alpha), 1, 1, "nutSmallFont", alpha * 1)
			
			if(action) then
				nut.util.drawText("Primary Fire to " ..action.name.. ".", ScrW() * 0.5, ScrH() * 0.7 + 16, ColorAlpha(Color(255,50,50), alpha), 1, 1, "nutSmallFont", alpha * 1)
			end
		end
	end
end

--sends CEnt action lists to client
if(CLIENT) then
	netstream.Hook("CSWep_openActionMenu", function(swep)
		local actionList = vgui.Create("nutActionList")
		actionList.swep = swep
		actionList.actions = swep:GetActions()
	end)
	
	netstream.Hook("CSWep_loadActions", function(swep, actions)
		swep.actions = util.JSONToTable(actions)
	end)
	
	hook.Add("PostDrawOpaqueRenderables", "nut_cswep_renderables", function()
		local client = LocalPlayer()
		
		if(client.combatAOE_S) then
			render.DrawWireframeSphere(client.combatAOE_S[1], client.combatAOE_S[2], 10, 10, Color(100, 100, 255, 255), true)
		elseif(client.combatAOE_B) then
			local boxData = client.combatAOE_B
		
			local width = boxData[1]
			local length = boxData[2]
		
			local mins = Vector(0-width, 0, 0+width*0.5)
			local maxs = Vector(width, length, width)
			
			local position = client:GetPos()
			local angles = self:LocalEyeAngles() + Angle(0,-90,0)
			angles.x = 0

			render.DrawWireframeBox(position, angles, mins, maxs, Color(100, 100, 255, 255))
		end
	end)
end