local PLUGIN = PLUGIN
PLUGIN.name = "Combat"
PLUGIN.author = "7192"
PLUGIN.desc = "A combat system with stats and rolling."

PLUGIN.savedEnts = PLUGIN.savedEnts or {}

local playerMeta = FindMetaTable("Player")

nut.config.add("startingPoints", 25, "How many attributes a player can distribute in character creation.", nil, {
	data = {min = 1, max = 2000},
	category = "Combat"
})

--starting attribute points in character creation
function PLUGIN:GetStartAttribPoints()
	return nut.config.get("startingPoints", 25)
end

--spawns player with the combat tool
function PLUGIN:PostPlayerLoadout(client)
	client:Give("nut_cswep")
end

--helper function that finds (initialized) actions based on partial strings
function PLUGIN:actionFind(partial)
	local action
	
	for k, v in pairs(ACTS.actions) do
		if(!v.uid) then continue end
		
		if(string.lower(v.uid) == string.lower(partial)) then
			return v
		elseif(string.find(string.lower(v.uid), string.lower(partial))) then
			action = v
		elseif(string.find(string.lower(v.name), string.lower(partial))) then
			action = v
		end
	end
	
	return action
end		