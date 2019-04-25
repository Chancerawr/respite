local PLUGIN = PLUGIN

nut.config.add("stor_spawnrate", 600, "How often a new item will be added to marked storage entities.", nil, {
	data = {min = 1, max = 84600},
	category = "Scavenging"
})

nut.config.add("stor_locallimit", 2, "How many items are allowd in a single storage item.", nil, {
	data = {min = 1, max = 84600},
	category = "Scavenging"
})

--[[
PLUGIN.spawngroups = { 
	["default"] = {
		"food_banana"
	}
}
--]]

if SERVER then
	local spawntime = 1

	function PLUGIN:ItemShouldSave(entity)
		return (!entity.generated)
	end

	function PLUGIN:Think()	
		if(!self.init and !self.spawngroups) then
			self.spawngroups = nut.plugin.list["worlditemspawner"] and nut.plugin.list["worlditemspawner"].spawngroups
			self.init = true
		end	
	
		if spawntime > CurTime() then return end
		spawntime = CurTime() + nut.config.get("stor_spawnrate", 600)

		local storage = ents.FindByClass("nut_storage")
		local lootables = {}
		for k, v in pairs(storage) do
			if(v.lootable) then
				table.insert(lootables, v)
			end
		end
		
		for i = 1, 1 do
			local container = table.Random(lootables)
			
			if (container and IsValid(container)) then
				local pos = container:GetPos()
				for k, v in pairs(ents.FindInSphere(pos, 500)) do
					if (v:IsPlayer()) then
						return
					end
				end
				
				local item = table.Random(self.spawngroups[container.lootable] or self.spawngroups["default"])
				local inventory = container:getInv()
				
				if(table.Count(inventory:getItems()) < nut.config.get("stor_locallimit", 2)) then
					inventory:add(item, 1)
				end
			end
		end
	end
end

nut.command.add("storagemark", {
	adminOnly = true,
	syntax = "<string itemgroup>",
	onRun = function(client, arguments)
		local trace = client:GetEyeTraceNoCursor()
		
		local target = trace.Entity
		if(target and target:GetClass() == "nut_storage") then
			target.lootable = arguments[1] or "default"
			client:notify("Storage marked with " ..target.lootable.. ".")
		else
			client:notify("Look at a storage entity.")
		end
	end
})

nut.command.add("storageunmark", {
	adminOnly = true,
	onRun = function(client, arguments)
		local trace = client:GetEyeTraceNoCursor()
		
		local target = trace.Entity
		if(target and target:GetClass() == "nut_storage") then
			target.lootable = nil
			client:notify("Storage unmarked.")
		else
			client:notify("Look at a storage entity.")
		end
	end
})

nut.command.add("storagefill", {
	adminOnly = true,
	syntax = "<string itemgroup> <number items>",
	onRun = function(client, arguments)
		local trace = client:GetEyeTraceNoCursor()
		
		local target = trace.Entity
		if(target and target:GetClass() == "nut_storage") then
			for i = 1, (arguments[2] or 3) do
				timer.Simple(i, function()
					local item = table.Random(PLUGIN.spawngroups[arguments[1]] or PLUGIN.spawngroups["default"])
					local inventory = target:getInv()
					inventory:add(item, 1)
				end)
			end
		
			client:notify("Storage filled.")
		else
			client:notify("Look at a storage entity.")
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
		
			for i = 1, (arguments[2] or 1) do
				timer.Simple(i, function()
					local inventory = target:getInv()
					inventory:add(uniqueID, 1)
				end)
			end
		
			client:notify("Item(s) added.")
		else
			client:notify("Look at a storage entity.")
		end
	end
})