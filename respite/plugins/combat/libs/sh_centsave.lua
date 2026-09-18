local PLUGIN = PLUGIN

if(SERVER) then
	function PLUGIN:saveCEnts()
		PLUGIN.savedEnts = {}
		
		for k, v in pairs(ents.GetAll()) do
			if(!IsValid(v)) then continue end
			if(!v.combat or !(v.save or v.saveKey)) then continue end
			if(v.noSave) then continue end

			local saved = {
				pos = v:GetPos(), 
				ang = v:GetAngles(), 
				class = v:GetClass(), 
				saveData = (v.getSaveData and v:getSaveData())
			}
			
			local key = (v.saveKey) or (#PLUGIN.savedEnts + 1)

			v.saveKey = key
			PLUGIN.savedEnts[key] = saved
		end
		
		self:setData(PLUGIN.savedEnts)
	end
	
	function PLUGIN:loadCEnt(info, saveKey)
		local entity = ents.Create(info.class)
		if(IsValid(entity)) then
			entity:SetPos(info.pos)
			entity:SetAngles(info.ang)

			entity.saveKey = saveKey
			entity:Spawn()
			
			local saveData = info.saveData
			if(saveData) then
				entity:loadSaveData(saveData)
			end
			
			return entity
		else
			if(saveKey) then
				PLUGIN.savedEnts[saveKey] = nil
			end
		end
	end
	
	function PLUGIN:loadCEnts()
		PLUGIN.savedEnts = self:getData()
		
		for saveKey, info in pairs(PLUGIN.savedEnts) do
			PLUGIN:loadCEnt(info, saveKey)
		end
	end
	
	--hacky solution to errors yeeting all data, just put it in a timer and it'll only screw itself over
	function PLUGIN:InitPostEntity()
		timer.Simple(60, function()
			PLUGIN:loadCEnts()
		end)
	end
end

nut.command.add("centsave", {
	adminOnly = true,
	onRun = function(client, arguments)	
		local entity = client:GetEyeTrace().Entity --entity that we're looking at
		
		if (IsValid(entity) and entity.combat) then --makes sure it's a CEnt (Combat Entity)
			entity.save = true
			client:notify(entity:Name().. " successfully saved.")
		end
		
		client:notify("CEnt save data updated.")
		
		PLUGIN:saveCEnts()
	end
})

nut.command.add("centsaveall", {
	adminOnly = true,
	onRun = function(client, arguments)	
		local entity = client:GetEyeTrace().Entity --entity that we're looking at
		
		local count = 0
		for k, v in pairs(ents.GetAll()) do
			if(IsValid(v) and v.combat) then
				v.save = true
				count = count + 1 
			end
		end
		
		client:notify(count.. " CEnts successfully saved.")
		
		PLUGIN:saveCEnts()
	end
})

nut.command.add("centexport", {
	adminOnly = true,
	onRun = function(client, arguments)	
		local entity = client:GetEyeTrace().Entity --entity that we're looking at
		
		if (IsValid(entity) and entity.combat) then --makes sure it's a CEnt (Combat Entity)
			local CEntData = {}
			CEntData.class = entity:GetClass()
			CEntData.saveData = entity:getSaveData() or {}

			if(!CEntData.saveData.name) then
				client:notify("Save failed, unnamed CEnt.")
				return false
			end

			local path = "nutscript/"..SCHEMA.folder.."/combatexport/"
			if(!file.Exists(path, "DATA")) then
				file.CreateDir("nutscript/"..SCHEMA.folder.."/combatexport/")
			end
			
			path = "nutscript/"..SCHEMA.folder.."/combatexport/" ..string.lower(CEntData.saveData.name).. ".txt"
			file.Write(path, util.TableToJSON(CEntData))

			client:notify("CEnt successfully exported as " ..CEntData.saveData.name)
		end
	end
})

nut.command.add("centimport", {
	adminOnly = true,
	onRun = function(client, arguments)
		if(!arguments) then
			client:notify("Specify a CEnt to import.")
			return false
		end

		local CEntName = string.lower(table.concat(arguments, " "))
		
		local path = "nutscript/"..SCHEMA.folder.."/combatexport/" ..CEntName
		
		if(!file.Exists(path.. ".txt", "DATA")) then
			client:notify("No stored CEnt of that name.")
			return false
		end
		
		local import = file.Read(path.. ".txt") or ""
		local importTbl = util.JSONToTable(import)
		
		importTbl.pos = client:GetEyeTraceNoCursor().HitPos + Vector(0, 0, 10)
		importTbl.ang = Angle(0,0,0)
		
		PLUGIN:loadCEnt(importTbl)
	
		client:notify("CEnt successfully imported.")
	end
})

nut.command.add("centimportmenu", {
	adminOnly = true,
	onRun = function(client, arguments)
		if(!arguments) then
			client:notify("Specify a CEnt to import.")
			return false
		end
		
		local path = "nutscript/"..SCHEMA.folder.."/combatexport/"
		
		local files, directories = file.Find(path.. "*", "DATA")
		if(files) then
			netstream.Start(client, "nut_centImportMenu", files)
		end
	end
})

if(SERVER) then
	netstream.Hook("nut_CEntImportFromMenu", function(client, name)
		local name = string.lower(name)
		
		local path = "nutscript/"..SCHEMA.folder.."/combatexport/" ..name
		
		if(!file.Exists(path, "DATA")) then
			client:notify("No stored CEnt of that name.")
			return false
		end
		
		local import = file.Read(path) or ""
		local data = util.JSONToTable(import)
	
		data.pos = client:GetEyeTraceNoCursor().HitPos + Vector(0, 0, 10)
		data.ang = Angle(0,0,0)
	
		client.CEntC = data
	
		client:notify(name.. " copied, use /centpaste to spawn.")
	end)
else --CLIENT
	netstream.Hook("nut_centImportMenu", function(files)
		local menu = vgui.Create("nutCEntImportMenu")
		menu:Populate(files)
	end)
end


--clones a target Cent
nut.command.add("centclone", {
	adminOnly = true,
	onRun = function(client, arguments)
		local entity = client:GetEyeTrace().Entity --entity that we're looking at
		
		if (IsValid(entity) and entity.combat) then --makes sure it's a CEnt (Combat Entity)
			local saveData = entity:getSaveData()
			
			local clone = ents.Create(entity:GetClass()) --the new clone entity
			clone:SetPos(entity:GetPos()) --set its position
			clone:SetAngles(entity:GetAngles()) --set its angles
			
			clone:Spawn() --spawn it
			clone:loadSaveData(saveData)
			
			clone:SetCreator(client) --prop protection

			local name = entity:getNetVar("name", entity.PrintName)
			client:notify(name.. " has been cloned.") --notify the player
		else --called if they aren't looking at the right thing
			client:notify("You must be looking at a combat entity.")
		end
	end
})

--clones a target Cent
nut.command.add("centcopy", {
	adminOnly = true,
	onRun = function(client, arguments)
		local entity = client:GetEyeTrace().Entity --entity that we're looking at
		
		if (IsValid(entity) and entity.combat) then --makes sure it's a CEnt (Combat Entity)
			local data = {
				class = entity:GetClass(),
				ang = entity:GetAngles(),
				saveData = entity:getSaveData()
			}

			client.CEntC = data
			local name = entity:getNetVar("name", entity.PrintName)
			client:notify(name.. " has been copied.") --notify the player
		else --called if they aren't looking at the right thing
			client:notify("You must be looking at a combat entity.")
		end
	end
})

--clones a target Cent
nut.command.add("centpaste", {
	adminOnly = true,
	onRun = function(client, arguments)
		local data = client.CEntC
		if(data) then
			local clone = ents.Create(data.class) --the new clone entity
			clone:SetPos(client:GetEyeTrace().HitPos) --set its position
			clone:SetAngles(data.ang) --set its angles
			
			clone:Spawn() --spawn it
			clone:loadSaveData(data.saveData)
			
			clone:SetCreator(client) --prop protection

			local name = clone:getNetVar("name", clone.PrintName)
			client:notify(name.. " has been pasted.") --notify the player
		end
	end
})