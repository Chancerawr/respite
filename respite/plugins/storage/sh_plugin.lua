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
			for i = 1, (tonumber(arguments[2]) or 1) do
				timer.Simple(i, function()
					inventory:add(uniqueID, 1)
				end)
			end
		
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