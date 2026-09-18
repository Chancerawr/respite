local PLUGIN = PLUGIN

PLUGIN.name = "Storage Base"
PLUGIN.author = "Cheesenut"
PLUGIN.desc = "Useful things for storage plugins."

STORAGE_DEFINITIONS = STORAGE_DEFINITIONS or {}
PLUGIN.definitions = STORAGE_DEFINITIONS

nut.util.include("sv_storage.lua")
nut.util.include("sv_networking.lua")
nut.util.include("sv_access_rules.lua")
nut.util.include("cl_networking.lua")
nut.util.include("cl_password.lua")

nut.util.include("sh_definitions.lua")
nut.util.include("sh_lootable.lua")

nutStorageBase = PLUGIN

if (CLIENT) then
	function PLUGIN:transferItem(itemID)
		if (not nut.item.instances[itemID]) then return end
		net.Start("nutStorageTransfer")
			net.WriteUInt(itemID, 32)
		net.SendToServer()
	end
	
	local takeAllBackground = Material("respite/ui/inventory.png")
	
	function PLUGIN:CreateTakeAllButton(localInvPanel, storageInvPanel, storage)
		if(IsValid(storageInvPanel.takeAll)) then
			storageInvPanel.takeAll:Remove()
		end
	
		local frame = vgui.Create("DPanel", storageInvPanel)
		frame:SetSize(storageInvPanel:GetWide(), 75)
		frame:MakePopup()
		frame:SetWide(storageInvPanel:GetWide())
		frame:SetPos(storageInvPanel:GetPos())
		frame:MoveBelow(storageInvPanel, 8)

		frame.Paint = function(panel, w, h)
			--background color
			surface.SetDrawColor(Color(40, 40, 40, 255))
			surface.DrawRect(0, 0, w, h)
		end
	
		local button = vgui.Create("DButton", frame)
		button:Dock(FILL)
		button:SetText("")
		button:SetTextColor(Color(255,255,255))
		button.DoClick = function()
			netstream.Start("nut_storageTakeAll", storage)
		end
		button.Paint = function(panel, w, h)
			--background color
			surface.SetDrawColor(Color(0, 0, 0, 220))
			surface.DrawRect(0, 0, w, h)

			surface.SetDrawColor(10, 10, 10, 255)
			--surface.SetMaterial(takeAllBackground)
			surface.DrawRect(0, 0, w, h)
			--surface.DrawTexturedRect(0, 0, w, h)
			
			surface.SetDrawColor(0, 0, 0, 255)
			surface.DrawOutlinedRect(0, 0, w, h, 4)
			
			local name = "Take All"
			surface.SetFont("nutInventoryTitleFont")
			surface.SetTextColor(255, 255, 255)

			local textSizeX, textSizeY = surface.GetTextSize(name)
			
			surface.SetTextPos(w*0.5-textSizeX*0.5, h*0.5-textSizeY*0.5)
			surface.DrawText(name)
		end
		
		storageInvPanel.takeAll = frame
	end
	
	--take all prompt
	function PLUGIN:OnCreateStoragePanel(localInvPanel, storageInvPanel, storage)
		PLUGIN:CreateTakeAllButton(localInvPanel, storageInvPanel, storage)
		
		local oldMousePress = storageInvPanel.OnMousePressed
		storageInvPanel.OnMousePressed = function(panel, keyCode)
			if(IsValid(panel.takeAll)) then
				panel.takeAll:Remove()
			end
			
			oldMousePress(panel, keyCode)
		end
		
		local oldMouseReleased = storageInvPanel.OnMouseReleased
		storageInvPanel.OnMouseReleased = function(panel, keyCode)
			PLUGIN:CreateTakeAllButton(localInvPanel, storageInvPanel, storage)
			
			oldMouseReleased(panel, keyCode)
		end
	end
end

if(SERVER) then
	netstream.Hook("nut_storageTakeAll", function(client, storage)
		local char = client:getChar()
		
		if(char and client.nutStorageEntity == storage) then
			local charInv = char:getInv()
			local storInv = storage:getInv()
			
			local delay = 0
			
			for k, v in pairs(storInv:getItems()) do
				timer.Simple(delay, function()
					local x, y = charInv:findFreePosition(v)
				
					if(x and y) then
						hook.Run("HandleItemTransferRequest", client, v.id, x, y, charInv:getID())
					end
				end)
				
				delay = delay + 0.1
			end
		end
	end)
end

nut.command.add("storagelock", {
	adminOnly = true,
	syntax = "[string password]",
	onRun = function(client, arguments)
		local trace = client:GetEyeTraceNoCursor()
		local ent = trace.Entity

		if (ent and ent:IsValid()) then
			local password = table.concat(arguments, " ")

			if (password != "") then
				ent:setNetVar("locked", true)
				ent.password = password
				client:notifyLocalized("storPass", password)
			else
				ent:setNetVar("locked", nil)
				ent:setNetVar("owner", nil)
				ent.password = nil
				client:notifyLocalized("storPassRmv")
			end

			PLUGIN:saveStorage()
		else
			client:notifyLocalized("invalid", "Entity")
		end
	end
})

nut.command.add("storagename", {
	adminOnly = true,
	syntax = "[string name]",
	onRun = function(client, arguments)
		local trace = client:GetEyeTraceNoCursor()
		local ent = trace.Entity

		if (ent and ent:IsValid()) then
			if(ent:GetCreator() == client or client:IsAdmin()) then		
				local name = table.concat(arguments, " ")

				ent:setNetVar("name", name)
				
				PLUGIN:saveStorage()
				
				client:notify("Storage name updated.")
			else
				client:notify("You do not own that.")
			end
		else
			client:notifyLocalized("invalid", "Entity")
		end
	end
})

nut.command.add("storagedesc", {
	syntax = "[string desc]",
	onRun = function(client, arguments)
		local trace = client:GetEyeTraceNoCursor()
		local ent = trace.Entity

		if (ent and ent:IsValid()) then
			if(ent:GetCreator() == client or client:IsAdmin()) then		
				local desc = table.concat(arguments, " ")

				ent:setNetVar("desc", desc)
				
				PLUGIN:saveStorage()
				
				client:notify("Storage description updated.")
			else
				client:notify("You do not own that.")
			end
		else
			client:notifyLocalized("invalid", "Entity")
		end
	end
})

nut.command.add("storageadd", {
	adminOnly = true,
	syntax = "<string item> <number items>",
	onRun = function(client, arguments)
		local trace = client:GetEyeTraceNoCursor()
		local target = trace.Entity
		
		if(target and target:GetClass() == "nut_storage") then
			local uniqueID = arguments[1]:lower()
			local itemAmount = tonumber(arguments[2]) or 1

			if (!nut.item.list[uniqueID]) then
				for k, v in SortedPairs(nut.item.list) do
					if (nut.util.stringMatches(v.name, uniqueID)) then
						uniqueID = k

						break
					end
				end
			end
			
			if(!nut.item.list[uniqueID]) then
				client:notify("Invalid Item.")
				return false
			end

			local inventory = target:getInv()
			inventory:addSmart(uniqueID, itemAmount)
		
			client:notify(itemAmount.. " " ..nut.item.list[uniqueID].name.. "(s) added.")
		else
			client:notify("Look at a storage entity.")
		end
	end
})

nut.command.add("storageunlockall", {
	adminOnly = true,
	syntax = "<string item> <number items>",
	onRun = function(client, arguments)
		client:requestQuery("Are you sure you want to unlock ALL storage?", "Unlock All", function(text)
			for k, v in pairs(ents.GetAll("nut_storage")) do
				v.password = nil
				v:setNetVar("locked", nil)
				
				client:notify("All storage has been unlocked.")
			end
			
			PLUGIN:saveStorage()
			
			client:notify("All storage unlocked.")
		end)
	end
})

nut.command.add("storagecreate", {
	adminOnly = true,
	syntax = "<string modelpath> <string width> <string height>",
	onRun = function(client, arguments)
		if(!arguments[1]) then
			client:notify("No model specified.")
			return false
		end
	
		local trace = client:GetEyeTraceNoCursor()
		
		local hitpos = trace.HitPos
		local storage = ents.Create("nut_storage")
		storage:SetPos(hitpos)
		storage:Spawn()
		storage:SetModel(tostring(arguments[1]))
		
		storage:SetSolid(SOLID_VPHYSICS)
		storage:PhysicsInit(SOLID_VPHYSICS)
		storage:SetCreator(client)
		
		storage:setNetVar("desc", "")
		storage:setNetVar("name", "Storage")
		
		local data
		if(arguments[2] and arguments[3]) then
			local width = math.Clamp(tonumber(arguments[2]), 1, 10)
			local height = math.Clamp(tonumber(arguments[3]), 1, 10)
		
			local name = tostring(width)..tostring(height)
			data = STORAGE_DEFINITIONS[name]
			storage:setNetVar("overwrite", name)
		else
			data = STORAGE_DEFINITIONS["models/props_junk/wood_crate001a.mdl"]
			storage:setNetVar("overwrite", "models/props_junk/wood_crate001a.mdl")
		end
		
		nut.inventory.instance(data.invType, data.invData)
			:next(function(inventory)
				if (IsValid(storage)) then
					inventory.isStorage = true
					storage:setInventory(inventory)
					PLUGIN:saveStorage()

					if (isfunction(data.onSpawn)) then
						data.onSpawn(storage)
					end
				end
			end, function(err)
				ErrorNoHalt(
					"Unable to create storage entity for "..client:Name().."\n"..
					err.."\n"
				)
				if (IsValid(storage)) then
					storage:Remove()
				end
			end)
			
		client:notify("Storage created.")
	end
})

nut.command.add("storageclone", {
	adminOnly = true,
	syntax = "<none>",
	onRun = function(client, arguments)
		local trace = client:GetEyeTraceNoCursor()
		
		local entity = trace.Entity
		if(entity and entity:GetClass() == "nut_storage") then
			local storage = ents.Create("nut_storage")
			storage:SetPos(entity:GetPos())
			
			storage:Spawn()
			storage:SetModel(entity:GetModel())
			storage:SetMaterial(entity:GetMaterial())
			storage:SetSolid(SOLID_VPHYSICS)
			storage:PhysicsInit(SOLID_VPHYSICS)
			storage:SetCreator(client)
			
			storage:setNetVar("name", entity:getNetVar("name", "Storage"))
			storage:setNetVar("desc", entity:getNetVar("desc", ""))
			
			storage:setNetVar("overwrite", entity:getNetVar("overwrite"))
			
			local inventory = entity:getInv()
			local invW, invH = inventory:getSize()
			
			local data = STORAGE_DEFINITIONS["" ..invW..invH]
			
			nut.inventory.instance(data.invType, data.invData)
				:next(function(inventory)
					if (IsValid(storage)) then
						inventory.isStorage = true
						storage:setInventory(inventory)
						PLUGIN:saveStorage()

						if (isfunction(data.onSpawn)) then
							data.onSpawn(storage)
						end
					end
				end, function(err)
					ErrorNoHalt(
						"Unable to create storage entity for "..client:Name().."\n"..
						err.."\n"
					)
					if (IsValid(storage)) then
						storage:Remove()
					end
				end)
				
			client:notify("Storage cloned.")
		else
			client:notify("Look at a valid storage entity.")
			return false
		end
	end
})

--debugging command for when inventories get really dumb
nut.command.add("storageempty", {
	adminOnly = true,
	onRun = function(client, arguments)
		local trace = client:GetEyeTraceNoCursor()
		
		local target = trace.Entity
		if(target and target:GetClass() == "nut_storage") then			
			local inventory = target:getInv()
			
			for k, v in pairs(inventory:getItems()) do
				--v:removeFromInventory(true)
				--v:spawn()
				
				v:removeFromInventory(true)
				:next(function() v:spawn((trace.HitPos + VectorRand(0, 10))) end)
			end
			
			client:notify("Storage emptied.")
		else
			client:notify("Look at a storage entity.")
		end
	end
})

--debugging command for when inventories get really dumb
nut.command.add("storageforceunequip", {
	adminOnly = true,
	onRun = function(client, arguments)
		local trace = client:GetEyeTraceNoCursor()
		
		local target = trace.Entity
		if(target and target:GetClass() == "nut_storage") then			
			local inventory = target:getInv()
			
			for k, v in pairs(inventory:getItems()) do
				if(v:getData("equip")) then
					v:setData("equip", nil)
				end
			end
		
			client:notify("Item(s) unequipped.")
		else
			client:notify("Look at a storage entity.")
		end
	end
})

--lets admins open a storage entity even if it's passworded
nut.command.add("storageopen", {
	adminOnly = true,
	syntax = "<none>",
	onRun = function(client, arguments)
		local trace = client:GetEyeTraceNoCursor()
		local ent = trace.Entity

		if (ent and ent:IsValid()) then
			client.nutStorageEntity = ent
		
			ent:openInv(client)
		else
			client:notifyLocalized("invalid", "Entity")
		end
	end
})