local PLUGIN = PLUGIN
PLUGIN.name = "CEnt Templater"
PLUGIN.author = " "
PLUGIN.desc = "Used to save CEnt setups."

--[[
function PLUGIN:loadCEnt(data)
	local entity = ents.Create(data.class)
	if(IsValid(entity)) then
		entity:SetPos(data.pos)
		entity:SetAngles(data.ang)
		
		for k, v in pairs(data.saveData or {}) do
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
		
		return entity
	end
end
--]]

function PLUGIN:saveTemplate(client, data, saveName)
	if(!saveName) then return false end

	local mapName = game.GetMap()

	local path = "nutscript/"..SCHEMA.folder.."/"..mapName.."/combattemplate/"
	if(!file.Exists(path, "DATA")) then
		file.CreateDir("nutscript/"..SCHEMA.folder.."/"..mapName.."/combattemplate/")
	end
	
	local toSave = {}
	
	for k, v in pairs(data) do
		if(!IsValid(v)) then continue end
	
		local saved = {
			pos = v:GetPos(), 
			ang = v:GetAngles(), 
			class = v:GetClass(), 
			saveData = (v.getSaveData and v:getSaveData())
		}
		
		toSave[k] = saved
	end

	path = "nutscript/"..SCHEMA.folder.."/"..mapName.."/combattemplate/" ..string.lower(saveName).. ".txt"
	
	--maybe verify before saving over other templates
	if(file.Exists(path, "DATA")) then
		client:requestQuery("Overwrite?", "Overwrite File?", function(text)
			file.Write(path, util.TableToJSON(toSave))
			client:notify("Template successfully saved as " ..saveName)
		end)
	else
		file.Write(path, util.TableToJSON(toSave))
		client:notify("Template successfully saved as " ..saveName)
	end
end

function PLUGIN:loadTemplate(client, saveName, swep)
	if(!saveName) then return false end
	
	local mapName = game.GetMap()
	
	local path = "nutscript/"..SCHEMA.folder.."/"..mapName.."/combattemplate/" ..string.lower(saveName)
	
	if(!file.Exists(path.. ".txt", "DATA")) then
		client:notify("No stored template of that name.")
		return false
	end
	
	local import = file.Read(path.. ".txt") or ""
	local importTbl = util.JSONToTable(import)
	
	local loaded = {}
	
	local entities = importTbl or {}
	for k, entity in pairs(entities) do
		loaded[#loaded+1] = nut.plugin.list["combat"]:loadCEnt(entity)
	end

	if(swep and IsValid(swep)) then
		swep:SetTemplate(loaded)
	end
	
	client:notify("Template successfully loaded " ..saveName)
end