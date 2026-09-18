local PLUGIN = PLUGIN

nut.command.add("vendorexport", {
	adminOnly = true,
	onRun = function(client, arguments)	
		local entity = client:GetEyeTrace().Entity --entity that we're looking at
		
		if (IsValid(entity) and entity:GetClass() == "nut_vendor") then --makes sure it's a CEnt (Combat Entity)
			local vendorData = {
				name = entity:getNetVar("name"),
				desc = entity:getNetVar("desc"),
				model = entity:GetModel(),
				bubble = entity:getNetVar("noBubble"),
				items = entity.items,
				factions = entity.factions,
				classes = entity.classes,
				money = entity.money,
				scale = entity:getNetVar("scale"),
				buyScale = entity:getNetVar("buyScale"),
				flag = entity:getNetVar("flag"),
				material = entity:GetMaterial()
			}

			if(!vendorData.name) then
				client:notify("Save failed, unnamed CEnt.")
				return false
			end

			local path = "nutscript/"..SCHEMA.folder.."/vendorexport/"
			if(!file.Exists(path, "DATA")) then
				file.CreateDir("nutscript/"..SCHEMA.folder.."/vendorexport/")
			end
			
			path = "nutscript/"..SCHEMA.folder.."/vendorexport/" ..string.lower(vendorData.name).. ".txt"
			file.Write(path, util.TableToJSON(vendorData))

			client:notify("Vendor successfully exported as " ..vendorData.name)
		end
	end
})

nut.command.add("vendorimport", {
	adminOnly = true,
	onRun = function(client, arguments)
		if(!arguments) then
			client:notify("Specify a Vendor to import.")
			return false
		end

		local CEntName = string.lower(table.concat(arguments, " "))
		
		local path = "nutscript/"..SCHEMA.folder.."/vendorexport/" ..CEntName
		
		if(!file.Exists(path.. ".txt", "DATA")) then
			client:notify("No stored Vendor of that name.")
			return false
		end
		
		local import = file.Read(path.. ".txt") or ""
		local importTbl = util.JSONToTable(import)
		
		importTbl.pos = client:GetEyeTraceNoCursor().HitPos + Vector(0, 0, 10)
		importTbl.angles = Angle(0,0,0)
		
		local entity = ents.Create("nut_vendor")
		entity:SetPos(importTbl.pos)
		entity:SetAngles(importTbl.angles)
		entity:Spawn()
		entity:SetModel(importTbl.model)
		
		entity:setNetVar("noBubble", importTbl.bubble)
		entity:setNetVar("name", importTbl.name)
		entity:setNetVar("desc", importTbl.desc)
		entity:setNetVar("scale", importTbl.scale or 0.5)
		entity:setNetVar("buyScale", importTbl.buyScale or 1)
		entity:setNetVar("flag", importTbl.flag)

		if(importTbl.material) then
			entity:SetMaterial(importTbl.material)
		end
		
		entity.items = importTbl.items or {}
		entity.factions = importTbl.factions or {}
		entity.classes = importTbl.classes or {}
		entity.money = importTbl.money
	
		PLUGIN:saveVendors()
	
		client:notify("Vendor successfully imported.")
	end
})
