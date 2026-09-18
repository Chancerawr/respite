local PLUGIN = PLUGIN

local playerMeta = FindMetaTable("Player")

if(SERVER) then
	function PLUGIN:PlayerLoadedChar(client)
		PLUGIN:networkFollowers(client)
	end

	function playerMeta:getFollowers()
		local followers = self:getChar():getData("fllw", {})
		
		local followerTbl = {}
		
		for k, v in pairs(followers) do
			local path = "nutscript/"..SCHEMA.folder.."/followers/" ..k
			
			if(!file.Exists(path.. ".txt", "DATA")) then continue end
			
			local import = file.Read(path.. ".txt") or ""
			local importTbl = util.JSONToTable(import)

			importTbl.uid = k
			
			followerTbl[k] = importTbl
		end
		
		return followerTbl
	end

	function PLUGIN:getNextUID()
		local path = "nutscript/"..SCHEMA.folder.."/followers/"
		if(!file.Exists(path, "DATA")) then
			file.CreateDir("nutscript/"..SCHEMA.folder.."/followers/")
		end
	
		local files, directories = file.Find(path.. "/*", "DATA")

		return #files+1
	end

	function playerMeta:addFollower(data)
		local char = self:getChar()
		local uid = PLUGIN:getNextUID()

		if(data) then
			local followers = char:getData("fllw",{})
			followers[tonumber(uid)] = true
			
			char:setData("fllw", followers)
			
			local path = "nutscript/"..SCHEMA.folder.."/followers/" ..string.lower(uid).. ".txt"
			file.Write(path, util.TableToJSON(data))
			
			PLUGIN:networkFollowers(self)
		end
	end
	
	function playerMeta:removeFollower(uid)
		local char = self:getChar()

		if(uid) then
			local followers = char:getData("fllw",{})
			followers[tonumber(uid)] = nil
			char:setData("fllw", followers)
			
			PLUGIN:networkFollowers(self)
		end
	end
	
	function PLUGIN:networkFollowers(client)
		local followers = client:getFollowers()
		
		netstream.Start(client, "nut_followerReset", v)
		
		--delay so we dont overflow with net messages
		local delay = 0
		for k, v in pairs(followers) do
			timer.Simple(delay, function()
				netstream.Start(client, "nut_followerLoad", v)
			end)
			
			delay = delay + 1
		end
	end

	netstream.Hook("nut_followerSpawn", function(client, followerID)
		local path = "nutscript/"..SCHEMA.folder.."/followers/" ..followerID.. ".txt"
		
		local entity = client:getNetVar("follower" ..followerID)
		if(IsValid(entity)) then
			SafeRemoveEntity(entity)
		end
		
		if(!file.Exists(path, "DATA")) then
			return false
		end
		
		local import = file.Read(path) or ""
		local importTbl = util.JSONToTable(import)
		
		importTbl.pos = client:GetEyeTraceNoCursor().HitPos + Vector(0, 0, 10)
		importTbl.ang = Angle(0,0,0)
		
		local entity = PLUGIN:loadCEnt(importTbl)
		if(IsValid(entity)) then
			entity:SetCreator(client)
			client:setNetVar("follower" ..followerID, entity)
		end
		
		local cmover = client:HasWeapon("nut_cmover")
		if(!cmover) then
			client:Give("nut_cmover")
		end
	end)
	
	netstream.Hook("nut_followerRecall", function(client, followerID)
		local entity = client:getNetVar("follower" ..followerID)
		if(IsValid(entity)) then
			SafeRemoveEntity(entity)
		end
	end)
else
	function playerMeta:getFollowers()
		local followers = self:getChar():getData("fllw", {})
		
		local followerTbl = {}
		
		for k, v in pairs(followers) do
			local importTbl = PLUGIN.FOLLOWERS[k]
			
			followerTbl[k] = importTbl
		end
	
		return followerTbl
	end
	
	--clientside cache of networked follower data
	PLUGIN.FOLLOWERS = PLUGIN.FOLLOWERS or {}
	
	netstream.Hook("nut_followerReset", function()
		PLUGIN.FOLLOWERS = {}
	end)
	
	netstream.Hook("nut_followerLoad", function(followerData)
		if(!followerData) then return end
	
		local followerID = followerData.uid
		if(followerID) then
			PLUGIN.FOLLOWERS[followerID] = followerData
		end
	end)
end

nut.command.add("charfolloweradd", {
	adminOnly = true,
	syntax = "<string target>",
	onRun = function(client, arguments)
		local entity = client:GetEyeTrace().Entity
		if !(IsValid(entity) and entity.combat) then
			client:notify("You must be looking at a combat entity.")
			return false
		end
	
		if(!arguments[1]) then 
			client:notify("No target specified.")
			return
		end
	
		local target = nut.command.findPlayer(client, arguments[1])
		if(IsValid(target)) then
			local CEntData = {}
			CEntData.class = entity:GetClass()
			CEntData.saveData = entity:getSaveData() or {}
			
			target:addFollower(CEntData)
			
			client:notify(entity:Name().. " has been assigned as a follower to " ..target:Name().. ".")
		end
	end
})

nut.command.add("charfollowerremove", {
	adminOnly = true,
	syntax = "<string target> <numbers followerid>",
	onRun = function(client, arguments)
		if(!arguments[1]) then 
			client:notify("No target specified.")
			return
		end
		
		if(!arguments[2]) then 
			client:notify("No follower id specified.")
			return
		end
	
		local target = nut.command.findPlayer(client, arguments[1])
		if(IsValid(target)) then
			target:removeFollower(arguments[2])
			
			client:notify(target:Name().. " has had their follower removed.")
		end
	end
})