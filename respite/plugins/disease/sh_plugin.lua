local PLUGIN = PLUGIN
local playerMeta = FindMetaTable("Player")

PLUGIN.name = "Diseases"
PLUGIN.author = "Chancer"
PLUGIN.desc = "Always wear protection."

PLUGIN.thinkTime = 1800 --time between running disease functions
PLUGIN.chance = 10 --chance of a random disease happening

DISEASES = {}
DISEASES.diseases = {}
function DISEASES:Register( tbl )
	self.diseases[ tbl.uid ] = tbl
end

function DISEASES:GetAll()
	return self.diseases
end

local thinkTime = CurTime()

--the actual effects having a disease has on you, if you want to add a disease, pretty much all of it will be in this function.
function diseaseEffects(client, disease, diseaseT)		
	--local tPassed = (CurTime() - (math.abs(diseaseT))) --the time since infection
	local char = client:getChar()
	
	local disTable = DISEASES.diseases[disease] --disease table
	if(disTable) then --if the disease exists
		local iTime = char:getData(disease) --time of infection (could be used for phases, used for nothing atm)
		
		if(iTime) then
			--symptom chat printing
			
			if(disTable.phase) then --one phase
				timer.Simple(math.random(0, PLUGIN.thinkTime), --randomizes the time so multiple diseases don't print at once.
					function()
						local symptom = table.Random(disTable.phase)
					
						nut.chat.send(client, "body", symptom)
					end
				)
			else --multiple phases
				timer.Simple(math.random(0, PLUGIN.thinkTime), --randomizes the time so multiple diseases don't print at once.
					function()
						local phase = math.Round( (CurTime() - iTime)/disTable.phaseTime )
						phase = math.Clamp(phase, 0, table.Count(disTable.phases) - 1)
						
						local symptom = disTable.phases[phase]
						
						nut.chat.send(client, "body", symptom)
					end
				)
			end
		
			--contagion
			if(disTable.spreadRange or disTable.spreadChance) then --if the disease is contagious
				local players = player.GetAll()
				
				for k, v in pairs(players) do
					if(!v:getChar():getData(disease)) then --if the player does not have the disease
						table.remove(players, k) --removes player from the list
					end
				end
				
				for k, v in pairs(players) do
					for k2, infectee in pairs(ents.FindInSphere(v:GetPos(), disTable.spreadRange or 500)) do --finds all players around all infected players
						if(infectee:IsPlayer() and infectee != v) then --only want to infect players, and also not self.
							local roll = math.random(1,100)
							if(roll <= disTable.spreadChance) then --rolls to see if the disease spreads
								local char = infectee:getChar()
								if(char and !char:getData(disease)) then --only want to infect people who don't already have the disease.
									char:setData(disease, CurTime())
								end
							end
						end
					end
				end
			end
			
			--custom effects
			if(disTable.special) then
			
			end
		end
	end
end

if (SERVER) then

	--dont want diseases to go away on death right now
	--[[
	function PLUGIN:DoPlayerDeath( client )
		for k, v in pairs(DISEASES) do
			client:getChar():setData(v, 0) --if the player dies, set his diseases to 0.
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
		end
	end
end

-- command for easy body status updates
nut.chat.register("body", {
	onChatAdd = function(speaker, text)
		local color = nut.chat.classes.ic.onGetColor(speaker, text)
		chat.AddText(Color(120, 120, 170), "**"..text)
	end,
	onCanHear = 1,
	prefix = {"/body"},
	font = "nutChat",
	filter = "actions",
	deadCanChat = true
})

nut.command.add("diseaseclear", {
	adminOnly = true,
	syntax = "<string target>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1]) or client	

		if(target) then
			local char = target:getChar()
			for k, v in pairs(DISEASES.diseases) do
				char:setData(k, nil) --removes all diseases
			end
			
			client:notify(client:GetName() .. " has been purged of all diseases")
		end
	end
})

nut.command.add("diseaseinfect", {
	adminOnly = true,
	syntax = "<string target> <string disease>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1]) or client	
	
		if(target) then
			local char = target:getChar()
			char:setData(arguments[2], CurTime()) --gives the target a specified disease.
			client:notify(target:GetName() .. " has been afflicted with " .. arguments[2])
		end
	end
})

nut.util.include("sh_diseases.lua")