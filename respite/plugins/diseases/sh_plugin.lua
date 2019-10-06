local PLUGIN = PLUGIN
local playerMeta = FindMetaTable("Player")

PLUGIN.name = "Diseases"
PLUGIN.author = "Chancer"
PLUGIN.desc = "Always wear protection."

PLUGIN.thinkTime = 3600 --time between running disease functions
PLUGIN.chance = 1 --chance of a random disease happening every thinkTime

DISEASES = {}
DISEASES.diseases = {}
function DISEASES:Register( tbl )
	self.diseases[ tbl.uid ] = tbl
end

function DISEASES:GetAll()
	return self.diseases
end

local function canInfect(infectee, disease)
	local char = infectee:getChar()
	if(!char) then return false end
	
	local mem = CurTime() - char:getData("memory_wrap", -14400)
	
	local infectious = {
		"dis_eyes",
		"dis_touch",
		"dis_mind"
	}
	
	--doesn't let them get infected if they have any sort of infectious disease.
	for k, v in pairs(infectious) do
		if(hasDisease(infectee, v)) then
			return false
		end
	end

	if(!hasDisease(infectee, disease) and (mem > 14400 or mem < 0)) then --only want to infect people who don't already have the disease.
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
		local disData = char:getData("diseases", {})
	
		local iTime = disData[disease] --time of infection
		
		if(iTime) then
			--symptom chat printing
			
			if(disTable.phase) then --no phase progression, random symptoms
				timer.Simple(math.random(0, PLUGIN.thinkTime), function()
					if(client and hasDisease(client, disease)) then
						local symptom = table.Random(disTable.phase)
						
						if(symptom) then
							nut.chat.send(client, "body", symptom) --symptom printing
						end
					end
				end)
			elseif(disTable.phases) then --progressive phases
				timer.Simple(math.random(0, PLUGIN.thinkTime), function()
					if(IsValid(client) and hasDisease(client, disease)) then --makes sure they still have the disease
						local phase = math.Round((CurTime() - iTime) / disTable.phaseTime)
						phase = math.Clamp(phase, 0, table.Count(disTable.phases) - 1)
							
						local symptom = disTable.phases[phase]
							
						nut.chat.send(client, "body", symptom)
					end
				end)
			end
		
			--contagion
			if(disTable.spreadRange or disTable.spreadChance) then --if the disease is contagious
				local players = player.GetAll()
				
				for k, v in pairs(players) do
					if(v and v:GetMoveType() != MOVETYPE_NOCLIP or !hasDisease(v, disease)) then --checks if player is is a potential spreader of disease.
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
									giveDisease(infectee, disease)
								end
							end
						end
					end
				end
			end
			
			if(disTable.duration) then
				if(CurTime() > iTime + disTable.duration) then
					cureDisease(client, disease)
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
				if(disTable.buff) then --reapply buffs/debuffs
					for k2, v2 in pairs(disTable.buff) do
						char:addBoost(disTable.uid, k2, v2)
					end
				end
				
				--for scaling debuffs/buffs
				if(disTable.buffScale) then
					for k2, v2 in pairs(disTable.buffScale) do			
						char:addBoost(disTable.uid .. "s", k2, v2 * char:getAttrib(k2, 0))
					end
				end
			end
		end
	end
	
	function PLUGIN:Think()	
		if(!self.nextThink) then self.nextThink = 0 end
	
		if (self.nextThink < CurTime()) then
			for k, client in pairs(player.GetAll()) do
				local char = client:getChar()
			
				if (!char) then
					continue
				end
				
				local disData = char:getData("diseases", {})
				for k2, v in pairs(disData) do --goes through each character's disease.
					diseaseEffects(client, k2, v) --k2 is disease id, v is time of infection.
				end
			end
			
			--handles diseases being randomly given to people.
			if(math.random(1,1000) <= self.chance * 10) then
				local posDiseases = {}
			
				for k, v in pairs(DISEASES.diseases) do
					if(v.randomChance) then --if the disease can be randomly caught for no reason.
						table.insert(posDiseases, v.uid)
					end
				end
			
				if(posDiseases != {}) then
					local population = player.GetAll() --all players
					local infectee = table.Random(population) --random person infected
					
					giveDisease(infectee, table.Random(posDiseases))
				end
			end
			
			self.nextThink = CurTime() + self.thinkTime
		end
	end
	
	function cureDisease(client, disease)
		local char = client:getChar()

		local disData = char:getData("diseases", {}) --get their diseases
		
		if(disData[disease]) then --check if they have the disease
			disData[disease] = nil --remove disease
			
			local disTable = DISEASES.diseases[disease]
			
			if(disTable.effectC) then --cure effect
				disTable.effectC(client, char)
			end
			
			if(disTable.cure) then --cure chat message
				local cured = table.Random(disTable.cure)			
				nut.chat.send(client, "body", cured)
			end
			
			--for straight +/- attribute debuffs
			if(disTable.buff) then
				for k, v in pairs(disTable.buff) do
					char:removeBoost(disTable.uid, k)
				end
			end
			
			--for scaling debuffs/buffs
			if(disTable.buffScale) then
				for k, v in pairs(disTable.buffScale) do			
					char:removeBoost(disTable.uid .. "s", k)
				end
			end
			
			char:setData("diseases", disData)
		end
	end
	
	function giveDisease(client, disease)
		if(!disease) then return false end
		
		local char = client:getChar()
		
		if(!char) then return false end
		
		local disData = char:getData("diseases", {})
		disData[disease] = CurTime()
		
		local disTable = DISEASES.diseases[disease]
		--for straight +/- attribute debuffs
		if(disTable.buff) then
			for k, v in pairs(disTable.buff) do
				char:addBoost(disTable.uid, k, v)
			end
		end
		
		--for scaling debuffs/buffs
		if(disTable.buffScale) then
			for k, v in pairs(disTable.buffScale) do			
				char:addBoost(disTable.uid .. "s", k, v * char:getAttrib(k, 0))
			end
		end
		
		char:setData("diseases", disData)
	end
	
	function hasDisease(client, disease)
		if(!client) then return false end
	
		local char = client:getChar()
		
		if(!char) then --cant have disease if you arent on a character.
			return false
		end
		
		local disData = char:getData("diseases", {})
		for k, v in pairs(disData) do
			if(k == disease) then
				return true
			end
		end
		
		return false
	end
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
	prefix = {"/body"},
	font = "nutChatFontItalics",
	filter = "actions",
	deadCanChat = true
})

nut.command.add("diseaseremove", {
	adminOnly = true,
	syntax = "<string target> <string disease>",
	onRun = function(client, arguments)
		if(!arguments[1] or !arguments[2]) then
			client:notify("Invalid arguments.")
		
			return false
		end
	
		local target = nut.command.findPlayer(client, arguments[1])	

		if(target) then
			local char = target:getChar()
			if(!char) then return end
		
			for k, v in pairs(DISEASES.diseases) do
				if(string.find(string.lower(v.name), string.lower(arguments[2]))) then --tries to find if their argument matches a trait.
					if(hasDisease(target, v.uid)) then
						cureDisease(target, v.uid)
						client:notify("You removed " ..v.name.. " from " .. target:GetName() .. ".")
					else
						client:notify("Target does not have this disease.")
					end

					return --only want the first one.
				end
			end
			
			client:notify("Invalid disease.")
		end
	end
})

nut.command.add("diseaseadd", {
	adminOnly = true,
	syntax = "<string target> <string disease>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1]) or client	

		if(target) then
			for k, v in pairs(DISEASES.diseases) do
				if(string.find(string.lower(v.name), string.lower(arguments[2]))) then --tries to find if their argument matches a trait.
					giveDisease(target, v.uid)
					client:notify("You gave " ..v.name.. " to " .. target:GetName())
					
					return --only want the first one.
				end
			end
			
			client:notify("Invalid disease.") --if we didnt find it
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
			if(hasDisease(target, v.uid)) then
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
			if(hasDisease(target, v.uid)) then
				table.insert(illnesses, v.uid)
			end
		end
		
		local compress = util.TableToJSON(illnesses)
		
		netstream.Start(client, "ShowDiseases", target, compress)
	end
})

nut.util.include("sh_diseases.lua")
nut.util.include("sh_diseasetrait.lua")