local PLUGIN = PLUGIN
PLUGIN.name = "Weird Bodies"
PLUGIN.author = "Chancer"
PLUGIN.desc = "A weird body system, don't worry about it."

PLUGIN.parts = {
	["al"] = {"Left Arm", 50},
	["ar"] = {"Right Arm", 50},
	["ll"] = {"Left Leg", 75},
	["lr"] = {"Right Leg", 75},
	["t"] = {"Torso", 200},
	["el"] = {"Left Eye", 10},
	["er"] = {"Right Eye", 10},
	["zc"] = {"Circulatory System", 100},
	["zs"] = {"Skeletal System", 100},
	["h"] = {"Head", 100}
}

--determines which body part to apply the changes to.
--this is a big mess right now and ill probably make less shitty later
local function calculateSpread(parts, material)
	local part, id
	
	local percent = PLUGIN:calcPercent(parts)
	
	local potentialParts = {}

	--this is a disgusting mess, sorry about that.
	for k, v in pairs(PLUGIN.parts) do
		if(parts[k]) then --checks if the person has that part altered already.
			if(parts[k][1] >= v[2]) then --checks if it's maxed out, if it is we just skip it.
				continue
			
			elseif(parts[k][2] == material and parts[k][1] < v[2]) then --checks if the person has an incomplete part of the same material
				part, id = PLUGIN.parts[k], k --if they do, select it.

			end
		else
			if(k != "h") then --leave head out for last
				potentialParts[k] = v --adds it to the potential for random selection.
			end
		end
	end
	
	if(!part) then --if no selected viable part, we start on a new one.
		if(table.Count(potentialParts) > 0) then 
			part, id = table.Random(potentialParts) --choose a random part from our list of viable options

		else
			part, id = PLUGIN.parts["h"], "h" --head is always the last to go, so it's only started when everything else is gone.
		end
	end
	
	return part, id
end

function PLUGIN:partsAdd(client, amount, material)
	local char = client:getChar()
	local pTable = char:getData("parts", {})
	
	local randomPart, id = calculateSpread(pTable, material)
	
	pTable[id] = {math.Clamp((pTable[id] and pTable[id][1] or 0) + amount, 0, randomPart[2]), material}
	
	--pTable[id] = Amount, material.
	--sorry that it's different from the plugin table.
	
	char:setData("parts", pTable)
end

--calculates how much of a person's body is special
function PLUGIN:calcPercent(parts)
	local total = 0
	for k, v in pairs(self.parts) do
		total = total + v[2]
	end
	
	local total2 = 0
	for k, v in pairs(parts) do
		total2 = total2 + v[1]
	end
	
	return (total2 / total) * 100
end

nut.command.add("chargetpercent", {
	adminOnly = true,
	syntax = "<string target>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		
		if(IsValid(target) and target:getChar()) then
			client:notify(PLUGIN:calcPercent(target:getChar():getData("parts", {})).. " Percent.")
		end
	end
})

nut.command.add("charsetpart", {
	adminOnly = true,
	syntax = "<string target> <string part> <string material> <number percentage>",
	onRun = function(client, arguments)
		if(!arguments[1] or !arguments[2] or !arguments[3] or !arguments[4]) then
			client:notify("Invalid Arguments.")
			return false
		end
		
		local target = nut.command.findPlayer(client, arguments[1])
		
		if(IsValid(target) and target:getChar()) then
			local id
			for k, v in pairs(PLUGIN.parts) do
				if(string.find(string.lower(v[1]), string.lower(arguments[2]) or "Left Eye")) then
					id = k
				end
			end
		
			local materials = {
				"Blight",
				"Ichor"
			}
		
			local material
			for k, v in pairs(materials) do
				if(string.find(string.lower(v), string.lower(arguments[3]) or "ichor")) then
					material = v
				end
			end
			
			if(!id) then
				client:notify("Invalid Body Part")
				return false
			end
			
			if(!material) then
				client:notify("Invalid Material.")
				return false
			end
			
			local amount = arguments[4]
			if(!amount) then
				client:notify("Invalid Amount.")
				return false
			end
			
			local char = target:getChar()
			local pTable = char:getData("parts", {})
			
			pTable[id] = {(math.Clamp((PLUGIN.parts[id][2] * amount / 100), 0, PLUGIN.parts[id][2])), material}
			char:setData("parts", pTable)
			
			client:notify("Part has been set.")
		end
	end
})
nut.command.add("charaddichor", {
	adminOnly = true,
	syntax = "<string target> <number amount>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		
		if(IsValid(target) and target:getChar()) then
			PLUGIN:partsAdd(target, arguments[2] or 0, "Ichor")
		end
	end
})

nut.command.add("charaddblight", {
	adminOnly = true,
	syntax = "<string target> <number amount>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		
		if(IsValid(target) and target:getChar()) then
			PLUGIN:partsAdd(target, arguments[2] or 0, "Blight")
		end
	end
})

nut.command.add("charresetbody", {
	adminOnly = true,
	syntax = "<string target>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		
		if(IsValid(target) and target:getChar()) then
			target:getChar():setData("parts", nil)
		end
	end
})

nut.command.add("chargetbody", {
	adminOnly = true,
	syntax = "<string target>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		
		if(IsValid(target) and target:getChar()) then
			for k, v in pairs(target:getChar():getData("parts", {})) do
				client:notify(PLUGIN.parts[k][1].. ": " ..v[1].. " " ..v[2].. ".")
			end
		end
	end
})