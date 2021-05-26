local PLUGIN = PLUGIN
PLUGIN.name = "Health Adjusting Commands"
PLUGIN.author = "Chancer"
PLUGIN.desc = "Some simple commands that modify player HP."

local playerMeta = FindMetaTable("Player")

--just use a negative value to take away hp
function playerMeta:addHP(amount)
	local new = math.Clamp(self:Health() + amount, -100, self:GetMaxHealth())
	
	new = math.Round(new, 3)
	
	self:SetHealth(new)
	
	return new
end

nut.command.add("charsethp", {
	adminOnly = true,
	syntax = "<string target> <number value>",
	onRun = function(client, arguments)
		if(!arguments[1]) then
			client:notify("No target specified")
			return false
		end
	
		if(!arguments[2]) then
			client:notify("No HP specified")
			return false
		end
	
		local target = nut.command.findPlayer(client, arguments[1])
		if(IsValid(target) and target:getChar()) then	
			local new = math.Clamp(tonumber(arguments[2]), 0, target:GetMaxHealth())
			target:SetHealth(new)
			
			client:notify("Health is now " ..target:Health().. ".")
		end
	end
})

nut.command.add("charaddhp", {
	adminOnly = true,
	syntax = "<string target> <number health>",
	onRun = function(client, arguments)
		if(!arguments[1]) then
			client:notify("No target specified")
			return false
		end
		
		if(!arguments[2]) then
			client:notify("No amount specified")
			return false
		end
	
		local target = nut.command.findPlayer(client, arguments[1])
		if(IsValid(target) and target:getChar()) then	
			target:addHP(tonumber(arguments[2]))

			client:notify("Health is now " ..target:Health().. ".")
		end
	end
})

nut.command.add("charrestore", {
	adminOnly = true,
	syntax = "<string target>",
	onRun = function(client, arguments)
		if(!arguments[1]) then
			client:notify("No target specified")
			return false
		end
	
		local target = nut.command.findPlayer(client, arguments[1])
		if(IsValid(target) and target:getChar()) then	
			target:SetHealth("hp", target:GetMaxHealth())
			
			client:notify("Health successfully restored.")
		end
	end
})

nut.command.add("charrestoreall", {
	adminOnly = true,
	syntax = "<none>",
	onRun = function(client, arguments)
		local count = 0
	
		for k, target in pairs(player.GetAll()) do
			if(IsValid(target) and target:getChar()) then	
				target:SetHealth("hp", target:GetMaxHealth())

				count = count + 1
			end
		end
		
		client:notify(count.. " players successfully restored.")
	end
})