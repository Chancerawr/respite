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

--function that determines how many attributes a player gets on character creation
function PLUGIN:Think()
	if(!SERVER) then return end

	if(PLUGIN.buffThink) then
		PLUGIN:buffThink()
	end
	
	if(PLUGIN.cdThink) then
		PLUGIN:cdThink()
	end
end

--used to select things with the cmover and turn swep
function PLUGIN:SetupMove(ply, mvd, cmd)
	local dragMins = ply.dragMins

	-- push attack
	if(dragMins) then
		local trace = ply:GetEyeTrace()
	
		ply.dragMaxs = trace.HitPos
	
		if(mvd:KeyReleased(IN_ATTACK)) then
			local command = ply.selectSwep

			if(IsValid(command)) then
				command:BoxSelect(ply.dragMins, ply.dragMaxs)
			end
			
			ply.dragMins = nil
			ply.dragMaxs = nil
			ply.selectSwep = nil
		elseif(mvd:KeyReleased(IN_ATTACK2)) then
			ply.dragMins = nil
			ply.dragMaxs = nil
			ply.selectSwep = nil
		end
	end
end