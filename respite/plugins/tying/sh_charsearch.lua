local PLUGIN = PLUGIN

if (SERVER) then
	local function searchAccess(inventory, action, context)
		if(inventory.searching and context.client.searcher) then
			return true
		end
	end

	nut.inventory.types["grid"]:addAccessRule(searchAccess)

	function PLUGIN:searchPlayer(client, target)
		if (!target:getChar() or !target:getChar():getInv()) then
			return false
		end
		
		if(!client:IsAdmin()) then
			if (IsValid(target:getNetVar("searcher")) or IsValid(client.nutSearchTarget)) then
				return false
			end
		end
		
		local inventory = target:getChar():getInv()
		inventory:sync(client)
		
		inventory.searching = true
		client.searcher = true

		-- Show the inventory menu to the searcher.
		netstream.Start(client, "searchPly", target, target:getChar():getInv():getID())

		client.nutSearchTarget = target
		target:setNetVar("searcher", client)

		return true
	end

	function PLUGIN:CanPlayerInteractItem(client, action, item)
		if (IsValid(client:getNetVar("searcher"))) then
			return false
		end
	end

	netstream.Hook("searchExit", function(client, target, inventory)
		client.searcher = false
		client.nutSearchTarget = nil
		target:setNetVar("searcher", nil)
		client:setNetVar("searcher", nil)
		
		if(inventory) then
			inventory.searching = false
		end
	end)
else
	netstream.Hook("searchPly", function(target, index)
		local inventory = nut.inventory.instances[index]
		
		if (!inventory) then
			netstream.Start("searchExit", target)
		end

		-- Get the inventory for the player and storage.
		local localInv = LocalPlayer():getChar():getInv()
		local storageInv = inventory
		
		local PADDING = 4
		
		-- Show both the storage and inventory.
		local localInvPanel = localInv:show()
		local storageInvPanel = storageInv:show()
		storageInvPanel:SetTitle(target:Name())

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
			
			netstream.Start("searchExit", target, inventory)
		end

		localInvPanel.OnRemove = exitStorageOnRemove
		storageInvPanel.OnRemove = exitStorageOnRemove
	end)
end

nut.command.add("charsearch", {
	onRun = function(client, arguments)
		local data = {}
			data.start = client:GetShootPos()
			data.endpos = data.start + client:GetAimVector()*96
			data.filter = client
		local target = util.TraceLine(data).Entity

		if (IsValid(target) and target:IsPlayer() and target:getNetVar("restricted")) then
			PLUGIN:searchPlayer(client, target)
		end
	end
})

nut.command.add("adminsearch", {
	adminOnly = true,
	syntax = "<string target>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1]) or client	

		if(target) then
			if(target == client) then
				client:notify("You cannot search yourself.")
				return false
			end
		
			PLUGIN:searchPlayer(client, target)
		end
	end
})