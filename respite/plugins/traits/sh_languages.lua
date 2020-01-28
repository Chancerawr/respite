local chatLangs = {
	["jap"] = "Japanese",
	["ita"] = "Italian",
	["spa"] = "Spanish",
	["chi"] = "Chinese",
	["ger"] = "German",
	["rus"] = "Russian",
	["por"] = "Portuguese",
	["hin"] = "Hindustani",
	["ara"] = "Arabic",
	["swe"] = "Swedish",
	["dan"] = "Danish",
	["fre"] = "French",
	["afr"] = "Afrikaans",
	["kor"] = "Korean",
	["fin"] = "Finnish",
	["pol"] = "Polish"
}

for k, v in pairs(chatLangs) do
	local vlower = string.lower(v)

	local TRAIT = {}
	TRAIT.uid = k
	TRAIT.name = v.. " Language"
	TRAIT.desc = "You can speak " ..v.. ".\nCommand: " .."/"..k
	TRAIT.category = "Language"
	TRAITS:Register(TRAIT)
	
	nut.chat.register(k, { --regular
		onCanSay =  function(speaker, text)
			local trait = hasTrait(speaker, k)
			if(trait) then
				return true
			else
				speaker:notify("You do not know that language.")
				return false
			end
		end,
		onChatAdd = function(speaker, text, anonymous)
			local speako = anonymous and "Someone" or hook.Run("GetDisplayedName", speaker, "ic") or (IsValid(speaker) and speaker:Name() or "Console")
			
			local texCol = nut.config.get("chatColor")
			
			if (LocalPlayer():GetEyeTrace().Entity == speaker) then
				texCol = nut.config.get("chatListenColor")
			end
			
			texCol = Color(texCol.r, texCol.g, texCol.b)
			
			local nameCol = Color(texCol.r + 30, texCol.g + 30, texCol.b + 30)
			
			if(LocalPlayer() == speaker) then
				local tempCol = nut.config.get("chatListenColor")
						
				texCol = Color(tempCol.r + 20, tempCol.b + 20, tempCol.g + 20)
				nameCol = Color(tempCol.r + 40, tempCol.b + 60, tempCol.g + 40)
			end

			if (hasTrait(LocalPlayer(), k)) then
				--chat.AddText(nut.config.get("chatColor"), speaker:getChar():getName()..' says in Japanese, "'..text..'"')
				chat.AddText(nameCol, speako, texCol, " says in "..v..", \""..text.."\"")
			else
				chat.AddText(nameCol, speako, texCol, " says something in " ..v.. ".")
			end
		end,
		onCanHear = nut.config.get("chatRange", 280),
		prefix = {"/"..k, "/"..vlower}
	})
	
	nut.chat.register(k.."w", { --whispering
		onCanSay =  function(speaker, text)
			local trait = hasTrait(speaker, k)
			if(trait) then
				return true
			else
				speaker:notify("You do not know that language.")
				return false
			end
		end,
		onChatAdd = function(speaker, text, anonymous)
			local speako = anonymous and "Someone" or hook.Run("GetDisplayedName", speaker, "ic") or (IsValid(speaker) and speaker:Name() or "Console")
			local texCol = nut.config.get("chatColor")
			if (LocalPlayer():GetEyeTrace().Entity == speaker) then
				texCol = nut.config.get("chatListenColor")
			end
			
			texCol = Color(texCol.r - 35, texCol.g - 35, texCol.b - 35)
			
			local nameCol = Color(texCol.r + 30, texCol.g + 30, texCol.b + 30)
			
			if(LocalPlayer() == speaker) then
				local tempCol = nut.config.get("chatListenColor")
						
				texCol = Color(tempCol.r - 15, tempCol.b - 15, tempCol.g - 15)
				nameCol = Color(tempCol.r + 40, tempCol.b + 60, tempCol.g + 40)
			end
		
			if (hasTrait(LocalPlayer(), k)) then
				--chat.AddText(nut.config.get("chatColor"), speaker:getChar():getName()..' says in Japanese, "'..text..'"')
				chat.AddText(nameCol, speako, texCol, " whispers in "..v..", \""..text.."\"")
			else
				chat.AddText(nameCol, speako, texCol, " whispers something in " ..v.. ".")
			end
		end,
		onCanHear = nut.config.get("chatRange", 280) * 0.25,
		prefix = {"/"..k.."w", "/"..vlower.."w"}
	})
	
	nut.chat.register(k.."y", { --yelling
		onCanSay =  function(speaker, text)
			local trait = hasTrait(speaker, k)
			if(trait) then
				return true
			else
				speaker:notify("You do not know that language.")
				return false
			end
		end,
		onChatAdd = function(speaker, text, anonymous)
			local speako = anonymous and "Someone" or hook.Run("GetDisplayedName", speaker, "ic") or (IsValid(speaker) and speaker:Name() or "Console")
			local texCol = nut.config.get("chatColor")
			if (LocalPlayer():GetEyeTrace().Entity == speaker) then
				texCol = nut.config.get("chatListenColor")
			end
			
			texCol = Color(texCol.r + 35, texCol.g + 35, texCol.b + 35)
			
			local nameCol = Color(texCol.r + 30, texCol.g + 30, texCol.b + 30)
			
			if(LocalPlayer() == speaker) then
				local tempCol = nut.config.get("chatListenColor")
						
				texCol = Color(tempCol.r + 55, tempCol.b + 55, tempCol.g + 55)
				nameCol = Color(tempCol.r + 40, tempCol.b + 60, tempCol.g + 40)
			end
		
			if (hasTrait(LocalPlayer(), k)) then
				--chat.AddText(nut.config.get("chatColor"), speaker:getChar():getName()..' says in Japanese, "'..text..'"')
				chat.AddText(nameCol, speako, texCol, " yells in "..v..", \""..text.."\"")
			else
				chat.AddText(nameCol, speako, texCol, " yells something in " ..v.. ".")
			end
		end,
		onCanHear = nut.config.get("chatRange", 280) * 2,
		prefix = {"/"..k.."y", "/"..vlower.."y"}
	})
end

nut.chat.register("pla", {
    onCanSay =  function(speaker, text)
		local trait = hasTrait(speaker, "pla")
		if(trait) then
			return true
		else
			speaker:notify("You do not know that language.")
			return false
		end
	end,
	onChatAdd = function(speaker, text)
		local texCol = nut.config.get("chatColor")
		texCol = Color(texCol.r, texCol.g, texCol.b)		
	
		if (hasTrait(LocalPlayer(), "pla")) then
			chat.AddText(texCol, speaker:getChar():getName().. ' writes in the Plastic Written Language, "' ..text.. '"')
		else
			chat.AddText(texCol, speaker:getChar():getName().. " writes something in the Plastic Written Language.")
		end
	end,
	onCanHear = nut.config.get("chatRange", 280),
	onGetColor = function(speaker, text)
		return Color(102, 153, 204)
	end,
	prefix = {"/pla", "/plastic"}
})

nut.chat.register("signp", {
    onCanSay =  function(speaker, text)
		local trait = hasTrait(speaker, "pla")
		if(trait) then
			return true
		else
			speaker:notify("You do not know that language.")
			return false
		end
	end,
	onChatAdd = function(speaker, text)
		local texCol = nut.config.get("chatColor")
		texCol = Color(texCol.r, texCol.g, texCol.b)
	
		if (hasTrait(LocalPlayer(), "pla")) then
			chat.AddText(texCol, speaker:getChar():getName().. ' signs in Plastic, "' ..text.. '"')
		else
			chat.AddText(texCol, speaker:getChar():getName().. " is using Plastic Sign Language.")
		end
	end,
	onCanHear = nut.config.get("chatRange", 280),
	onGetColor = function(speaker, text)
		return Color(102, 153, 204)
	end,
	prefix = {"/signp"}
})

nut.chat.register("sign", {
    onCanSay =  function(speaker, text)
		local trait = hasTrait(speaker, "sign_a")
		if(trait) then
			return true
		else
			speaker:notify("You do not know that language.")
			return false
		end
	end,
	onChatAdd = function(speaker, text)
		local texCol = nut.config.get("chatColor")
		texCol = Color(texCol.r, texCol.g, texCol.b)	
	
		if (hasTrait(LocalPlayer(), "sign_a")) then
			chat.AddText(texCol, speaker:getChar():getName().. ' signs in English, "'..text..'"')
		else
			chat.AddText(texCol, speaker:getChar():getName().. " is using American sign language.")
		end
	end,
	onCanHear = nut.config.get("chatRange", 280),
	onGetColor = function(speaker, text)
		return Color(102, 153, 204)
	end,
	prefix = {"/sign"}
})

//
local TRAIT = {}
TRAIT.uid = "sign_a"
TRAIT.name = "American Sign Language"
TRAIT.desc = "You can use American Sign Language.\nCommand: /sign"
TRAIT.category = "Language"

TRAITS:Register(TRAIT)
//
local TRAIT = {}
TRAIT.uid = "pla"
TRAIT.name = "Plastic Languages"
TRAIT.desc = "You can use and understand the plastic languages.\nCommand: /plastic, /signp"
TRAIT.category = "Language"
TRAIT.ignore = true

TRAITS:Register(TRAIT)
//