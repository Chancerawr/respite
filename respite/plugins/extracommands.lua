PLUGIN.name = "Extra Commands"
PLUGIN.author = "Luna"
PLUGIN.desc = "A few useful commands."

nut.command.add("fixpac", {
	syntax = "<No Input>",
	onRun = function(client, arguments)
	timer.Simple(0, function()
						if (IsValid(client)) then
						    client:ConCommand("pac_clear_parts")
						end
					end)
	timer.Simple(0.5, function()
						if (IsValid(client)) then
							client:ConCommand("pac_urlobj_clear_cache")
							client:ConCommand("pac_urltex_clear_cache")
						end
					end)
	timer.Simple(1.0, function()
						if (IsValid(client)) then				
							client:ConCommand("pac_restart")						
						end
					end)
	timer.Simple(1.5, function()
						if (IsValid(client)) then				
							client:ChatPrint("PAC has been successfully restarted. You might need to run this command twice!")							
						end
					end)
      end
})

-- nut.command.add("refreshfonts", {
	-- syntax = "<No Input>",
	-- onRun = function(client, arguments)
	-- RunConsoleCommand("fixchatplz")
	-- hook.Run("LoadFonts", nut.config.get("font"))
	-- client:ChatPrint("Fonts have been refreshed!")		
    -- end
-- })


nut.command.add("setnick", {
	syntax = "[String Nickname]",
	onRun = function(client, arguments)
		if (arguments[1]) then
			if (!string.find(client:Name(), "'")) then
				local name = string.Split(client:getChar():getName(), " ")
				local newName = name[1].." '"..arguments[1].."' "..name[2]
				
				client:getChar():setName(newName)
				client:ChatPrint("Your name is now "..newName..".")
			else
				local name = string.Split(client:getChar():getName(), " ")
				string.Split(client:getChar():getName(), " ")
				local newName = name[1].." '"..arguments[1].."' "..name[3]
				
				client:getChar():setName(newName)
				client:ChatPrint("Your name is now "..newName..".")
			end;
		else
			client:ChatPrint("You need to enter a nickname.")
		end;
	end;
})

nut.command.add("removenick", {
	syntax = "[No Input]",
	onRun = function(client, arguments)
		if (!string.find(client:Name(), "'")) then
			client:ChatPrint("No nickname was detected.")
		else
			local name = string.Split(client:getChar():getName(), " ")
			string.Split(client:getChar():getName(), " ")
			local newName = name[1].." "..name[3]
			
			client:getChar():setName(newName)
			client:ChatPrint("Your name is now "..newName..".")
		end;
	end;
})

nut.command.add("cleanitems", {
	adminOnly = true,
	onRun = function(client, arguments)

	for k, v in pairs(ents.FindByClass("nut_item")) do
		
		v:Remove()
		
	end;
		client:notify("All items have been cleaned up from the map.")
	end
})

nut.command.add("cleannpcs", {
	adminOnly = true,
	onRun = function(client, arguments)

	for k, v in pairs( ents.GetAll( ) ) do
	if IsValid( v ) and ( v:IsNPC() or baseclass.Get( v:GetClass() ).Base == 'base_nextbot' or baseclass.Get( v:GetClass() ).Base == 'nz_base' or  baseclass.Get( v:GetClass() ).Base == 'nz_risen' ) and !IsFriendEntityName( v:GetClass() ) then
		
		  v:Remove()
		
	   end
    end
	client:notify("All NPCs and Nextbots have been cleaned up from the map.")
	
	end
})

nut.command.add("spawnitem", {
	adminOnly = true,
	syntax = "<string item>",
	onRun = function(client, arguments)

		if (IsValid(client) and client:getChar()) then
			local uniqueID = arguments[1]:lower()

			if (!nut.item.list[uniqueID]) then
				for k, v in SortedPairs(nut.item.list) do
					if (nut.util.stringMatches(v.name, uniqueID)) then
						uniqueID = k

						break
					end
				end
			end

            local aimPos = client:GetEyeTraceNoCursor().HitPos 

            aimPos:Add(Vector(0, 0, 10))  

            nut.item.spawn(uniqueID, aimPos)
                        
		end
	end
})

nut.command.add("forums", {
    syntax = "<No Input>",
	onRun = function(client, arguments)
	 client:SendLua([[gui.OpenURL("http://spite.boards.net/")]])
	end
})

nut.command.add("content", {
    syntax = "<No Input>",
	onRun = function(client, arguments)
	client:SendLua([[gui.OpenURL("http://steamcommunity.com/sharedfiles/filedetails/?id=773495550")]])
	end
})