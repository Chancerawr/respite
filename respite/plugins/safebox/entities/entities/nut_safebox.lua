local PLUGIN = PLUGIN

AddCSLuaFile()

ENT.Type = "anim"
ENT.PrintName = "Safebox"
ENT.Category = "NutScript"
ENT.Spawnable = true
ENT.AdminOnly = true

if (SERVER) then
	function ENT:Initialize()
		self:SetModel(nut.config.get("safeModel"))
		self:SetMaterial("models/props_lab/security_screens")
		self:SetSolid(SOLID_VPHYSICS)
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetUseType(SIMPLE_USE)
		self.receivers = {}
		
		local physObj = self:GetPhysicsObject()

		if (IsValid(physObj)) then
			physObj:EnableMotion(true)
			physObj:Wake()
		end
	end

	function ENT:CreateInv(activator)
		local character = activator:getChar()
		  
		nut.inventory.instance("grid", {nut.config.get("safeWidth", 5), nut.config.get("safeHeight", 5)})
		:next(function(inventory)
			character:setData("safebox", inventory:getID())
		end)
		
		timer.Simple(0.2, function()
			self:OpenInv(activator)
		end)
  	end

	function ENT:getInv()
		local index = self.activator:getChar():getData("safebox")

		if (index) then
			return nut.inventory.instances[index]
		end
	end

	function ENT:RestoreInv(activator)
		local character = activator:getChar()
		local index = character:getData("safebox")
		
		if (index) then
			local inventory = nut.inventory.instances[index]
		
			if (inventory) then
				inventory:sync(activator)
			else
				nut.inventory.loadByID(index)
			end

			timer.Simple(0.2, function()
				self:OpenInv(activator)
			end)
		else
			self:CreateInv(activator)
		end
	end

	function ENT:OpenInv(activator)
		local index = activator:getChar():getData("safebox")
		local inventory = nut.inventory.instances[index]
		
		if (index and inventory) then
			inventory.isSafe = true
		
			self:setInventory(inventory)
		
			self.receivers[activator] = true
			inventory:sync(activator)
			
			self.activator = activator
			
			activator.nutStorageEntity = self
			
			netstream.Start(activator, "safeOpen", inventory:getID())
		else
			self:RestoreInv(activator)
		end
	end

	function ENT:Use(activator)
		if(activator:getChar():getFaction() == FACTION_SHADE or activator:getChar():getFaction() == FACTION_DRIFTER) then
			self:OpenInv(activator)
		else
			activator:notify("Your faction cannot use this.")
		end
	end
	
	function ENT:setInventory(inventory)
		assert(inventory, "Storage setInventory called without an inventory!")
		self:setNetVar("id", inventory:getID())

		hook.Run("SafeBoxAccessRules", inventory)
		hook.Run("StorageInventorySet", self, inventory)
	end
else
	netstream.Hook("safeOpen", function(index)
		local inventory = nut.inventory.instances[index]
		
		-- Get the inventory for the player and storage.
		local localInv =
			LocalPlayer():getChar() and LocalPlayer():getChar():getInv()
		local storageInv = inventory
		if (not localInv or not storageInv) then
			return nutStorageBase:exitStorage()
		end		
		
		-- Show both the storage and inventory.
		local localInvPanel = localInv:show()
		local storageInvPanel = storageInv:show()
		storageInvPanel:SetTitle("Safebox")

		-- Allow the inventory panels to close.
		localInvPanel:ShowCloseButton(true)
		storageInvPanel:ShowCloseButton(true)

		local PADDING = 4
		
		-- Put the two panels, side by side, in the middle.
		local extraWidth = (storageInvPanel:GetWide() + PADDING) / 2
		localInvPanel:Center()
		storageInvPanel:Center()
		localInvPanel.x = localInvPanel.x + extraWidth
		storageInvPanel:MoveLeftOf(localInvPanel, PADDING)

		-- Signal that the user left the inventory if either closes.
		local firstToRemove = true
		localInvPanel.oldOnRemove = localInvPanel.OnRemove
		storageInvPanel.oldOnRemove = storageInvPanel.OnRemove

		local function exitStorageOnRemove(panel)
			if (firstToRemove) then
				firstToRemove = false
				nutStorageBase:exitStorage()
				local otherPanel =
					panel == localInvPanel and storageInvPanel or localInvPanel
				if (IsValid(otherPanel)) then otherPanel:Remove() end
			end
			panel:oldOnRemove()
		end

		hook.Run("OnCreateStoragePanel", localInvPanel, storageInvPanel, storage)

		localInvPanel.OnRemove = exitStorageOnRemove
		storageInvPanel.OnRemove = exitStorageOnRemove		
	end)

	ENT.DrawEntityInfo = true
	local toScreen = FindMetaTable("Vector").ToScreen
	local colorAlpha = ColorAlpha
	local drawText = nut.util.drawText
	local configGet = nut.config.get

	function ENT:onDrawEntityInfo(alpha)
		local position = toScreen(self.LocalToWorld(self, self.OBBCenter(self)))
		local x, y = position.x, position.y
		local tx, ty = drawText("Safebox", x, y, colorAlpha(configGet("color"), alpha), 1, 1, nil, alpha * 2)
	
		drawText("A box that is larger on the inside than it is on the outside.", x, y + 16, colorAlpha(color_white, alpha), 1, 1, "nutEntDesc", alpha * 0.65)
	end
end

local function CanNotUse(inventory, action, context)
	if (action != "transfer" and action != "repl") then return false end
end

function PLUGIN:SafeBoxAccessRules(inventory)
	inventory:addAccessRule(CanNotUse)
end