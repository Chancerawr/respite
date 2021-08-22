local PLUGIN = PLUGIN

if(SERVER) then
	function PLUGIN:saveCEnts()
		PLUGIN.savedEnts = {}
		
		for k, v in pairs(ents.GetAll()) do
			if(!IsValid(v)) then continue end
			if(!v.combat or !(v.save or v.saveKey)) then continue end

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
	
	function PLUGIN:loadCEnts()
		PLUGIN.savedEnts = self:getData()
		
		for saveKey, info in pairs(PLUGIN.savedEnts) do
			local entity = ents.Create(info.class)
			if(IsValid(entity)) then
				entity:SetPos(info.pos)
				entity:SetAngles(info.ang)
				
				entity.saveKey = saveKey
				
				for k, v in pairs(info.saveData or {}) do
					if(k == "model") then
						entity.savedModel = v

						continue
					elseif(k == "attribs") then
						entity.savedAttribs = v
						
						continue
					elseif(k == "mat") then
						entity.savedMat = v
						
						continue
					elseif(k == "anim") then
						entity.savedAnim = v
					
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
	end
	
	--hacky solution to errors yeeting all data, just put it in a timer and it'll only screw itself over
	function PLUGIN:InitPostEntity()
		timer.Simple(0, function()
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