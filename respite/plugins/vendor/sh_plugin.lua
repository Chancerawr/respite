local PLUGIN = PLUGIN

PLUGIN.name = "Vendors"
PLUGIN.author = "Chessnut"
PLUGIN.desc = "Adds NPC vendors that can sell things."

if (SERVER) then
	AddCSLuaFile("cl_editor.lua")
end

nut.util.include("sv_logging.lua")
nut.util.include("sh_enums.lua")
nut.util.include("sh_import.lua")
nut.util.include("sv_networking.lua")
nut.util.include("cl_networking.lua")
nut.util.include("sv_data.lua")
nut.util.include("sv_hooks.lua")
nut.util.include("cl_hooks.lua")

nut.command.add("vendorsellflag", {
	adminOnly = true,
	syntax = "<string flag>",
	onRun = function(client, arguments)
		if(!arguments[1]) then
			client:notify("Specify a flag.")
			return false
		end
		
		local flag = arguments[1]

		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity:GetClass() == "nut_vendor") then
			local vendorItems = entity.items or {}
			
			for k, item in pairs(nut.item.list) do
				if(item.noBusiness) then continue end --ignore no business
				if(item.flag != flag) then continue end --ignore non flagged
				--if(vendorItems[item.uniqueID]) then continue end --ignore items already in there

				vendorItems[item.uniqueID] = {}
				vendorItems[item.uniqueID][VENDOR_PRICE] = item.price
				vendorItems[item.uniqueID][VENDOR_MODE] = 2
			end
			
			entity.items = vendorItems
			
			PLUGIN:saveVendors()
			
			client:notify(flag.. " flag added to vendor.")
		else
			client:notify("You must be looking at a vendor.")
		end
	end
})

nut.command.add("vendorbuyflag", {
	adminOnly = true,
	syntax = "<string flag>",
	onRun = function(client, arguments)
		if(!arguments[1]) then
			client:notify("Specify a flag.")
			return false
		end
		
		local flag = arguments[1]

		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity:GetClass() == "nut_vendor") then
			local vendorItems = entity.items or {}
			
			for k, item in pairs(nut.item.list) do
				if(item.noBusiness) then continue end --ignore no business
				if(item.flag != flag) then continue end --ignore non flagged
				--if(vendorItems[item.uniqueID]) then continue end --ignore items already in there

				vendorItems[item.uniqueID] = {}
				vendorItems[item.uniqueID][VENDOR_PRICE] = item.price
				vendorItems[item.uniqueID][VENDOR_MODE] = 3
			end
			
			entity.items = vendorItems
			
			PLUGIN:saveVendors()
			
			client:notify(flag.. " flag added to vendor.")
		else
			client:notify("You must be looking at a vendor.")
		end
	end
})

nut.command.add("vendorbuysellflag", {
	adminOnly = true,
	syntax = "<string flag>",
	onRun = function(client, arguments)
		if(!arguments[1]) then
			client:notify("Specify a flag.")
			return false
		end
		
		local flag = arguments[1]

		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity:GetClass() == "nut_vendor") then
			local vendorItems = entity.items or {}
			
			for k, item in pairs(nut.item.list) do
				if(item.noBusiness) then continue end --ignore no business
				if(item.flag != flag) then continue end --ignore non flagged
				--if(vendorItems[item.uniqueID]) then continue end --ignore items already in there

				vendorItems[item.uniqueID] = {}
				vendorItems[item.uniqueID][VENDOR_PRICE] = item.price
				vendorItems[item.uniqueID][VENDOR_MODE] = 1
			end
			
			entity.items = vendorItems
			
			PLUGIN:saveVendors()
			
			client:notify(flag.. " flag added to vendor.")
		else
			client:notify("You must be looking at a vendor.")
		end
	end
})

nut.command.add("vendorremoveflag", {
	adminOnly = true,
	syntax = "<string flag>",
	onRun = function(client, arguments)
		if(!arguments[1]) then
			client:notify("Specify a flag.")
			return false
		end
		
		local flag = arguments[1]

		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity:GetClass() == "nut_vendor") then
			local vendorItems = entity.items or {}
			
			for k, item in pairs(nut.item.list) do
				if(item.noBusiness) then continue end --ignore no business
				if(item.flag != flag) then continue end --ignore non flagged
				
				if(vendorItems[item.uniqueID]) then
					vendorItems[item.uniqueID] = nil
				end
			end
			
			PLUGIN:saveVendors()
			
			client:notify(flag.. " flag removed from vendor.")
		else
			client:notify("You must be looking at a vendor.")
		end
	end
})
