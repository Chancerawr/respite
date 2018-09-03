local PLUGIN = PLUGIN
local playerMeta = FindMetaTable("Player")

PLUGIN.name = "Diseases"
PLUGIN.author = "Chancer"
PLUGIN.desc = "Always wear protection."

PLUGIN.thinkTime = 1800 --time between running disease functions
PLUGIN.chance = 1 --chance of a random disease happening every thinkTime

DISEASES = {}
DISEASES.diseases = {}
function DISEASES:Register( tbl )
	self.diseases[ tbl.uid ] = tbl
end

function DISEASES:GetAll()
	return self.diseases
end

local thinkTime = CurTime()

local function canInfect(infectee, disease)
	local char = infectee:getChar()
	local mem = CurTime() - char:getData("memory_wrap", -14400)
	
	if(char and !char:getData(disease) and (mem > 14400 or mem < 0)) then --only want to infect people who don't already have the disease.
		char:setData("memory_wrap", nil)
		return true
	else
		return false
	end
end

--the actual effects having a disease has on you, if you want to add a disease, pretty much all of it will be in this function.
function diseaseEffects(client, disease, diseaseT)		
	--local tPassed = (CurTime() - (math.abs(diseaseT))) --the time since infection
	local char = client:getChar()
	
	local disTable = DISEASES.diseases[disease] --disease table
	if(disTable) then --if the disease exists
		local iTime = char:getData(disease) --time of infection
		
		if(iTime) then
			--symptom chat printing
			
			if(disTable.phase) then --one phase
				timer.Simple(math.random(0, PLUGIN.thinkTime), --randomizes the time so multiple diseases don't print at once.
					function()
						if(client:getChar():getData(disease) and IsValid(client)) then --makes sure they still have the disease
							local symptom = table.Random(disTable.phase)
						
							nut.chat.send(client, "body", symptom)
						end
					end
				)
			else --multiple phases
				timer.Simple(math.random(0, PLUGIN.thinkTime), --randomizes the time so multiple diseases don't print at once.
					function()
						if(client:getChar():getData(disease)) then --makes sure they still have the disease
							if(!client:GetPos()) then return end
						
							local phase = math.Round( (CurTime() - iTime)/disTable.phaseTime )
							phase = math.Clamp(phase, 0, table.Count(disTable.phases) - 1)
							
							local symptom = disTable.phases[phase]
							
							nut.chat.send(client, "body", symptom)
						end
					end
				)
			end
		
			--contagion
			if(disTable.spreadRange or disTable.spreadChance) then --if the disease is contagious
				local players = player.GetAll()
				
				for k, v in pairs(players) do
					if(v:getChar() and !v:getChar():getData(disease) or v:GetMoveType() != MOVETYPE_NOCLIP) then --if the player does not have the disease
						table.remove(players, k) --removes player from the list
					end
				end
				
				--use everyone else
				for k, v in pairs(players) do
					for k2, infectee in pairs(ents.FindInSphere(v:GetPos(), disTable.spreadRange or 500)) do --finds all players around all infected players
						if(infectee:IsPlayer() and infectee != v and infectee:GetMoveType() != MOVETYPE_NOCLIP) then --only want to infect players, and also not self.
							local roll = math.random(1,100)
							if(roll <= disTable.spreadChance) then --rolls to see if the disease spreads
								if(canInfect(infectee, disease)) then
									infectee:getChar():setData(disease, CurTime())
								end
							end
						end
					end
				end
			end
			
			if(disTable.duration) then
				if(CurTime() > iTime + disTable.duration) then
					char:setData(disease, nil)
					
					local cured = table.Random(disTable.cure)
						
					nut.chat.send(client, "body", cured)
				end
			end
			
			--custom effects
			if(disTable.special) then
				disTable.special(client)
			end
		end
	end
end

if (SERVER) then

	--dont want diseases to go away on death right now
	--[[
	function PLUGIN:DoPlayerDeath( client )
		for k, v in pairs(DISEASES) do
			client:getChar():setData(v, nil) --if the player dies, set his diseases to 0.
		end
	end
	--]]

	function PLUGIN:PlayerLoadedChar(client)
		for k, v in pairs(DISEASES.diseases) do
			local char = client:getChar()
			if(char:getData(v) != nil) then --if the player loads in after disconnecting with a disease,
				char:setData(v, CurTime()) --set his disease at the start again, just a safety measure mostly.
			end
		end
	end
	
	function PLUGIN:Think()
		if (thinkTime < CurTime()) then
			thinkTime = CurTime() + self.thinkTime
			for k, client in pairs(player.GetAll()) do
				local char = client:getChar()
			
				if (!char) then
					continue
				end
				
				--time of infection used to determine what happens to them based on the specific disease
				for k2, v in pairs(DISEASES.diseases) do 
					if(char:getData(k2)) then --they have the disease
						diseaseEffects(client, k2, v) --k2 is the disease id, v is the infection time.
					end
				end
			end
			
			if(math.random(1,1000) <= self.chance * 10) then
				local posDis = { --table of potential diseases to randomly get
					"dis_cold",
					"dis_flu"
				}
			
				local population = player.GetAll() --all players
				local infectee = table.Random(population) --random person infected
				
				infectee:getChar():setData(table.Random(posDis), CurTime())
			end
		end
	end
	
	function cureDisease(client, disease)
		local char = client:getChar()
		
		if(char:getData(disease)) then
			local disTable = DISEASES.diseases[disease]
			
			if(disTable.effectC) then
				disTable.effectC(client, char)
			end
			
			char:setData(disease, nil)

			local cured = table.Random(disTable.cure)			
			nut.chat.send(client, "body", cured)
		end
	end
end

-- command for easy body status updates
nut.chat.register("body", {
	onChatAdd = function(speaker, text)
		local color = nut.chat.classes.ic.onGetColor(speaker, text)
		chat.AddText(Color(120, 120, 170), "**"..text)
	end,
	onCanHear = 2,
	prefix = {"/body"},
	font = "nutChat",
	filter = "actions",
	deadCanChat = true
})

--[[
nut.command.add("diseaseclear", {
	adminOnly = true,
	syntax = "<string target> [this will clear literally everything, don't use this]",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1]) or client	

		if(target) then
			local char = target:getChar()
			for k, v in pairs(DISEASES.diseases) do
				char:setData(k, nil) --removes all diseases
			end
			
			client:notify(target:GetName() .. " has been purged of all diseases")
		end
	end
})
--]]

nut.command.add("diseaseremove", {
	adminOnly = true,
	syntax = "<string target> <string disease>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1]) or client	

		if(target) then
			local char = target:getChar()
			if(!char) then return end
		
			for k, v in pairs(DISEASES.diseases) do
				if(string.find(string.lower(v.name), string.lower(arguments[2]))) then --tries to find if their argument matches a trait.
					if(char:getData(v.uid, false)) then
						char:setData(v.uid, nil) --remove it
						client:notify("You removed " ..v.name.. " from " .. target:GetName())
					else
						client:notify(target:GetName() .. " does not have the " .. v.name .. " effect.")
					end
					
					break --only want the first one.
				end
			end
		end
	end
})

nut.command.add("diseaseadd", {
	adminOnly = true,
	syntax = "<string target> <string disease>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1]) or client	

		if(target) then
			local char = target:getChar()
			if(!char) then return end
		
			for k, v in pairs(DISEASES.diseases) do
				if(string.find(string.lower(v.name), string.lower(arguments[2]))) then --tries to find if their argument matches a trait.
					char:setData(v.uid, CurTime())
					client:notify("You gave " ..v.name.. " to " .. target:GetName())
					
					break --only want the first one.
				end
			end
		end
	end
})

nut.util.include("sh_diseases.lua")