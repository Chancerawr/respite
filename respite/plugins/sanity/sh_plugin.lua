local playerMeta = FindMetaTable("Player")

local PLUGIN = PLUGIN
PLUGIN.name = "Sanity"
PLUGIN.author = " "
PLUGIN.desc = "You can go crazy."

nut.config.add("sanity", true, "Whether or not sanity is enabled.", nil, {
	category = "Sanity"
})

--10000 so we can avoid floating point hell
function playerMeta:GetMaxSanity()
	return 10000
end

function playerMeta:GetSanity()
	local char = self:getChar()
	
	local sanity
	
	if(char) then
		sanity = char:getData("sanity", self:GetMaxSanity())
	else
		sanity = 10000
	end

	return sanity
end

--return it as a 0 to 100
function playerMeta:GetSanityDisplay()
	local char = self:getChar()
	
	local sanity = self:getSanity()
	
	sanity = sanity * 0.01
	sanity = math.Round(sanity, 2)

	return sanity
end

function playerMeta:GetSanityPercent()
	local sanity = self:GetSanity()
	local max = self:GetMaxSanity()

	local percent = math.Round(sanity/max, 2)

	return percent
end

if(SERVER) then
	function playerMeta:SetSanity(amount)
		local char = self:getChar()
		
		if(isnumber(amount)) then
			char:setData("sanity", amount)
			
			return true
		end
	end

	function playerMeta:AddSanity(amount)
		local char = self:getChar()
		
		if(isnumber(amount)) then
			local sanity = self:GetSanity()
			sanity = math.Clamp(sanity+amount, 0, self:GetMaxSanity())
			
			return true
		end
	end
end

nut.command.add("charsetsanity", {
	adminOnly = true,
	syntax = "<string target> <number sanity>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1]) or client	

		if(target) then
			local sanity = tonumber(arguments[2])
			
			if(sanity) then
				local check = target:SetSanity(sanity)
				if(check) then
					client:notify(target:Name().. "'s sanity set to " ..sanity.. ".")
				else
					client:notify("Failed to set " ..target:Name().. "'s sanity.")
				end
			else
				client:notify("No sanity value specified.")
			end
		end
	end
})

nut.command.add("charaddsanity", {
	adminOnly = true,
	syntax = "<string target> <number sanity>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1]) or client	

		if(target) then
			local sanity = tonumber(arguments[2])
			
			if(sanity) then
				local check = target:AddSanity(sanity)
				if(check) then
					client:notify(target:Name().. "'s sanity set to " ..sanity.. ".")
				else
					client:notify("Failed to set " ..target:Name().. "'s sanity.")
				end
			else
				client:notify("No sanity value specified.")
			end
		end
	end
})