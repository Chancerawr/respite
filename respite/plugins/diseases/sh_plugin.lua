local PLUGIN = PLUGIN

PLUGIN.name = "Diseases"
PLUGIN.author = "Chancer"
PLUGIN.desc = "Always wear protection."

PLUGIN.chance = 1 --chance of a random disease happening every thinkTime

nut.config.add("diseaseThink", 600, "How often the think loop for the diseases runs.", nil, {
	data = {min = 1, max = 84600},
	category = "Disease"
})

DISEASES = {}
DISEASES.diseases = {}
function DISEASES:Register(tbl)
	self.diseases[tbl.uid] = tbl
end

function DISEASES:GetAll()
	return self.diseases
end

if(SERVER) then
	function PLUGIN:Think()
		if ((self.nextThink or 0) < CurTime()) then
			self.nextThink = CurTime() + nut.config.get("diseaseThink", 600)

			local players = player.GetAll()
			
			for k, client in pairs(players) do
				local char = client:getChar()
				if (!char) then continue end
				
				local disData = char:getData("diseases", {})
				for diseaseID, infectTime in pairs(disData) do --goes through each character's disease.
					if(IsValid(client)) then
						PLUGIN:diseaseEffects(client, diseaseID, infectTime)
					end
				end
			end
			
			--handles diseases being randomly given to people.
			if(math.random(1,1000) <= self.chance * 10) then
				local posDiseases = {}
			
				for k, disease in pairs(DISEASES.diseases) do
					if(disease.random) then --if the disease can be randomly caught for no reason.
						posDiseases[#posDiseases + 1] = disease.uid
					end
				end
			
				if(!table.IsEmpty(posDiseases)) then
					local infectee = table.Random(players) --random person infected
					
					if(infectee and infectee:canInfect()) then
						infectee:giveDisease(table.Random(posDiseases))
					end
				end
			end
		end
	end

	--the actual effects having a disease has on you, if you want to add a disease, pretty much all of it will be in this function.
	function PLUGIN:diseaseEffects(client, disease, diseaseT)
		local char = client:getChar()
	
		--this timer is so multiple disease actions don't all happen at the same time, it's stupid but i couldn't think of another simple way
		timer.Simple(math.random(0, nut.config.get("diseaseThink", 600)), function() 
			if(!IsValid(client)) then return false end --prevents errors from disconnected clients
			if(char != client:getChar()) then return false end --prevents errors from char swaps
			
			local disTable = DISEASES.diseases[disease] --disease table
			if(disTable) then --if the disease exists
				local disData = char:getData("diseases", {})
			
				--symptom running
				if((client[disTable.uid] or 0) < CurTime()) then --determined by previous symptom
					local sympRun = disTable.symptoms and table.Random(disTable.symptoms)
					if(sympRun) then
						--text to print
						if(sympRun.text and !noPrint) then
							if(istable(sympRun.text)) then
								nut.chat.send(client, "body", table.Random(sympRun.text))
							else
								nut.chat.send(client, "body", sympRun.text)
							end
						end
						
						--delay until next symptom
						if(sympRun.cd) then
							client[disTable.uid] = sympRun.cd + CurTime() 
						end
					
						--function to run
						if(sympRun.func) then
							sympRun.func(client)
						end
					end
				end
			
				if(disTable.duration) then
					local iTime = disData[disease] --time of infection
					
					if(CurTime() > iTime + disTable.duration) then
						client:removeDisease(disease)
					end
				end
				
				--handles infection spreading if the disease has the properties for it
				PLUGIN:infection(client, disTable) 
			end
		end)
	end
	
	--disease spreading
	function PLUGIN:infection(client, disTable)
		local infect = disTable.infect
		if(infect) then
			if(infect.spreadRange or infect.spreadChance) then --if the disease is contagious
				--finds all the infected people
				local players = player.GetAll()
				for k, v in pairs(players) do
					if(IsValid(v) and (v:GetMoveType() != MOVETYPE_NOCLIP or !v:hasDisease(disTable.uid))) then --checks if player is is a potential spreader of disease.
						table.remove(players, k) --removes player from the list
					end
				end
				
				--use everyone else
				for k, infected in pairs(players) do
					for k2, infectee in pairs(ents.FindInSphere(infected:GetPos(), infect.spreadRange or 500)) do --finds all players around all infected players
						if(infectee:IsPlayer() and infectee != infected and infectee:GetMoveType() != MOVETYPE_NOCLIP) then --only want to infect players, and also not self.
							local roll = math.random(1,100)
							if(roll <= infect.spreadChance) then --rolls to see if the disease spreads
								if(infectee:canInfect(disTable.uid)) then
									infectee:giveDisease(disTable.uid)
								end
							end
						end
					end
				end
			end
		end
	end	
	
	--[[
	function PLUGIN:DoPlayerDeath( client ) --clears diseases on death
		for k, v in pairs(DISEASES) do
			client:getChar():setData(v, nil) --if the player dies, set his diseases to 0.
		end
	end
	--]]

	function PLUGIN:PlayerLoadedChar(client)
		local char = client:getChar()
		
		local disData = char:getData("diseases", {})
		for k, v in pairs(disData) do
			if(v) then
				v = CurTime() --set disease at the start again, just a safety measure mostly.
				
				local disTable = DISEASES.diseases[k] or {}
				
				--for scaling debuffs/buffs
				if(disTable.buffScale) then
					for k2, v2 in pairs(disTable.buffScale) do			
						char:removeBoost(disTable.uid .. "s", k2) --this removal is so the boost doesn't accidentally consider itself
						char:addBoost(disTable.uid .. "s", k2, v2 * char:getAttrib(k2, 0))
					end
				end
				
				if(disTable.buff) then --reapply buffs/debuffs
					for k2, v2 in pairs(disTable.buff) do
						char:addBoost(disTable.uid, k2, v2)
					end
				end
			end
		end
	end
end

--finds disease from a partial string or id
local function diseaseFromName(name)
	local diseases = DISEASES.diseases
	
	if(diseases[name]) then
		return name
	end
	
	local name = string.lower(name)
	
	local disease
	for k, v in pairs(diseases) do
		if(string.lower(v.name) == string.lower(name)) then --exact name
			disease = k
			break	
		elseif(string.find(string.lower(v.name), string.lower(name))) then --partial name
			disease = k
		end
	end
	
	return disease
end

-- command for easy body status updates
nut.chat.register("body", {
	onChatAdd = function(speaker, text)
		local color = nut.chat.classes.ic.onGetColor(speaker, text)
		chat.AddText(Color(120, 120, 170), "**"..text)
	end,
	onCanHear = function(speaker, listener)
		if(speaker == listener) then
			return true
		else
			return false
		end
	end,
	font = "nutChatFontItalics",
	filter = "actions",
	deadCanChat = true
})

nut.command.add("diseaseadd", {
	adminOnly = true,
	syntax = "<string target> <string disease> <boolean noPrint>",
	onRun = function(client, arguments)
		if(!arguments[1] or !arguments[2]) then
			client:notify("Invalid arguments.")
		
			return false
		end
	
		local target = nut.command.findPlayer(client, arguments[1])	
		if(target) then
			local diseaseID = diseaseFromName(arguments[2])
			
			if(diseaseID) then
				target:giveDisease(diseaseID, arguments[3])
				
				local diseaseName = DISEASES.diseases[diseaseID].name
				client:notify((diseaseName or "Disease").. " successfully given to " ..target:Name().. ".")
			else
				client:notify("Invalid disease " ..arguments[2])
			end
		end
	end
})

nut.command.add("diseaseremove", {
	adminOnly = true,
	syntax = "<string target> <string disease> <boolean noPrint>",
	onRun = function(client, arguments)
		if(!arguments[1] or !arguments[2]) then
			client:notify("Invalid arguments.")
		
			return false
		end
	
		local target = nut.command.findPlayer(client, arguments[1])	
		if(target) then
			local diseaseID = diseaseFromName(arguments[2])
			
			if(diseaseID) then
				target:removeDisease(diseaseID, arguments[3])

				local diseaseName = DISEASES.diseases[diseaseID].name
				client:notify((diseaseName or "Disease").. " successfully removed from " ..target:Name().. ".")
			else
				client:notify("Invalid disease " ..arguments[2])
			end
		end
	end
})

if(CLIENT) then
	netstream.Hook("ShowDiseases", function(target, compress)
		local illnesses = util.JSONToTable(compress)
	
		local diseaseText = ""
		
		for k, v in pairs(illnesses or {}) do
			local disease = DISEASES.diseases[v]
			
			if(disease) then
				diseaseText = diseaseText .. disease.name .. ": " .. disease.desc .. "\n\n"
			end
		end
	
		local diseaseMenu = vgui.Create( "DFrame" )
		diseaseMenu:SetSize( 500, 700 )
		diseaseMenu:Center()

		diseaseMenu:SetTitle(target:Name())

		diseaseMenu:MakePopup()

		diseaseMenu.DS = vgui.Create( "DScrollPanel", diseaseMenu )
		diseaseMenu.DS:SetPos( 10, 50 )
		diseaseMenu.DS:SetSize( 500 - 10, 700 - 50 - 10 )
		function diseaseMenu.DS:Paint( w, h ) end
		
		diseaseMenu.B = vgui.Create( "DLabel", diseaseMenu.DS )
		diseaseMenu.B:SetPos( 0, 40 )
		diseaseMenu.B:SetFont( "nutSmallFont" )
		diseaseMenu.B:SetText( diseaseText )
		diseaseMenu.B:SetAutoStretchVertical( true )
		diseaseMenu.B:SetWrap( true )
		diseaseMenu.B:SetSize( 500 - 20, 10 )
		diseaseMenu.B:SetTextColor( Color( 255, 255, 255, 255 ) )
	end)
end

nut.command.add("diagnose", {
	onRun = function(client, arguments)
		if(!hasTrait(client, "diagnose")) then
			client:notify("You do not have the Pathologist trait.")
			return false
		end	
	
		local target = client:GetEyeTrace().Entity

		if(!IsValid(target) or !target:IsPlayer()) then
			target = client
		end

		local illnesses = {}
		
		for k, v in pairs (DISEASES.diseases) do
			if(target:hasDisease(v.uid)) then
				table.insert(illnesses, v.uid)
			end
		end
		
		local compress = util.TableToJSON(illnesses)
		
		netstream.Start(client, "ShowDiseases", target, compress)
	end
})

nut.command.add("diseaseall", {
	adminOnly = true,
	syntax = "<string target>",
	onRun = function(client, arguments)
		if(!arguments[1]) then
			client:notify("Specify a target.")
			return false
		end	
	
		local target = nut.command.findPlayer(client, arguments[1])	
		
		if(!IsValid(target)) then
			client:notify("Invalid target.")
			return false
		end

		local illnesses = {}
		
		for k, v in pairs (DISEASES.diseases) do
			if(target:hasDisease(v.uid)) then
				table.insert(illnesses, v.uid)
			end
		end
		
		local compress = util.TableToJSON(illnesses)
		
		netstream.Start(client, "ShowDiseases", target, compress)
	end
})

nut.util.include("sh_diseases.lua")
nut.util.include("sh_diseasetrait.lua")