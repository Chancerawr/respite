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
			end

			local inventory = target:getInv()
			inventory:addSmart(uniqueID, tonumber(arguments[2]) or 1)
		
			client:notify("Item(s) added.")
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
			local name = tostring(arguments[2])..tostring(arguments[3])
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