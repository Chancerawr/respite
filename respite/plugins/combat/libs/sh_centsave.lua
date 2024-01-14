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
			
			for k, v in pairs(info.saveData or {}) do
				if(k == "model") then
					entity.savedModel = v

					continue
				elseif(k == "modelScale") then
					entity.savedModelScale = v

					continue
				elseif(k == "bodygroups") then
					entity.savedBodygroups = v

					continue
				elseif(k == "attribs") then
					entity.attribs = v
					
					continue
				elseif(k == "res") then
					entity.res = v
					
					continue
				elseif(k == "amp") then
					entity.amp = v
					
					continue
				elseif(k == "dmg") then
					entity.dmg = v
					
					continue
				elseif(k == "actions") then
					entity.actions = v
					
					continue
				elseif(k == "mat") then
					entity.savedMat = v
					
					continue
				elseif(k == "submat") then
					entity.savedSubMat = v
					
					continue
				elseif(k == "anim") then
					entity.savedAnim = v
				
					--continue
				elseif(k == "color") then
					entity.savedColor = v
				
					continue
				elseif(k == "weapon") then
					entity.savedWeapon = v
				
					continue
				end
				
				entity:setNetVar(k, v)
			end
			
			entity:Spawn()
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