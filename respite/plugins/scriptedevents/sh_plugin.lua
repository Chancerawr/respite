local PLUGIN = PLUGIN
PLUGIN.name = "Scripted Events"
PLUGIN.author = " "
PLUGIN.desc = "Hard coded map specific events that you can prepare ahead of time. Requires code."

PLUGIN.scripts = PLUGIN.scripts or {}
PLUGIN.messages = PLUGIN.messages or {}

function PLUGIN:Think()

	if(CLIENT) then return end
	
	for k, v in pairs(PLUGIN.scripts) do
		if(v.active) then
			if(v.think) then
				v.think(v)
			end
		end
	end
	
	if((self.nextMessage or 0) < CurTime()) then
		local curMsg = PLUGIN.messages[1]
		if(curMsg) then
			self.nextMessage = CurTime() + curMsg.duration
			
			for k, v in ipairs(player.GetAll()) do
				local data = curMsg.data
				data.start = CurTime()
			
				v:setNetVar("scriptedMsg", data)
			end
			
			table.remove(PLUGIN.messages, 1)
		else
			for k, v in ipairs(player.GetAll()) do
				if(v:getNetVar("scriptedMsg")) then
					v:setNetVar("scriptedMsg", nil)
				end
			end
			
			self.nextMessage = CurTime()+1
		end
	end
end

function PLUGIN:RunScript(id, entity)
	local script = PLUGIN.scripts[id]
	
	if(script) then
		script.id = id
	
		--to spawn new things
		for k, v in pairs(script.ents or {}) do
			local entity = ents.Create(v.class or "prop_physics")
			if(IsValid(entity)) then
				if(v.model) then
					entity:SetModel(v.model)
				end
					
				entity:SetRenderMode(RENDERMODE_TRANSCOLOR)
					
				entity:SetMaterial(v.material or "")
				entity:SetSkin(v.skin or 0)
				entity:SetPos(v.pos)
				entity:SetAngles(v.ang)
				entity:SetColor(v.color or Color(255,255,255))
				entity:Spawn()
			
				if(v.noCollide) then
					entity:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
				end
			
				local physObj = entity:GetPhysicsObject()
				if(IsValid(physObj)) then
					if(v.frozen) then
						physObj:EnableMotion(false)
					end
				end

				if(v.noDraw) then
					entity:SetNoDraw(true)
				end
				
				if(!script.storedEnts) then 
					script.storedEnts = {}
				end
				
				script.storedEnts[v.name or k] = entity
			end
		end
		
		--to alter things on the map
		for k, mapEntFunc in pairs(script.mapEnts or {}) do
			local entity = ents.GetMapCreatedEntity(k)
			
			if(IsValid(entity)) then
				mapEntFunc(entity)
				
				if(!script.storedMapEnts) then 
					script.storedMapEnts = {}
				end
				
				script.storedMapEnts[v.name or k] = entity
			end
		end
		
		--to alter things on the map
		for k, v in pairs(script.triggers or {}) do
			local trigger = ents.Create("nut_trigger")
			trigger:SetPos(v.pos)
			trigger:Spawn()
			
			trigger:SetEvent(v.event)
			trigger:SetCollisionBounds(v.mins, v.maxs)
			trigger.mapscriptID = k
			
			if(!script.storedTriggers) then 
				script.storedTriggers = {}
			end
			
			script.storedTriggers[v.name or k] = trigger
		end
		
		--function that runs when the script is loaded
		if(script.onLoad) then
			script:onLoad(entity)
		end
		
		script.active = true
		
		return script
	end
end

function PLUGIN:EndScript(id, entity)
	local script = PLUGIN.scripts[id]
	
	if(script) then
		--function that runs when the script is loaded
		if(script.onEnd) then
			script:onEnd(entity)
		end
		
		script.active = nil
		
		return true
	end
	
	return false
end

function PLUGIN:AddHalo(entity, data)
	entity:setNetVar("haloData", data)

	for k, v in ipairs(player.GetAll()) do
		netstream.Start(v, "nut_AddHalo", entity:EntIndex())
	end
end

function PLUGIN:RemoveHalo(entity, data)
	entity:setNetVar("haloData", nil)
	
	for k, v in ipairs(player.GetAll()) do
		netstream.Start("nut_RemoveHalo", entity:EntIndex())
	end
end

function PLUGIN:SendMessage(data)
	for k, v in ipairs(data) do
		PLUGIN.messages[#PLUGIN.messages+1] = v
	end
end

function PLUGIN:EntityTakeDamage(target, dmginfo)
	if(target.EventHP) then
		local dmg = dmginfo:GetDamage()
	
		target.EventHP = target.EventHP - dmg
		
		if(target.EventHP <= 0) then
			SafeRemoveEntity(target)
		end
	end
end

nut.command.add("runscript", {
	adminOnly = true,
	onRun = function(client, arguments)
		local id = arguments[1]
		if(id) then
			local success = PLUGIN:RunScript(id)
			if(success) then
				client:notify("Script successfully loaded.")
			else
				client:notify("No script found with ID " ..id.. ".")
			end
		else
			client:notify("No ID was specified.")
		end
	end
})

nut.command.add("endscript", {
	adminOnly = true,
	onRun = function(client, arguments)
		local id = arguments[1]
		if(id) then
			local success = PLUGIN:EndScript(id)
			if(success) then
				client:notify("Script successfully ended.")
			else
				client:notify("No script found with ID " ..id.. ".")
			end
		else
			client:notify("No ID was specified.")
		end
	end
})

if(SERVER) then
	concommand.Add("nut_mappresetprops", function(client, cmd)
		local entityString = ""
	
		for k, entity in pairs(ents.FindByClass("prop_physics")) do
			if(entity:MapCreationID() != -1) then continue end
			entityString = ""
		
			entityString = entityString.. "{\n"
			
			local class = entity:GetClass()
			entityString = entityString.. "\tclass = \"" ..class.. "\",\n"
			
			local model = entity:GetModel()
			if(model) then
				entityString = entityString.. "\tmodel = \"" ..model.. "\",\n"
			end
			
			local pos = entity:GetPos()
			entityString = entityString.. "\tpos = Vector("..pos.x.. "," ..pos.y.. "," ..pos.z.."),\n"
		
			local ang = entity:GetAngles()
			entityString = entityString.. "\tang = Angle(" ..ang.x.. "," ..ang.y.. "," ..ang.z.. "),\n"
		
			local physObj = entity:GetPhysicsObject()
			if(IsValid(physObj)) then
				if(!physObj:IsMotionEnabled()) then
					entityString = entityString.. "\tfreeze = true,\n"
				end
				
				if(physObj:IsAsleep()) then
					entityString = entityString.. "\tsleep = true,\n"
				end
			end
		
			entityString = entityString.. "},\n"
			
			print(entityString)
		end
	end)
	
	concommand.Add("nut_enthelper", function(client, cmd)
		local trace = client:GetEyeTrace()
		local entity = trace.Entity
		if(IsValid(entity)) then
			local class = entity:GetClass()
			print("class = \"" ..class.. "\",")
		
			local pos = entity:GetPos()
			local posString = "pos = Vector("..pos.x.. "," ..pos.y.. "," ..pos.z.."),"
			print(posString)
			
			local ang = entity:GetAngles()
			local angString = "ang = Angle(" ..ang.x.. "," ..ang.y.. "," ..ang.z.. "),"
			print(angString)
			
			local mapID = entity:MapCreationID()
			local mapIDString = "mapID = " ..mapID.. ","
			print(mapIDString)
			
			local name = entity:GetName()
			if(name) then
				local nameString = "name = " ..name.. ","
				print(nameString)
			end
			
			if(class == "prop_physics") then
				local model = entity:GetModel()
				local modelString = "model = \"" ..model.. "\","
				print(modelString)
			end
		end
	end)
	
	concommand.Add("nut_poshelper", function(client, cmd)
		local pos = client:GetPos()
			
		print("Vector(" ..pos.x.. "," ..pos.y.. "," ..pos.z.. ")")
	end)
	
	--this is one i edit when i need something specific
	concommand.Add("nut_temphelper", function(client, cmd)
		local temp = {}
		for k, v in ipairs(ents.FindByClass("nut_combat_aber_faceless")) do
			local class = v:GetClass()
			local pos = v:GetPos()
			local ang = v:GetAngles()

			temp[#temp+1] = {
				"class = \"" ..class.. "\",",
				"pos = Vector("..pos.x.. "," ..pos.y.. "," ..pos.z.."),",
				"ang = Angle("..ang.x.. "," ..ang.y.. "," ..ang.z.."),",
			}
		end
		
		for k, v in pairs(temp) do
			print("{")
			print("\t"..v[1])
			print("\t"..v[2])
			print("\t"..v[3])
			print("},")
		end
			
		--print("Vector(" ..pos.x.. "," ..pos.y.. "," ..pos.z.. ")")
	end)
	
	--prints all the buttons on the map
	concommand.Add("nut_buttonhelper", function(client, cmd)
		local temp = {}
		for k, v in ipairs(ents.FindByClass("func_button")) do
			local class = v:GetClass()
			local pos = v:GetPos()
			local name = v:GetName()
			local mapID = v:MapCreationID()

			temp[#temp+1] = {
				"class = \"" ..class.. "\",",
				"pos = Vector("..pos.x.. "," ..pos.y.. "," ..pos.z.."),",
				"name = " ..name.. ",",
				"mapID = " ..mapID.. ",",
			}
		end
		
		for k, v in pairs(temp) do
			print("{")
			
			for k, v in pairs(v) do
				print("\t"..v)
			end
			
			print("},")
		end
			
		--print("Vector(" ..pos.x.. "," ..pos.y.. "," ..pos.z.. ")")
	end)
	
	concommand.Add("nut_mapenthelper", function(client, cmd)
		local doorString = ""
		local doorData = {}

		for k, entity in ipairs(ents.GetAll()) do 
			if(entity:MapCreationID() != -1) then
				print(k, entity)
			end
		end
	end)
end


if(CLIENT) then
	--table to hold all of the entities that are supposed to have halos
	PLUGIN.Halos = PLUGIN.Halos or {}

	netstream.Hook("nut_AddHalo", function(index, test)
		table.insert(PLUGIN.Halos, index)
	end)
	
	netstream.Hook("nut_RemoveHalo", function(index)
		table.RemoveByValue(PLUGIN.Halos, index)
	end)

	function PLUGIN:PreDrawHalos()
		for _, index in ipairs(PLUGIN.Halos) do
			local entity = ents.GetByIndex(index)
		
			if(!IsValid(entity)) then 
				--table.RemoveByValue(PLUGIN.Halos, entity) 
				continue 
			end

			--data for what kind of halo to draw
			local haloData = entity:getNetVar("haloData")
			if(haloData) then
				halo.Add({entity}, haloData.color or Color(255,255,255), haloData.blurX or 1, haloData.blurY or 1, haloData.passes or 1, haloData.additive, haloData.ignoreZ)
			end
		end
	end
	
	local client, w, h, ft, clmp
	local tSizeX
	local tSizeY
	local fade
	local fade2
	local fadeout
	local curTime
	
	w, h = ScrW(), ScrH()

	function PLUGIN:HUDPaint()
		client = LocalPlayer()
		ft = FrameTime()
		curTime = CurTime()

		local msg = client:getNetVar("scriptedMsg")
		if(msg) then
			local start = msg.start
			local duration = msg.duration or 2
			local color = msg.color or Color(255,255,255)
			local text = msg.text
		
			if(!fade) then
				fade = 255
			end
		
			if(fade2 != 255 and !fadeout) then
				local fraction = (curTime - start) / (duration * 0.25)
				fraction = math.Clamp(fraction, 0, 1)
				fade2 = Lerp(fraction, -100, 255)
			else
				fadeout = true
				
				local fraction2 = (curTime - (start + duration*0.5)) / (duration * 0.5)
				fraction2 = math.Clamp(fraction2, 0, 1)
				fade = Lerp(fraction2, 255, 0)
				fade2 = Lerp(fraction2, 400, 0)
			end
			
			local textLines = nut.util.wrapText(text, ScrW()*0.8, "nutTitleFont")
			
			--display text at center
			surface.SetFont("nutTitleFont")
			surface.SetTextColor(color.r, color.g, color.b, fade2)
			
			for lineNum, text in pairs(textLines) do
				tSizeX, tSizeY = surface.GetTextSize(text)
				surface.SetTextPos(w*0.5 - tSizeX*0.5, h*0.3 - tSizeY*0.5 + tSizeY*(lineNum-1))
				surface.DrawText(text)
			end

			--timer
			if(curTime > start + duration) then
				fade = nil
				fade2 = nil
				fadeout = nil
			end
		end
	end
end