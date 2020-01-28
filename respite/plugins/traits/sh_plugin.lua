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
	timer.Simple(0.5, function()
		local traitData = character:getData("traits", {})
		local traitItems = {}
		
		local dumbIt = 0.5
	
		for k, v in pairs(traitData) do
			local items = TRAITS.traits[k].items
			if(items) then
				for k, v in pairs(items) do
					table.insert(traitItems, v)
				end
			end
			
			dumbIt = dumbIt + 1
			timer.Simple(dumbIt, function()
				if(TRAITS.traits[k].func) then
					TRAITS.traits[k].func(client, character)
				end
			end)
		end
		
		for k, v in pairs(traitItems) do
			dumbIt = dumbIt + 2
			timer.Simple(dumbIt, function()
				character:getInv():addSmart(v)
			end)
		end
	end)
end

if (SERVER) then
    function PLUGIN:PlayerLoadedChar(client)
        --this just makes sure everything is properly networked to clients.
        --kind of annoying and gross, but might not work properly otherwise.
        for k, v in pairs(player.GetAll()) do
            local char = v:getChar()
            if(char) then
                local traitData = char:getData("traits", {})
                char:setData("traits", traitData, false, player.GetAll())
            end
        end
    end
end

nut.command.add("traitadd", {
	adminOnly = true,
	syntax = "<string target> <string trait>",
	onRun = function(client, arguments)
		if(!arguments[2]) then
			client:notify("No trait specified.")
			return false
		end
	
		local target = nut.command.findPlayer(client, arguments[1]) or client	

		
		if(target) then
			local char = target:getChar()
			if(!char) then return end
		
			for k, v in pairs(TRAITS.traits) do
				if(string.find(string.lower(v.name), string.lower(arguments[2]))) then --tries to find if their argument matches a trait.
					local traitData = char:getData("traits", {})
					traitData[v.uid] = 1 --sets the actual trait to being enabled.
					
					char:setData("traits", traitData, false, player.GetAll())
					
					client:notify(" You have given " .. target:GetName() .. " the " .. v.name .. " trait.")
					
					break --only want the first one.
				end
			end
		end
	end
})

nut.command.add("traitremove", {
	adminOnly = true,
	syntax = "<string target> <string trait>",
	onRun = function(client, arguments)
		if(!arguments[2]) then
			client:notify("No trait specified.")
			return false
		end
	
		local target = nut.command.findPlayer(client, arguments[1]) or client	

		if(target) then
			local char = target:getChar()
			if(!char) then return end
		
			for k, v in pairs(TRAITS.traits) do
				if(string.find(string.lower(v.name), string.lower(arguments[2]))) then --tries to find if their argument matches a trait.
					local traitData = char:getData("traits", {})
					traitData[v.uid] = nil --sets the actual trait to nothing.
					
					char:setData("traits", traitData, false, player.GetAll())
					
					client:notify("You have removed the " .. v.name .. " trait from " .. target:GetName() .. ".")
					
					break --only want the first one.
				end
			end
		end
	end
})

nut.command.add("traitcheck", {
	adminOnly = true,
	syntax = "<string target> <string trait>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1]) or client	

		if(!arguments[2]) then
			client:notify("No trait specified.")
			return false
		end
		
		if(target) then
			local char = target:getChar()
			if(!char) then return end
		
			local traitData = char:getData("traits")
		
			for k, v in pairs(TRAITS.traits) do
				if(string.find(string.lower(v.name), string.lower(arguments[2]))) then --tries to find if their argument matches a trait.
					if(traitData[v.uid]) then
						client:notify(target:GetName() .. " has the " .. v.name .. " trait.")
					else
						client:notify(target:GetName() .. " does not have the " .. v.name .. " trait.")
					end
					
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
			if(traitData[trait]) then
				return true
			else
				return false
			end
		end
	end
	
	return false
end

function PLUGIN:GetStartTraitPoints()
	return 3
end

--for blood donor trait
nut.command.add("blood", {
	onRun = function(client, arguments)
		local char = client:getChar()
		
		if(!hasTrait(client, "donor")) then
			client:notifyLocalized("You do not have the Blood Donor Trait.")
			return false
		end

		local lastDust = char:getData("lastDonor", 0)
		
		if(math.abs(tonumber(lastDust) - tonumber(os.date("%d"))) >= 2) then -- once every 2 days.
			char:setData("lastDonor", os.date("%d"))
			nut.item.spawn("food_blood", client:getItemDropPos())
			client:notifyLocalized("You have extracted blood from yourself.")
		else
			client:notifyLocalized("You can only extract blood from yourself once every 2 days.")
		end
	end
})


nut.util.include("sh_trait.lua")
nut.util.include("sh_languages.lua")
nut.util.include("sh_curses.lua")

if(CLIENT) then
	netstream.Hook("ShowTraits", function(client)
		local traitText = ""
		
		for k, v in pairs(client:getChar():getData("traits", {})) do
			traitText = traitText ..TRAITS.traits[k].name.. ": " ..TRAITS.traits[k].desc.. "\n\n"
		end
	
		local traitMenu = vgui.Create("DFrame")
		traitMenu:SetSize(500, 700)
		traitMenu:Center()
		if(me) then
			traitMenu:SetTitle("Player Menu")
		else
			traitMenu:SetTitle(client:Name())
		end
		traitMenu:MakePopup()

		traitMenu.DS = vgui.Create("DScrollPanel", traitMenu)
		traitMenu.DS:SetPos(10, 50)
		traitMenu.DS:SetSize(500 - 10, 700 - 50 - 10)
		function traitMenu.DS:Paint(w, h) end
		
		traitMenu.B = vgui.Create("DLabel", traitMenu.DS)
		traitMenu.B:SetPos(0, 40)
		traitMenu.B:SetFont("nutSmallFont")
		traitMenu.B:SetText(traitText)
		traitMenu.B:SetAutoStretchVertical(true)
		traitMenu.B:SetWrap(true)
		traitMenu.B:SetSize(500 - 20, 10)
		traitMenu.B:SetTextColor(Color(255, 255, 255, 255))
	end)
end

nut.command.add("traits", {
	onRun = function(client, arguments)
		netstream.Start(client, "ShowTraits", client)
	end
})

nut.command.add("traitsadmin", {
	adminOnly = true,
	syntax = "<string target>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1]) or client	

		if(target) then
			netstream.Start(client, "ShowTraits", target)
		else
			client:notify("Invalid target.")
		end	
	end
})

function PLUGIN:CanDeleteChar( client, character )
    if( character.vars.traits["finedollar"] and character.vars.money < 200 ) then
        return true
    end
end

--adds the traitstep gui to the char creation menu
if(CLIENT) then
	function PLUGIN:ConfigureCharacterCreationSteps(panel)
		panel:addStep(vgui.Create("nutCharTraits"), 100)
	end
end

if(SERVER) then
	--for the "Ravenous" trait
	function PLUGIN:stomachOverwrite(item, client, char)
		if(!hasDisease(client, "trait_hunger")) then
			return false
		elseif(hasDisease(client, "trait_hunger")) then --if they have the hungering trait
			if(char:getData("stomach", 0) < 10) then
				char:setData("stomach", char:getData("stomach", 0) + 1)
				if(char:getData("stomach", 0) > 5) then
					client:notify("Your stomach painfully bulges, it might be a bad idea to continue eating.")
				end
				
				timer.Simple(item.duration, function() --needs to be independent of attribute since those don't stack for the same item.
					char:setData("stomach", char:getData("stomach", 0) - 1)
				end)
			else
				char:setData("stomach", char:getData("stomach", 0) + 1)
				timer.Simple(item.duration, function() --needs to be independent of attribute since those don't stack for the same item.
					char:setData("stomach", char:getData("stomach", 0) - 1)
				end)
				
				client:TakeDamage(char:getData("stomach", 0) * 2, client, client)
				nut.chat.send(client, "meclose's", "stomach bulges painfully, and partially ruptures.")
				
				if(!client:Alive()) then
					nut.log.addRaw(client:Name().. " has eaten themselves to death.")
				end
			end

			return 1
		end
	end
end