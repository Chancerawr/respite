local PLUGIN = PLUGIN
PLUGIN.name = "Combat"
PLUGIN.author = "Chancer"
PLUGIN.desc = "A combat system based off of stats and rolling. Inspired by CWPNP."

local CHATCOLOR_MELEE = Color(160, 95, 95)
local CHATCOLOR_RANGED = Color(100, 110, 150)
local CHATCOLOR_REACT = Color(110, 150, 110)
local CHATCOLOR_GRAZE = Color(150, 150, 75)
local CHATCOLOR_RESIST = Color(140, 125, 125)
local CHATCOLOR_SPECIAL = Color(80, 150, 150)
local COMBAT_FONT = "nutChatFontCombat"

nut.config.add("startingPoints", 25, "How many attributes a player can distribute in character creation.", nil, {
	data = {min = 1, max = 2000},
	category = "Combat"
})

--potential parts to hit with random shots
local bParts = {
	{ --head/neck
		"Skull", 
		"Left Eye", 
		"Right Eye", 
		"Nose",
		"Face",
		"Left Ear",
		"Right Ear",
		"Jaw",
		
		"Neck", 
		"Neck Flesh", 
		"Larynx", 
		"Trachea"
	},
	
	{ --shoulders
		"Left Shoulder", 
		"Left Shoulder Socket", 
		"Left Scapula",
		"Right Shoulder", 
		"Right Shoulder Socket",
		"Right Scapula"
	}, 
	
	{ --arms
		"Left Upper Arm Bone", 
		"Left Upper Arm Flesh", 
		"Left Elbow",  
		"Left Forearm Flesh",
		"Left Forearm Bone",
		"Left Hand",
		
		"Right Upper Arm Bone", 
		"Right Upper Arm Flesh", 
		"Right Elbow",
		"Right Forearm Flesh",
		"Right Forearm Bone",
		"Right Hand",
		
		"Weapon"
	},
	
	{ --torso/chest
		"Heart",
		"Left Lung",
		"Left Upper Chest Rib",
		"Left Lower Chest Rib",
		"Right Lung",
		"Right Upper Chest Rib",
		"Right Lower Chest Rib",
		"Liver",
		"Left Kidney",
		"Right Kidney",
		"Stomach",
		"Spleen",
		"Pancreas",
		"Large Intestine",
		"Small Intestine",
		
		"Upper Chest Spine",
		"Lower Chest Spine",
		"Abdomen Spine"
	},

	{ --hip
		"Left Pelvis",
		"Center Pelvis",
		"Right Pelvis",
		"Left Hip",
		"Left Hip Socket",
		"Right Hip",
		"Right Hip Socket",
		"Groin"
	},

	{ --legs
		"Left Upper Leg Flesh",
		"Left Upper Leg Femur",
		"Left Knee",
		"Left Shin Flesh",
		"Left Tibia",
		"Left Ankle",
		"Left Foot",
		
		"Right Upper Leg Flesh",
		"Right Upper Leg Femur",
		"Right Knee",
		"Right Shin Flesh",
		"Right Tibia",
		"Right Ankle",
		"Right Foot"
	}
}

function PLUGIN:getRandomBpart()
	local part = table.Random(table.Random(bParts))
	
	return part
end
	
local function traitModify(client, command, rolled)
	local char = client:getChar()
	local charTraits = char:getData("traits", {}) --the traits the character has
	local traits = TRAITS.traits --data for all traits
	
	if(charTraits) then 
		for k, v in pairs(charTraits) do --go through all of char's traits
			local traitData = traits[k] --the actual info of the trait
			if(traitData and traitData.modifier and traitData.modifier[command]) then --if the trait has a modifier for this command
				rolled = rolled * traitData.modifier[command] --modify it
			end
		end
	end
	
	return rolled
end
	
local function critModify(client, char)
	local charTraits = char:getData("traits", {}) --the traits the character has
	local traits = TRAITS.traits --data for all traits
	
	local critChance = char:getAttrib("luck", 0) * 2 + 15
	local critMult = (1.5 + char:getAttrib("luck", 0) * 0.04)	
	local critFail = 5
	
	if(charTraits) then 
		for k, v in pairs(charTraits) do --go through all of char's traits
			local traitData = traits[k] --the actual info of the trait
			if(traitData) then --if the trait has a modifier for this command
				if(traitData.critMult) then
					critMult = traitData.critMult(client, char, critMult)
				end
				
				if(traitData.critChance) then
					critChance = traitData.critChance(client, char, critChance)
				end			
				
				if(traitData.critFail) then
					critFail = traitData.critFail(client, char, critFail)
				end
			end
		end
	end
	
	return critChance, critMult, critFail
end

local function critCalc(client, char)
	local crit = math.random(1, 1000)
	local critmsg = ""
	local critChance, critMult, critFail = critModify(client, char)
	
	if (crit <= critChance) then
		crit = critMult
		critmsg = " (Crit!)"
	else
		if(math.random(1,100) <= critFail) then
			crit = 0
			critmsg = "(Fail!)"
		else
			crit = 1
		end
	end
	
	return crit, critmsg
end

local function rollHandle(client, command, noPrint)
	local comTable = CMBT.commands[command]
	local char = client:getChar()
	
	local part
	local crit, critmsg = 1, ""
	
	local base = 0
	for k, v in pairs(comTable.stats) do
		base = base + char:getAttrib(k, 0) * v
	end
	
	local attribs = {}
	for k, v in pairs(nut.attribs.list) do
		attribs[k] = char:getAttrib(k, 0)
	end
	
	if(base < 0) then
		base = 0
	end
	
	--generates 1 or more rolls based on command data
	local rolls = comTable.rolls(base, attribs)
	for k, roll in pairs(rolls) do
		roll = roll * comTable.mult
		roll = traitModify(client, command, roll)
		
		if(comTable.parts) then
			part = PLUGIN:getRandomBpart()
		end
		
		if(!comTable.noCrit) then
			crit, critmsg = critCalc(client, char)
			roll = roll * crit
		end
		
		if(!noPrint) then
			if(!comTable.print) then	
				--detects the currently held weapon and (hopefully) the item it's associated with
				local weapon = ""
				if(comTable.category == "melee" or comTable.category == "firearms") then
					if(IsValid(client:GetActiveWeapon())) then
						local curWeapon = client:GetActiveWeapon()
						if(curWeapon:GetClass() != "nut_hands" and curWeapon != "nut_keys") then
							local items = char:getInv():getItems()
							for k, v in pairs(items) do
								if(v.isWeapon and curWeapon:GetClass() == v.class and v:getData("equip", nil)) then
									if(v.weaponCategory == "melee") then
										weapon = " (" ..v:getName().. ")"
									else
										weapon = " (" ..v:getName().. ")" .. " ["..curWeapon:Clip1().. "|" ..curWeapon:GetMaxClip1().. "]"
									end
								end
							end
						end
					end
				end
			
				if(!part) then
					nut.log.addRaw(client:Name().." rolled \""..roll.."\".", 2)
					nut.chat.send(client, comTable.category, "has rolled " ..roll..critmsg.. " for " ..comTable.stringArt..comTable.attackString.. "." ..weapon)
				else
					nut.log.addRaw(client:Name().." has rolled \""..roll .." ".. part.."\".", 2)
					nut.chat.send(client, comTable.category, "has rolled " ..roll..critmsg.. " for " ..comTable.stringArt..comTable.attackString.. " at target's " ..part.. "." .. weapon)
				end
			else
				comTable.print(client, roll, part, critmsg)
			end
		end
	end
	
	return rolls
end
	
CMBT = {}
CMBT.commands = {}
function CMBT:Register( tbl )
	self.commands[ tbl.uid ] = tbl
	
	--sets up the nutscript chat commands
	nut.command.add(tbl.uid, {
		onRun = function(client, arguments)
			if(tbl.trait and !hasTrait(client, tbl.trait)) then
				client:notify("You do not have the required trait.")
				return false
			end
		
			local entity = client:GetEyeTrace().Entity
			if (IsValid(entity) and entity.combat and tbl.category != "react") then
				local rollA = rollHandle(client, tbl.uid, true)
				entity:reaction(client, rollA, tbl.uid, tbl.attackString, true)
			else
				rollHandle(client, tbl.uid)
			end
		end
	})
end

function CMBT:GetAll()
	return self.commands
end
	
--chat for colors and formatting.
nut.chat.register("melee", {
	format = "%s %s",
	color = CHATCOLOR_MELEE,
	filter = "actions",
	font = COMBAT_FONT,
	onCanHear = nut.config.get("chatRange", 280) * 4,
	deadCanChat = true
})

nut.chat.register("react", { --reaction roll
	format = "%s %s",
	color = CHATCOLOR_REACT,
	filter = "actions",
	font = COMBAT_FONT,
	onCanHear = nut.config.get("chatRange", 280) * 4,
	deadCanChat = true
})

nut.chat.register("graze", { --reaction roll
	format = "%s %s",
	color = CHATCOLOR_GRAZE,
	filter = "actions",
	font = COMBAT_FONT,
	onCanHear = nut.config.get("chatRange", 280) * 4,
	deadCanChat = true
})

nut.chat.register("resist", {
	format = "%s %s",
	color = CHATCOLOR_RESIST,
	filter = "actions",
	font = COMBAT_FONT,
	onCanHear = nut.config.get("chatRange", 280) * 4,
	deadCanChat = true
})
	
nut.chat.register("firearms", {
	format = "%s %s",
	--most of the formatting is handled by roll command.
	color = CHATCOLOR_RANGED,
	filter = "actions",
	font = COMBAT_FONT,
	--onCanHear = nut.config.get("chatRange", 280) * 4,
	deadCanChat = true
})	

nut.chat.register("special", {
	format = "%s %s",
	color = CHATCOLOR_SPECIAL,
	filter = "actions",
	font = COMBAT_FONT,
	onCanHear = nut.config.get("chatRange", 280) * 4,
	deadCanChat = true
})

nut.chat.register("firearmsburst", {
	format = "%s has rolled %s for a burst fire shot.",
	color = CHATCOLOR_RANGED,
	filter = "actions",
	font = COMBAT_FONT,
	onCanHear = nut.config.get("chatRange", 280) * 4,
	deadCanChat = true
})

nut.chat.register("firearmsburstaimed", {
	format = "%s has rolled %s for an aimed burst fire shot.",
	color = CHATCOLOR_RANGED,
	filter = "actions",
	font = COMBAT_FONT,
	onCanHear = nut.config.get("chatRange", 280) * 4,
	deadCanChat = true
})

nut.chat.register("part", {
	format = "%s's projectile flies at the target's %s.",
	color = CHATCOLOR_RANGED,
	filter = "actions",
	font = COMBAT_FONT,
	onCanHear = nut.config.get("chatRange", 280) * 4,
	deadCanChat = true
})

nut.chat.register("partb", {
	format = "%s's burst shot flies at the target's %s.",
	color = CHATCOLOR_RANGED,
	filter = "actions",
	font = COMBAT_FONT,
	onCanHear = nut.config.get("chatRange", 280) * 4,
	deadCanChat = true
})

nut.chat.register("scavenge", {
	format = "%s has rolled %s for scavenging.",
	color = CHATCOLOR_REACT,
	filter = "actions",
	font = COMBAT_FONT,
	onCanHear = nut.config.get("chatRange", 280) * 4,
	deadCanChat = true
})

--Bob has attempted to use an ability: genital strike, and rolled 69.
nut.chat.register("fortattack", {
	format = "%s has attempted to use an ability: %s.",
	color = Color(130,130,130),
	filter = "actions",
	font = COMBAT_FONT,
	onCanHear = nut.config.get("chatRange", 280) * 4,
	deadCanChat = true
})

--for mental attacks (hallucinations, panic, etc)
nut.command.add("fortattack", {
	syntax = "<string type>",
	onRun = function(client, arguments)
		--these rolls cannot crit
		local char = client:getChar()
		local rolled = ((char:getAttrib("fortitude", 0) * 0.6) + math.random(-10, 10))
		rolled = math.abs(rolled)-- this is probably bad
		
		rolled = traitModify(client, "fortattack", rolled) --trait modifier
		
		local ability = {
			confusion = 0,
			nostalgia = 0,
			panic = 0,
			headache = 0,
			whisper = 0,
			echo = 0,

			phase = 0.05,
			simple_weapon = 0.05,
			blight = 0.05,
			blight_blast = 0.05,
			blight_suicide = 0.05,
			direct = 0.05,

			hallucination = 0.1,
			suggestion = 0.1,
			migraine = 0.1,
			insanity = 0.1,
			enrage = 0.1,
			emotion = 0.1,
			sensory = 0.1,
			telekinesis = 0.1,
			conjure_firearm = 0.1,
			blight_chains = 0.1,
			blight_shockwave = 0.1,
			shadow_meld = 0.1,
			open_portal = 0.1,

			paralyze = 0.2,
			sleep = 0.2,
			illusions = 0.2,
			cloak = 0.2,
			teleport = 0.2,
			temperature = 0.2,
			lesser_shade = 0.2,
			darkness = 0.2,
			conjure_special = 0.2,
			
			betray = 0.4,
			regenerate = 0.4,
			smokescreen = 0.4,
			minor_shade = 0.4,
			lights_out = 0.4,
			possession = 0.4,
			haze = 0.4,
			open_respite = 0.4,

			reality_bend = 0.75,
			moderate_shade = 0.75,
			time_reversal = 0.75,
			shadow_plague = 0.75
		}
		
		local fancyStr = arguments[1]
		
		if(ability[arguments[1]]) then
			local fancyStr = arguments[1]
			fancyStr = string.gsub(fancyStr, "_", " ") --replaces _ with a space.
			fancyStr = string.upper(fancyStr) --capitalizes all of it
			fancyStr = "'" .. fancyStr .. "'" --puts apostrophes around it i guess
			
			rolled = tonumber(rolled) * (1 - tonumber(ability[arguments[1]]))
			rolled = fancyStr ..", and rolled ".. rolled
		end
		--Bob has attempted to use an ability: genital strike, and rolled 69
		nut.log.addRaw(client:Name().." rolled \""..rolled.."\"", 2)		
		nut.chat.send(client, "fortattack", rolled)
	end
})

--oh look it's this menu again big surprise
if(CLIENT) then
	netstream.Hook("ShowAttribs", function(client, attribs)
		local attribText = ""
		
		for k, v in pairs(attribs) do
			attribText = attribText .. nut.attribs.list[k].name .. ": " .. v .. "\n\n"
		end
	
		local attribMenu = vgui.Create("DFrame")
		attribMenu:SetSize( 500, 700 )
		attribMenu:Center()
		if(me) then
			attribMenu:SetTitle("Player Menu")
		else
			attribMenu:SetTitle(client:Name())
		end
		attribMenu:MakePopup();

		attribMenu.DS = vgui.Create( "DScrollPanel", attribMenu )
		attribMenu.DS:SetPos( 10, 50 )
		attribMenu.DS:SetSize( 500 - 10, 700 - 50 - 10 )
		function attribMenu.DS:Paint( w, h ) end
		
		attribMenu.B = vgui.Create( "DLabel", attribMenu.DS )
		attribMenu.B:SetPos( 0, 40 )
		attribMenu.B:SetFont( "nutSmallFont" )
		attribMenu.B:SetText( attribText )
		attribMenu.B:SetAutoStretchVertical( true )
		attribMenu.B:SetWrap( true )
		attribMenu.B:SetSize( 500 - 20, 10 )
		attribMenu.B:SetTextColor( Color( 255, 255, 255, 255 ) )
	end)
end


--stat prints
nut.command.add("chargetattribs", {
	adminOnly = true,
	syntax = "<string target>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		
		if(IsValid(target) and target:getChar()) then
			local attribs = target:getChar():getAttribs()
		
			netstream.Start(client, "ShowAttribs", target, attribs)
		end
	end
})

--stat print
nut.command.add("chargetattrib", {
	adminOnly = true,
	syntax = "<string name> <string type>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		if(IsValid(target) and target:getChar()) then
			local findAtt = arguments[2]
			local attribName
			for k, v in pairs(nut.attribs.list) do
				if (nut.util.stringMatches(L(v.name, client), findAtt) or nut.util.stringMatches(k, findAtt)) then
					attribName = k
				end
			end
			if(attribName) then
				local value = target:getChar():getAttrib(attribName, 0)
			
				client:notifyLocalized(target:Name() .." ".. findAtt .. ": " .. value)
			else
				client:notifyLocalized("Invalid Attribute")
			end
		end
	end
})

nut.command.add("train", {
	syntax = "<string attribute> <Roleplay training before using this>",
	onRun = function(client, arguments)
		local char = client:getChar()
		local findAtt = arguments[1]
		local attribName
		for k, v in pairs(nut.attribs.list) do
			if (nut.util.stringMatches(L(v.name, client), findAtt) or nut.util.stringMatches(k, findAtt)) then
				attribName = k
			end
		end
		
		if(attribName) then
			local lastTrain = char:getData("lastTrain")
			
			if(!lastTrain) then
				char:setData("lastTrain", 0)
				lastTrain = 0
			end
			
			local cooldown = math.abs(math.floor(char:getAttrib(attribName, 0) / 15)) + 1
			cooldown = math.Clamp(cooldown, 1, 7)
			
			if(lastTrain and math.abs(tonumber(lastTrain) - tonumber(os.date("%d"))) >= cooldown) then -- train once every 2 days.
				local value = char:getAttrib(attribName, 0)
				char:setData("lastTrain", os.date("%d"))
				char:updateAttrib(attribName, 1)
				nut.log.addRaw(client:Name().." trained \""..attribName.."\".", 2)	
				
				client:notify("You have trained your " .. findAtt .. ".")
				client:notify("You will be able to train again in " ..cooldown.. " days.")
			else
				local remaining = cooldown - (tonumber(lastTrain) - tonumber(os.date("%d")))
				client:notify("You cannot train for " ..remaining.. " day(s).")
				
				nut.log.addRaw(client:Name().." did not successfully train due to cooldown.", 2)	
			end
		else
			client:notifyLocalized("Invalid Attribute")
		end
	end
})

nut.chat.register("statcheck", {
	format = "%s %s.",
	color = CHATCOLOR_REACT,
	filter = "actions",
	font = COMBAT_FONT,
	onCanHear = nut.config.get("chatRange", 280) * 4,
	deadCanChat = true
})

--stat print
nut.command.add("statcheck", {
	syntax = "<string attribute>",
	onRun = function(client, arguments)
		if(IsValid(client) and client:getChar()) then
			local findAtt = arguments[1]
			local attribName
			for k, v in pairs(nut.attribs.list) do
				if (nut.util.stringMatches(L(v.name, client), findAtt) or nut.util.stringMatches(k, findAtt)) then
					attribName = k
				end
			end
			if(attribName) then
				local value = client:getChar():getAttrib(attribName, 0)
				local name = nut.attribs.list[attribName].name
		
				nut.chat.send(client, "statcheck", "has " .. value .. " " .. name)
			else
				client:notifyLocalized("Invalid Attribute")
			end
		end
	end
})

--starting attribute points
function PLUGIN:GetStartAttribPoints()
	return nut.config.get("startingPoints", 25)
end

nut.util.include("sh_centcommands.lua")
nut.util.include("sh_commands.lua")
nut.util.include("sh_scav.lua")
nut.util.include("sh_train.lua")


if(CLIENT) then
	--combat font
	surface.CreateFont("nutChatFontCombat", {
		font = "Verdana Italic",
		size = math.max(ScreenScale(7), 27),
		extended = true,
		weight = 200,
		italic = true
	})	
end