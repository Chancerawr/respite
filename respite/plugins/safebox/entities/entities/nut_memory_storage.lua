local PLUGIN = PLUGIN

AddCSLuaFile()

ENT.Type = "anim"
ENT.PrintName = "Memory Storage"
ENT.Category = "Respite"
ENT.Spawnable = true
ENT.AdminOnly = true

if (SERVER) then
	function ENT:Initialize()
		self:SetModel("models/Items/ammoCrate_Rockets.mdl")
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
		
		self:LoadInv()
	end

	function ENT:LoadInv()
		local invID = tonumber(nut.config.get("groupStorage", -1))
		if(invID == -1) then
			self:CreateInv()
		else
			self.inventory = invID
			self:LoadInvByID()
		end
  	end
	
	function ENT:CreateInv()
		nut.inventory.instance("grid", {w = 14, h = 14})
		:next(function(inventory)
			nut.config.set("groupStorage", inventory:getID())
			self.inventory = inventory:getID()
		end)
  	end
	
	function ENT:LoadInvByID()
		nut.inventory.loadByID(self.inventory)
		:next(function(inventory)
			if (inventory and IsValid(self) and !(inventory.loaded and IsValid(inventory.loaded))) then
				inventory.loaded = self
				inventory.isStorage = true
				self:setInventory(inventory)
				--hook.Run("StorageRestored", self, inventory)
			end
		end)
  	end

	function ENT:getInv()
		return nut.inventory.instances[self.inventory]
	end

	function ENT:OpenInv(activator)
		local inventory = self:getInv()
		
		if (inventory) then
			inventory.isSafe = true
	
			self:setInventory(inventory)
		
			self.receivers[activator] = true
			inventory:sync(activator)
			
			self.activator = activator
			
			activator.nutStorageEntity = self
			
			netstream.Start(activator, "memoryStorOpen", inventory:getID())
		end
	end

	function ENT:Use(activator)
		self:OpenInv(activator)
	end
	
	function ENT:setInventory(inventory)
		assert(inventory, "Storage setInventory called without an inventory!")
		self:setNetVar("id", inventory:getID())

		hook.Run("SafeBoxAccessRules", inventory)
		hook.Run("StorageInventorySet", self, inventory)
	end
	
	function ENT:OnRemove()
		if (not self.nutForceDelete) then
			if (not nut.entityDataLoaded or not PLUGIN.loadedData) then return end
			if (self.nutIsSafe) then return end
			if (nut.shuttingDown) then return end
		end
		
		PLUGIN:saveBox()
	end
else
	netstream.Hook("memoryStorOpen", function(index)
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
		storageInvPanel:SetTitle("Memory Storage")

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
		local tx, ty = drawText("Memory Storage", x, y, colorAlpha(configGet("color"), alpha), 1, 1, nil, alpha * 2)
	
		drawText("A box that is larger on the inside than it is on the outside.", x, y + 16, colorAlpha(color_white, alpha), 1, 1, "nutSmallFont", alpha * 0.65)
	end
end

local function CanNotUse(inventory, action, context)
	if (action != "transfer" and action != "repl") then return false end
end

function PLUGIN:SafeBoxAccessRules(inventory)
	inventory:addAccessRule(CanNotUse)
end