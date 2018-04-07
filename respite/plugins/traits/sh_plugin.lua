PLUGIN.name = "Character Traits"
PLUGIN.author = "Chancer"
PLUGIN.desc = "Something that makes you special."

nut.config.add("maxTraits", 5, "How many traits points you are given in character creation.", nil, {
	data = {min = 1, max = 84600},
	category = "Traits"
})

TRAITS = {}
TRAITS.traits = {}
function TRAITS:Register( tbl )
	self.traits[ tbl.uid ] = tbl
end

function TRAITS:GetAll()
	return self.traits
end

function PLUGIN:OnCharCreated(client, character)
	local traitData = character:getData("traits", {})
	local dumbIt = 1
	if(traitData) then
		for k, v in pairs(traitData) do
			dumbIt = dumbIt + 1
			timer.Simple(dumbIt, function()
				if(TRAITS.traits[k].func) then
					TRAITS.traits[k].func(client, character)
				end
			end)
		end
	end
end 

--these don't use hasTrait because that function requires the trait ID, these use the name of the Trait. Easier for admin use.
nut.command.add("traitadd", {
	adminOnly = true,
	syntax = "<string target> <select trait>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1]) or client	

		if(target) then
			local char = target:getChar()
			if(!char) then return end
		
			for k, v in pairs(TRAITS.traits) do
				if(string.find(string.lower(v.name), string.lower(arguments[2]))) then --tries to find if their argument matches a trait.
					local traitData = char:getData("traits", {})
					traitData[v.uid] = 1 --sets the actual trait to being enabled.
					
					char:setData("traits", traitData)
					
					client:notify(" You have given " .. target:GetName() .. " the " .. v.name .. " trait.")
					
					break --only want the first one.
				end
			end
		end
	end
})

nut.command.add("traitremove", {
	adminOnly = true,
	syntax = "<string target> <string disease>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1]) or client	

		if(target) then
			local char = target:getChar()
			if(!char) then return end
		
			for k, v in pairs(TRAITS.traits) do
				if(string.find(string.lower(v.name), string.lower(arguments[2]))) then --tries to find if their argument matches a trait.
					local traitData = char:getData("traits", {})
					traitData[v.uid] = nil --sets the actual trait to nothing.
					
					char:setData("traits", traitData)
					
					client:notify("You have removed the " .. v.name .. " trait from " .. target:GetName() .. ".")
					
					break --only want the first one.
				end
			end
		end
	end
})

nut.command.add("traitcheck", {
	adminOnly = true,
	syntax = "<string target> <string disease>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1]) or client	

		if(target) then
			local char = target:getChar()
			if(!char) then return end
		
			for k, v in pairs(TRAITS.traits) do
				if(string.find(string.lower(v.name), string.lower(arguments[2]))) then --tries to find if their argument matches a trait.
					client:notify(target:GetName() .. " has the " .. v.name .. " trait.")
					
					break --only want the first one.
				end
			end
		end
	end
})

--checks whether a character has a trait or not.
function hasTrait(client, trait) 
	local char = client:getChar()
	if(char) then
		local traitData = char:getData("traits")
		if(traitData) then
			return traitData[trait]
		end
	end
	return false
end

function PLUGIN:GetStartTraitPoints()
	return 2
end

nut.util.include("sh_trait.lua")
nut.util.include("sh_languages.lua")