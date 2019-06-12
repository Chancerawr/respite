local PLUGIN = PLUGIN
PLUGIN.name = "Cook Food"
PLUGIN.author = "Black Tea"
PLUGIN.desc = "How about getting new foods in NutScript?"
--PLUGIN.hungrySeconds = 60000 -- A player can stand up 300 seconds without any foods

COOKLEVEL = {
	[1] = {"Uncooked", 1, color_white},
	[2] = {"Burnt", .7, Color(207, 0, 15)},
	[3] = {"Well Done", 2, Color(235, 149, 50)},
	[4] = {"Good", 3, Color(103, 128, 159)},
	[5] = {"Very Good", 3.5, Color(63, 195, 128)},
}
COOKER_MICROWAVE = 1
COOKER_STOVE = 2

nut.util.include("cl_vgui.lua")

local playerMeta = FindMetaTable("Player")
local entityMeta = FindMetaTable("Entity")

--[[function playerMeta:getHungerPercent()
	return math.Clamp(((CurTime() - self:getHunger()) / PLUGIN.hungrySeconds), 0 ,1)
end--]]

--[[function playerMeta:addHunger(amount)
	local curHunger = CurTime() - self:getHunger()

	self:setNetVar("hunger", 
		CurTime() - math.Clamp(math.min(curHunger, PLUGIN.hungrySeconds) - amount, 0, PLUGIN.hungrySeconds)
	)
end--]]

function entityMeta:isStove()
	local class = self:GetClass()

	return (class == "nut_stove" or class == "nut_microwave")
end

-- Register HUD Bars.
if (CLIENT) then
	--[[local color = Color(39, 174, 96)

	do
		 nut.bar.add(function()
			return (1 - LocalPlayer():getHungerPercent())
		end, color, nil, "hunger")
	end

	local hungerBar, percent, wave
	function PLUGIN:Think()
		hungerBar = nut.bar.get("hunger")
		percent = (1 - LocalPlayer():getHungerPercent())

		if (percent < .33) then -- if hunger is 33%
			wave = math.abs(math.sin(RealTime()*5)*100)

			hungerBar.lifeTime = CurTime() + 1
			hungerBar.color = Color(color.r + wave, color.g - wave, color.b - wave)
		else
			hungerBar.color = color
		end
	end--]]

	netstream.Hook("stvOpen", function(storage, index)
		local inventory = nut.inventory.instances[index]
		
		if (IsValid(storage) and inventory) then
			-- Number of pixels between the local inventory and storage inventory.
			local PADDING = 4

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
			storageInvPanel:SetTitle(storage.PrintName)

			-- Allow the inventory panels to close.
			localInvPanel:ShowCloseButton(true)
			storageInvPanel:ShowCloseButton(true)

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
			
			local actPanel = vgui.Create("DPanel")
			actPanel:SetDrawOnTop(true)
			actPanel:SetSize(100, storageInvPanel:GetTall())
			actPanel.Think = function(this)
				if (!storageInvPanel or !storageInvPanel:IsValid() or !storageInvPanel:IsVisible()) then
					this:Remove()

					return
				end

				local x, y = storageInvPanel:GetPos()
				this:SetPos(x - this:GetWide() - 5, y)
			end			
			
			local timers = {5, 15, 30}
			for k, v in ipairs(timers) do
				local btn = actPanel:Add("DButton")
				btn:Dock(TOP)
				btn:SetText(v .. " Seconds")
				btn:DockMargin(5, 5, 5, 0)

				function btn.DoClick()
					netstream.Start("stvActive", storage, v)
				end
			end
		end
	end)
else
	local PLUGIN = PLUGIN

	function PLUGIN:LoadData()
		local savedTable = self:getData() or {}

		for k, v in ipairs(savedTable) do
			local stove = ents.Create(v.class)
			stove:SetPos(v.pos)
			stove:SetAngles(v.ang)
			stove:Spawn()
			stove:Activate()
		end
	end
	
	function PLUGIN:SaveData()
		local savedTable = {}

		for k, v in ipairs(ents.GetAll()) do
			if (v:isStove()) then
				table.insert(savedTable, {class = v:GetClass(), pos = v:GetPos(), ang = v:GetAngles()})
			end
		end

		self:setData(savedTable)
	end
end

function PLUGIN:PrePlayerLoadedChar(client, character, currentChar)
	character:setData("stomach", 0)
end