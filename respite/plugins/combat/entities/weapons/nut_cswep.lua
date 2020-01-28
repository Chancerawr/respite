local PLUGIN = PLUGIN

AddCSLuaFile()

SWEP.PrintName = "Combat Target"
SWEP.Slot = 0
SWEP.SlotPos = 1
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false

--SWEP.Author = "Chancer"
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
SWEP.Primary.Delay = 3

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

function SWEP:CycleAction()
	self:SetActions(self:getNetVar("selected", self.Owner))
	
	if(CLIENT) then
		local actionList = vgui.Create("nutActionList")
		actionList.swep = self
		actionList.actions = self.actions
	end
end

function SWEP:SetActions(target)
	if(target.combat) then
		self.actions = target:getActions()
		
		if(SERVER) then
			local actions = util.TableToJSON(self.actions)
			
			netstream.Start(self.Owner, "CSWep_loadActions", self, actions)
		end
		
		self.actions = actions
	end
end

--this is clientside
function SWEP:selectAction(actNum)	
	self.actNum = actNum
	netstream.Start("CSWep_action", actNum, self)
end

if(SERVER) then
	netstream.Hook("CSWep_action", function(client, actNum, swep)
		swep.actNum = actNum
		client:notify("Selected " ..(swep.actions[actNum] and swep.actions[actNum].name or ""))
	end)
end

function SWEP:selectTarget(entity)
	if(IsValid(entity) and entity.combat) then
		if(SERVER) then
			self:setNetVar("selected", entity)
			self:setNetVar("selectedName", entity:Name())
			self.Owner:notify("Selected " ..entity:Name().. ".")
		end
		
		self.actNum = 1
		self:SetActions(entity) --sets potential actions to the selected units'
	else
		if(self:getNetVar("selected")) then
			if(SERVER) then
				self:setNetVar("selected", nil)
				self.Owner:notify("Deselected.")
			end
			
			self.actNum = 1
			self:SetActions(self.Owner) --sets potential actions to the wielder of the weapon
		end
	end
end

--more will be added to this later
function SWEP:canAttackPlayer()
	if(IsValid(self:getNetVar("selected")) or self.Owner:IsAdmin()) then
		return true
	else
		return false
	end
end

function SWEP:PrimaryAttack()
	local data = {}
		data.start = self.Owner:GetShootPos()
		data.endpos = data.start + self.Owner:GetAimVector()*4096
		data.filter = {self.Owner, self}
	local trace = util.TraceLine(data)

	local action = self.actions[self.actNum]

	if (SERVER and trace.Hit) then
		local entity = trace.Entity
		local client = self.Owner
		
		local attacker = self:getNetVar("selected", client)
		
		if(IsValid(entity)) then
			if (entity.combat or (entity:IsPlayer() and self:canAttackPlayer())) then
				self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)

				if(IsValid(attacker) and attacker != entity) then
					if(!action.special) then
						PLUGIN:attack(attacker, entity)
					else
						action.func(client, client, entity, action.special)
					end
					
					if(attacker.combat) then
						--attacker:attackAnim()
					end
				elseif(attacker and !IsValid(attacker)) then
					self:selectTarget() --resets target to nothing
				end
			end
		elseif(action.notarget) then --untargeted spells
			action.func(client, attacker, nil, action.special, client:GetEyeTrace().HitPos)
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
		
		if(self.Owner:IsAdmin() or entity:GetCreator() == self.Owner) then
			self:selectTarget(entity)
		end
	end
end

function SWEP:Reload()
	if((self.nextReload or 0) < CurTime()) then
		self.nextReload = CurTime() + 0.5
		
		self:CycleAction()
	end
end

function SWEP:DrawHUD()
	if(CLIENT) then
		local alpha = 255
	
		if(self:getNetVar("selected")) then
			local name = self:getNetVar("selectedName", "Unnamed")
			
			nut.util.drawText(name.. " Selected", ScrW() * 0.5, ScrH() * 0.3, ColorAlpha(Color(50,50,255), alpha), 1, 1, "nutEntDesc", alpha * 1)
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
			end
		end
		
		if(self.viewed) then
			local name = self.viewed
		
			if(self.actions) then
				nut.util.drawText(name.. " Viewed", ScrW() * 0.5, ScrH() * 0.7, ColorAlpha(Color(255,50,50), alpha), 1, 1, "nutEntDesc", alpha * 1)
				nut.util.drawText("Primary Fire to " ..self.actions[self.actNum].name.. ".", ScrW() * 0.5, ScrH() * 0.7 + 16, ColorAlpha(Color(255,50,50), alpha), 1, 1, "nutEntDesc", alpha * 1)
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