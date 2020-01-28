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
		["Skull"] = 2, 
		["Left Eye"] = 2, 
		["Right Eye"] = 2, 
		["Nose"] = 2,
		["Face"] = 4,
		["Left Ear"] = 2,
		["Right Ear"] = 2,
		["Jaw"] = 3,
		
		["Neck"] = 3, 
		["Neck Flesh"] = 4, 
		["Larynx"] = 2, 
		["Trachea"] = 2,
	},
	
	{ --shoulders
		["Left Shoulder"] = 3, 
		["Left Shoulder Socket"] = 1, 
		["Left Scapula"] = 2,
		["Right Shoulder"] = 3, 
		["Right Shoulder Socket"] = 1,
		["Right Scapula"] = 2,
	}, 
	
	{ --arms
		["Left Upper Arm Bone"] = 3, 
		["Left Upper Arm Flesh"] = 4, 
		["Left Elbow"] = 2,  
		["Left Forearm Bone"] = 2,
		["Left Forearm Flesh"] = 3,
		["Left Hand"] = 2,
		
		["Right Upper Arm Bone"] = 3, 
		["Right Upper Arm Flesh"] = 4, 
		["Right Elbow"] = 2,
		["Right Forearm Bone"] = 2,
		["Right Forearm Flesh"] = 3,
		["Right Hand"] = 2,
		
		["Weapon"] = 4,
	},
	
	{ --torso/chest
		["Heart"] = 1,
		["Left Lung"] = 2,
		["Left Upper Chest Rib"] = 2,
		["Left Lower Chest Rib"] = 2,
		["Right Lung"] = 2,
		["Right Upper Chest Rib"] = 2,
		["Right Lower Chest Rib"] = 2,
		["Liver"] = 2,
		["Left Kidney"] = 2,
		["Right Kidney"] = 2,
		["Stomach"] = 3,
		["Spleen"] = 2,
		["Pancreas"] = 2,
		["Large Intestine"] = 4,
		["Small Intestine"] = 3,
		
		["Upper Chest Spine"] = 1,
		["Lower Chest Spine"] = 1,
		["Abdomen Spine"] = 2,
	},

	{ --hip
		["Left Pelvis"] = 5,
		["Center Pelvis"] = 5,
		["Right Pelvis"] = 5,
		["Left Hip"] = 6,
		["Left Hip Socket"] = 4,
		["Right Hip"] = 6,
		["Right Hip Socket"] = 4,
		["Groin"] = 3,
	},

	{ --legs
		["Left Upper Leg Flesh"] = 6,
		["Left Upper Leg Femur"] = 6,
		["Left Lower Leg Flesh"] = 6,
		["Left Knee"] = 4,
		["Left Shin Flesh"] = 4,
		["Left Tibia"] = 2,
		["Left Ankle"] = 1,
		["Left Foot"] = 2,
		
		["Right Upper Leg Flesh"] = 6,
		["Right Upper Leg Femur"] = 6,
		["Right Lower Leg Flesh"] = 6,
		["Right Knee"] = 4,
		["Right Shin Flesh"] = 4,
		["Right Tibia"] = 2,
		["Right Ankle"] = 1,
		["Right Foot"] = 2,
	}
}

local function GetWeightedRandomKey( tab )
	local sum = 0

	for _, chance in pairs( tab ) do
		sum = sum + chance
	end

	local select = math.random() * sum

	for key, chance in pairs( tab ) do
		select = select - chance
		if select < 0 then return key end
	end
end

function PLUGIN:getRandomBpart()
	local part = GetWeightedRandomKey(table.Random(bParts))
	
	return part
end

local playerMeta = FindMetaTable("Player")

function playerMeta:getActions()
	local actions = {}

	if(CMBT.commands) then
		for k, command in pairs(CMBT.commands) do
			actions[#actions + 1] = {
				name = command.name or "Unnamed Action",
				--func = PLUGIN.attack,
				special = command.uid,
			}
		end
	end

	return actions
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
		
		roll = math.Round(roll, 3)
		
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
			if (IsValid(entity) and entity.combat and tbl.category != "react" and tbl.category != "resist") then
				local rollA = rollHandle(client, tbl.uid, true)
				entity:reaction(client, rollA, tbl.category, tbl.attackString, tbl.parts)
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
	onCanHear = nut.config.get("chatRange", 280) * 4,
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
	netstream.Hook("ShowAttribs", function(client, attribs, boosted)
		local attribText = ""
		
		for k, v in pairs(boosted or attribs) do
			local boostText = ""
			if(boosted and !table.IsEmpty(boosted)) then
				local bonus = (v - (attribs[k] or 0))
				boostText = boostText.. " (" ..(((bonus >= 0) and "+") or "")..bonus.. ")"
			end
		
			attribText = attribText .. nut.attribs.list[k].name .. ": " ..v..boostText.. "\n\n"
		end
	
		local attribMenu = vgui.Create("DFrame")
		attribMenu:SetSize( 500, 700 )
		attribMenu:Center()
		if(me) then
			attribMenu:SetTitle("Player Menu")
		else
			attribMenu:SetTitle(client:Name())
		end
		attribMenu:MakePopup()

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
			local char = target:getChar()

			local boosted = {}
		
			for k, v in pairs(nut.attribs.list) do
				boosted[k] = char:getAttrib(k)
			end
		
			local attribs = char:getAttribs()
		
			netstream.Start(client, "ShowAttribs", target, attribs, boosted)
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

if(SERVER) then
	function PLUGIN:SaveData()
		PLUGIN.savedEnts = {}
		
		for k, v in pairs(ents.GetAll()) do
			if(!IsValid(v)) then continue end
			if(!v.combat or !(v.save or v.saveKey)) then continue end

			local saved = {
				pos = v:GetPos(), 
				ang = v:GetAngles(), 
				class = v:GetClass(), 
				saveData = (v.getSaveData and v:getSaveData())
			}
			
			local key = (v.saveKey) or (#PLUGIN.savedEnts + 1)

			v.saveKey = key
			PLUGIN.savedEnts[key] = saved
		end
		
		self:setData(PLUGIN.savedEnts)
	end
	
	function PLUGIN:LoadData()
		PLUGIN.savedEnts = self:getData()
		
		for saveKey, info in pairs(PLUGIN.savedEnts) do
			local entity = ents.Create(info.class)
			if(IsValid(entity)) then
				entity:SetPos(info.pos)
				entity:SetAngles(info.ang)
				
				entity.saveKey = saveKey
				
				for k, v in pairs(info.saveData or {}) do
					if(k == "model") then
						entity.savedModel = v

						continue
					elseif(k == "attribs") then
						entity.savedAttribs = v
						
						continue
					elseif(k == "mat") then
						entity.savedMat = v
						
						continue
					elseif(k == "anim") then
						entity.savedAnim = v
					
						continue
					end
					
					entity:setNetVar(k, v)
				end
				
				entity:Spawn()
			else
				if(saveKey) then
					PLUGIN.savedEnts[saveKey] = nil
				end
			end
		end
	end
end

nut.command.add("centsave", {
	adminOnly = true,
	onRun = function(client, arguments)	
		local entity = client:GetEyeTrace().Entity --entity that we're looking at
		
		if (IsValid(entity) and entity.combat) then --makes sure it's a CEnt (Combat Entity)
			entity.save = true
			client:notify(entity:Name().. " successfully saved.")
		end
		
		client:notify("CEnt save data updated.")
		
		PLUGIN:SaveData()
	end
})

nut.command.add("centsaveall", {
	adminOnly = true,
	onRun = function(client, arguments)	
		local entity = client:GetEyeTrace().Entity --entity that we're looking at
		
		local count = 0
		for k, v in pairs(ents.GetAll()) do
			if(IsValid(v) and v.combat) then
				v.save = true
				count = count + 1 
			end
		end
		
		client:notify(count.. " CEnts successfully saved.")
		
		PLUGIN:SaveData()
	end
})

nut.util.include("sh_centcommands.lua")
nut.util.include("sh_commands.lua")
nut.util.include("sh_scav.lua")
nut.util.include("sh_train.lua")

if(CLIENT) then
	--combat font
	surface.CreateFont("nutChatFontCombat", {
		font = "Verdana Italic",
		size = math.max(ScreenScale(7), 25),
		extended = true,
		weight = 350,
		italic = true
	})	
end

if(SERVER) then
	local allowTypes = {
		["react"] = true,
	}

	--this is sort of like a listener type thing
	function PLUGIN:PlayerMessageSend(client, chatType, message, anonymous)
		--[[
		local incall = client:getNetVar("incall")
		if(incall) then
			if(allowTypes[chatType]) then
				print(client, chatType, message, anonymous)
			end
		end
		--]]
	end
end