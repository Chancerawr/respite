local PLUGIN = PLUGIN
PLUGIN.name = "Talking NPCs (Enhanced)"
PLUGIN.author = "Black Tea (NS 1.0), Neon (NS 1.1). Edited by Chancer."
PLUGIN.desc = "Adding talking NPCs."
PLUGIN.chatDelay = { min = .5, max = 1 }
PLUGIN.defaultDialogue = {
	npc = {
		["_start"] = "Hello.",
		["how"] = "Same old, same old.",
		["!quest"] = "Take a look.",
		["!vendor"] = "Take a look."
	},
	player = {
		["_quit"] = "Goodbye.",
		["how"] = "How is your day?",
		["!quest"] = "Quests",
		["!vendor"] = "Trade?"
	},
}
PLUGIN.defaultQuest = {
	npc = {
		["_start"] = ""
	},
	player = {
		["_quit"] = "Goodbye."
	},
}

--this is a thing used to give talkers uniqueIDs
PLUGIN.talkerUID = PLUGIN.talkerUID or 0

if (SERVER) then	
	local function applyGroups(entity, groups)
		for k, v in pairs(groups) do
			entity:SetBodygroup(1, groups[1] or 0)
			entity:SetBodygroup(2, groups[2] or 0)
			entity:SetBodygroup(3, groups[3] or 0)
			entity:SetBodygroup(4, groups[4] or 0)
			entity:SetBodygroup(5, groups[5] or 0)
			entity:SetBodygroup(6, groups[6] or 0)
		end
	end

	function PLUGIN:SaveData()
		PLUGIN:SaveTalkers()
	end

	function PLUGIN:SaveTalkers()
		local data = {}
		
		for k, v in ipairs(ents.FindByClass("nut_talker")) do
			if(IsValid(v)) then
				--only save ones with IDs just to be safe
				local saveName = v:getNetVar("ID")
				if(saveName) then
					PLUGIN:ExportTalker(v, saveName)
					
					data[saveName] = true
				end
			end
		end
			
		self:setData(data)
	end

	function PLUGIN:LoadTalkers()
		for k, v in ipairs(ents.FindByClass("nut_talker")) do
			v.nutIsSafe = true
			v:Remove()
		end
	
		for k, v in pairs(self:getData() or {}) do
			PLUGIN:ImportTalker(k)
		end
	end
	
	function PLUGIN:ExportTalker(entity, saveName)
		local talkerData = {
			ID = entity:getNetVar("ID", os.date("%m%d%Y%S")),
		
			pos = entity:GetPos(),
			angles = entity:GetAngles(),
			model = entity:GetModel(),
			material = entity:GetMaterial(),
			skin = entity:GetSkin(),
			groups = entity.groups,
			dialogue = entity:getNetVar("dialogue", entity.dialogue),
			quests = entity:getNetVar("quests", entity.quests),
			factiondata = entity:getNetVar("factiondata", entity.factiondata),
			classdata = entity:getNetVar("classdata", entity.classdata),
			name = entity:getNetVar("name", entity.name),
			desc = entity:getNetVar("desc", entity.desc),
			anim = entity:getNetVar("anim", entity.anim),
			
			--business stuff
			scale = entity:getNetVar("scale", entity.scale or 0.5),
			flag = entity:getNetVar("flag", entity.flag),
			items = entity.items or {},
			money = entity.money,
		}
	
		local path = "nutscript/"..SCHEMA.folder.."/talkers/"

		if(!file.Exists(path, "DATA")) then
			file.CreateDir(path)
		end

		local name = entity:getNetVar("name", entity.name)
		name = string.lower(saveName) or string.lower(name)
		file.Write(path..(saveName or name).. ".txt", util.TableToJSON(talkerData))
		
		return name
	end
	
	function PLUGIN:ImportTalker(entityName, pos)
		if(entityName) then
			local path = "nutscript/"..SCHEMA.folder.."/talkers/" ..entityName.. ".txt"

			local data = file.Read(path, "DATA")

			local talkerData = util.JSONToTable(data)
			if(!talkerData) then
				return false
			end
			
			local entity = ents.Create("nut_talker")
			
			entity:setNetVar("ID", talkerData.ID)
			
			entity:SetPos(pos or talkerData.pos)
			entity:SetAngles(talkerData.angles)
			entity:Spawn()
			entity:SetModel(talkerData.model)
			entity:SetMaterial(talkerData.material)
			entity:SetSkin(talkerData.skin or 0)
			entity:setNetVar("dialogue", talkerData.dialogue)
			entity:setNetVar("quests", talkerData.quests)
			entity:setNetVar("factiondata", talkerData.factions)
			entity:setNetVar("classdata", talkerData.classes)
			entity:setNetVar("name", talkerData.name)
			entity:setNetVar("desc", talkerData.desc)
			entity:setNetVar("anim", talkerData.anim)
			
			entity.items = talkerData.items or {}
			entity.money = talkerData.money
			entity:setNetVar("scale", talkerData.scale or 0.5)
			entity:setNetVar("flag", talkerData.flag)
			
			if(talkerData.groups) then
				applyGroups(entity, talkerData.groups)
			end
		end
	end
	
	--hacky solution to errors yeeting all data, just put it in a timer and it'll only screw itself over
	function PLUGIN:InitPostEntity()
		timer.Simple(30, function()
			PLUGIN:LoadTalkers()
		end)
	end
end

nut.command.add("talkerexport", {
	adminOnly = true,
	syntax = "<string target>",
	onRun = function(client, arguments)
		local target = client:GetEyeTrace().Entity --entity that we're looking at
		
		if(IsValid(target) and target:GetClass() == "nut_talker") then
			if(PLUGIN:ExportTalker(target)) then
				client:notify("Talker successfully exported.")
			end
		else
			client:notify("Look at a valid Talker.")
		end
	end
})

nut.command.add("talkerimport", {
	adminOnly = true,
	syntax = "<string target>",
	onRun = function(client, arguments)
		if(!arguments) then
			client:notify("Specify a Talker to import.")
			return false
		end

		local talkerName = string.lower(table.concat(arguments, " "))
		if(talkerName) then
			--the position to spawn it at
			local pos = client:GetEyeTraceNoCursor().HitPos + Vector(0, 0, 10)
		
			local talker = PLUGIN:ImportTalker(talkerName, pos)
			
			if(talker and IsValid(talker)) then
				local name = talker:getNetVar("name", "Talker")
			
				client:notify(name.. " loaded successfully.")
			else
				client:notify("No saved talker of that name.")
			end
		else
			client:notify("specify a talker name.")
		end
	end
})