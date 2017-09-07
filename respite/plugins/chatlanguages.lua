local PLUGIN = PLUGIN
PLUGIN.name = "Languages"
PLUGIN.author = "Tazmily"
PLUGIN.desc = "Adds some more languages for characters to speak."

nut.chat.register("jpn", {
    onCanSay =  function(speaker, text)
		return speaker:getChar():hasFlags("J")
	end,
	onChatAdd = function(speaker, text)
		if (LocalPlayer():getChar():hasFlags("J")) then
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName()..' says in Japanese, "'..text..'"')

		else
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName().." says something in Japanese.")

		end
	end,
	onCanHear = nut.config.get("chatRange", 280),
	onGetColor = function(speaker, text)
		return Color(102, 153, 204)
	end,
	prefix = {"/jpn", "/japanese"}
})

nut.chat.register("jpnw", {
    onCanSay =  function(speaker, text)
		return speaker:getChar():hasFlags("J")
	end,
	onChatAdd = function(speaker, text)
		if (LocalPlayer():getChar():hasFlags("J")) then
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName()..' whispers in Japanese, "'..text..'"')

		else
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName().." whispers something in Japanese.")

		end
	end,
	onCanHear = nut.config.get("chatRange", 280) * .25,
	onGetColor = function(speaker, text)
	local color = nut.chat.classes.ic.onGetColor(speaker, text)
		return Color(color.r - 35, color.g - 35, color.b - 35)
	end,
	prefix = {"/jpnw", "/japanesew"}
})

nut.chat.register("jpny", {
    onCanSay =  function(speaker, text)
		return speaker:getChar():hasFlags("J")
	end,
	onChatAdd = function(speaker, text)
		if (LocalPlayer():getChar():hasFlags("J")) then
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName()..' yells in Japanese, "'..text..'"')

		else
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName().." yells something in Japanese.")

		end
	end,
	onCanHear = nut.config.get("chatRange", 280) * 2,
	onGetColor = function(speaker, text)
	local color = nut.chat.classes.ic.onGetColor(speaker, text)
		return Color(color.r + 35, color.g + 35, color.b + 35)
	end,
	prefix = {"/jpny", "/japanesey"}
})

nut.chat.register("ita", {
    onCanSay =  function(speaker, text)
		return speaker:getChar():hasFlags("I")
	end,
	onChatAdd = function(speaker, text)
		if (LocalPlayer():getChar():hasFlags("I")) then
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName()..' says in Italian. "'..text..'"')

		else
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName().." says something in Italian.")

		end
	end,
	onCanHear = nut.config.get("chatRange", 280),
	onGetColor = function(speaker, text)
	local color = nut.chat.classes.ic.onGetColor(speaker, text)
		return Color(102, 153, 204)
	end,
	prefix = {"/ita", "/italian"}
})

nut.chat.register("itaw", {
    onCanSay =  function(speaker, text)
		return speaker:getChar():hasFlags("I")
	end,
	onChatAdd = function(speaker, text)
		if (LocalPlayer():getChar():hasFlags("I")) then
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName()..' whispers in Italian. "'..text..'"')

		else
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName().." whispers something in Italian.")

		end
	end,
	onCanHear = nut.config.get("chatRange", 280) * .25,
	onGetColor = function(speaker, text)
	local color = nut.chat.classes.ic.onGetColor(speaker, text)
		return Color(color.r - 35, color.g - 35, color.b - 35)
	end,
	prefix = {"/itaw", "/italianw"}
})

nut.chat.register("itay", {
    onCanSay =  function(speaker, text)
		return speaker:getChar():hasFlags("I")
	end,
	onChatAdd = function(speaker, text)
		if (LocalPlayer():getChar():hasFlags("I")) then
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName()..' yells in Italian. "'..text..'"')

		else
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName().." yells something in Italian.")

		end
	end,
	onCanHear = nut.config.get("chatRange", 280) * 2,
	onGetColor = function(speaker, text)
	local color = nut.chat.classes.ic.onGetColor(speaker, text)
		return Color(color.r + 35, color.g + 35, color.b + 35)
	end,
	prefix = {"/itay", "/italiany"}
})

nut.chat.register("spa", {
    onCanSay =  function(speaker, text)
		return speaker:getChar():hasFlags("S")
	end,
	onChatAdd = function(speaker, text)
		if (LocalPlayer():getChar():hasFlags("S")) then
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName()..' says in Spanish "'..text..'"')

		else
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName().." says something in Spanish.")

		end
	end,
	onCanHear = nut.config.get("chatRange", 280),
	onGetColor = function(speaker, text)
		return Color(102, 153, 204)
	end,
	prefix = {"/spa", "/spanish"}
})

nut.chat.register("spaw", {
    onCanSay =  function(speaker, text)
		return speaker:getChar():hasFlags("S")
	end,
	onChatAdd = function(speaker, text)
		if (LocalPlayer():getChar():hasFlags("S")) then
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName()..' whispers in Spanish, "'..text..'"')

		else
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName().." whispers something in Spanish.")

		end
	end,
	onCanHear = nut.config.get("chatRange", 280) * .25,
	onGetColor = function(speaker, text)
	local color = nut.chat.classes.ic.onGetColor(speaker, text)
		return Color(color.r - 35, color.g - 35, color.b - 35)
	end,
	prefix = {"/spaw", "/spanishw"}
})

nut.chat.register("spay", {
    onCanSay =  function(speaker, text)
		return speaker:getChar():hasFlags("S")
	end,
	onChatAdd = function(speaker, text)
		if (LocalPlayer():getChar():hasFlags("S")) then
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName()..' yells in Spanish, "'..text..'"')

		else
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName().." yells something in Spanish.")

		end
	end,
	onCanHear = nut.config.get("chatRange", 280) * 2,
	onGetColor = function(speaker, text)
	local color = nut.chat.classes.ic.onGetColor(speaker, text)
		return Color(color.r + 35, color.g + 35, color.b + 35)
	end,
	prefix = {"/spay", "/spanishy"}
})

nut.chat.register("chi", {
    onCanSay =  function(speaker, text)
		return speaker:getChar():hasFlags("X")
	end,
	onChatAdd = function(speaker, text)
		if (LocalPlayer():getChar():hasFlags("X")) then
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName()..' says in Chinese "'..text..'"')

		else
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName().." says something in Chinese.")

		end
	end,
	onCanHear = nut.config.get("chatRange", 280),
	onGetColor = function(speaker, text)
		return Color(102, 153, 204)
	end,
	prefix = {"/chi", "/chinese"}
})

nut.chat.register("chiw", {
    onCanSay =  function(speaker, text)
		return speaker:getChar():hasFlags("X")
	end,
	onChatAdd = function(speaker, text)
		if (LocalPlayer():getChar():hasFlags("X")) then
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName()..' whispers in Chinese, "'..text..'"')

		else
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName().." whispers something in Chinese.")

		end
	end,
	onCanHear = nut.config.get("chatRange", 280) * .25,
	onGetColor = function(speaker, text)	
	local color = nut.chat.classes.ic.onGetColor(speaker, text)
		return Color(color.r - 35, color.g - 35, color.b - 35)
	end,
	prefix = {"/chiw", "/chinesew"}
})

nut.chat.register("chiy", {
    onCanSay =  function(speaker, text)
		return speaker:getChar():hasFlags("X")
	end,
	onChatAdd = function(speaker, text)
		if (LocalPlayer():getChar():hasFlags("X")) then
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName()..' yells in Chinese, "'..text..'"')

		else
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName().." yells something in Chinese.")

		end
	end,
	onCanHear = nut.config.get("chatRange", 280) * 2,
	onGetColor = function(speaker, text)	
	local color = nut.chat.classes.ic.onGetColor(speaker, text)
		return Color(color.r + 35, color.g + 35, color.b + 35)
	end,
	prefix = {"/chiy", "/chinesey"}
})

nut.chat.register("ger", {
    onCanSay =  function(speaker, text)
		return speaker:getChar():hasFlags("G")
	end,
	onChatAdd = function(speaker, text)
		if (LocalPlayer():getChar():hasFlags("G")) then
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName()..' says in German "'..text..'"')

		else
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName().." says something in German.")

		end
	end,
	onCanHear = nut.config.get("chatRange", 280),
	onGetColor = function(speaker, text)
		return Color(102, 153, 204)
	end,
	prefix = {"/ger", "/german"}
})

nut.chat.register("gerw", {
    onCanSay =  function(speaker, text)
		return speaker:getChar():hasFlags("G")
	end,
	onChatAdd = function(speaker, text)
		if (LocalPlayer():getChar():hasFlags("G")) then
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName()..' whispers in German, "'..text..'"')

		else
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName().." whispers something in German.")

		end
	end,
	onCanHear = nut.config.get("chatRange", 280) * .25,
	onGetColor = function(speaker, text)	
	local color = nut.chat.classes.ic.onGetColor(speaker, text)
		return Color(color.r - 35, color.g - 35, color.b - 35)
	end,
	prefix = {"/gerw", "/germanw"}
})

nut.chat.register("gery", {
    onCanSay =  function(speaker, text)
		return speaker:getChar():hasFlags("G")
	end,
	onChatAdd = function(speaker, text)
		if (LocalPlayer():getChar():hasFlags("G")) then
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName()..' yells in German, "'..text..'"')

		else
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName().." yells something in German.")

		end
	end,
	onCanHear = nut.config.get("chatRange", 280) * 2,
	onGetColor = function(speaker, text)	
	local color = nut.chat.classes.ic.onGetColor(speaker, text)
		return Color(color.r + 35, color.g + 35, color.b + 35)
	end,
	prefix = {"/gery", "/germany"}
})

nut.chat.register("rus", {
    onCanSay =  function(speaker, text)
		return speaker:getChar():hasFlags("R")
	end,
	onChatAdd = function(speaker, text)
		if (LocalPlayer():getChar():hasFlags("R")) then
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName()..' says in Russian "'..text..'"')

		else
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName().." says something in Russian.")

		end
	end,
	onCanHear = nut.config.get("chatRange", 280),
	onGetColor = function(speaker, text)
		return Color(102, 153, 204)
	end,
	prefix = {"/rus", "/russian"}
})

nut.chat.register("rusw", {
    onCanSay =  function(speaker, text)
		return speaker:getChar():hasFlags("R")
	end,
	onChatAdd = function(speaker, text)
		if (LocalPlayer():getChar():hasFlags("R")) then
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName()..' whispers in Russian, "'..text..'"')

		else
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName().." whispers something in Russian.")

		end
	end,
	onCanHear = nut.config.get("chatRange", 280) * .25,
	onGetColor = function(speaker, text)	
	local color = nut.chat.classes.ic.onGetColor(speaker, text)
		return Color(color.r - 35, color.g - 35, color.b - 35)
	end,
	prefix = {"/rusw", "/russianw"}
})

nut.chat.register("rusy", {
    onCanSay =  function(speaker, text)
		return speaker:getChar():hasFlags("R")
	end,
	onChatAdd = function(speaker, text)
		if (LocalPlayer():getChar():hasFlags("R")) then
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName()..' yells in Russian, "'..text..'"')

		else
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName().." yells something in Russian.")

		end
	end,
	onCanHear = nut.config.get("chatRange", 280) * 2,
	onGetColor = function(speaker, text)	
	local color = nut.chat.classes.ic.onGetColor(speaker, text)
		return Color(color.r + 35, color.g + 35, color.b + 35)
	end,
	prefix = {"/rusy", "/russiany"}
})

nut.chat.register("ara", {
    onCanSay =  function(speaker, text)
		return speaker:getChar():hasFlags("A")
	end,
	onChatAdd = function(speaker, text)
		if (LocalPlayer():getChar():hasFlags("A")) then
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName()..' says in Arabic "'..text..'"')

		else
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName().." says something in Arabic.")

		end
	end,
	onCanHear = nut.config.get("chatRange", 280),
	onGetColor = function(speaker, text)
		return Color(102, 153, 204)
	end,
	prefix = {"/ara", "/arabic"}
})

nut.chat.register("araw", {
    onCanSay =  function(speaker, text)
		return speaker:getChar():hasFlags("A")
	end,
	onChatAdd = function(speaker, text)
		if (LocalPlayer():getChar():hasFlags("A")) then
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName()..' whispers in Arabic, "'..text..'"')

		else
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName().." whispers something in Arabic.")

		end
	end,
	onCanHear = nut.config.get("chatRange", 280) * .25,
	onGetColor = function(speaker, text)	
	local color = nut.chat.classes.ic.onGetColor(speaker, text)
		return Color(color.r - 35, color.g - 35, color.b - 35)
	end,
	prefix = {"/araw", "/arabicw"}
})

nut.chat.register("aray", {
    onCanSay =  function(speaker, text)
		return speaker:getChar():hasFlags("A")
	end,
	onChatAdd = function(speaker, text)
		if (LocalPlayer():getChar():hasFlags("A")) then
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName()..' yells in Arabic, "'..text..'"')

		else
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName().." yells something in Arabic.")

		end
	end,
	onCanHear = nut.config.get("chatRange", 280) * 2,
	onGetColor = function(speaker, text)	
	local color = nut.chat.classes.ic.onGetColor(speaker, text)
		return Color(color.r + 35, color.g + 35, color.b + 35)
	end,
	prefix = {"/aray", "/arabicy"}
})

nut.chat.register("fre", {
    onCanSay =  function(speaker, text)
		return speaker:getChar():hasFlags("F")
	end,
	onChatAdd = function(speaker, text)
		if (LocalPlayer():getChar():hasFlags("F")) then
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName()..' says in French "'..text..'"')

		else
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName().." says something in French.")

		end
	end,
	onCanHear = nut.config.get("chatRange", 280),
	onGetColor = function(speaker, text)
		return Color(102, 153, 204)
	end,
	prefix = {"/fre", "/french"}
})

nut.chat.register("frew", {
    onCanSay =  function(speaker, text)
		return speaker:getChar():hasFlags("F")
	end,
	onChatAdd = function(speaker, text)
		if (LocalPlayer():getChar():hasFlags("F")) then
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName()..' whispers in French, "'..text..'"')

		else
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName().." whispers something in French.")

		end
	end,
	onCanHear = nut.config.get("chatRange", 280) * .25,
	onGetColor = function(speaker, text)	
	local color = nut.chat.classes.ic.onGetColor(speaker, text)
		return Color(color.r - 35, color.g - 35, color.b - 35)
	end,
	prefix = {"/frew", "/frenchw"}
})

nut.chat.register("frey", {
    onCanSay =  function(speaker, text)
		return speaker:getChar():hasFlags("F")
	end,
	onChatAdd = function(speaker, text)
		if (LocalPlayer():getChar():hasFlags("F")) then
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName()..' yells in French, "'..text..'"')

		else
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName().." yells something in French.")

		end
	end,
	onCanHear = nut.config.get("chatRange", 280) * 2,
	onGetColor = function(speaker, text)	
	local color = nut.chat.classes.ic.onGetColor(speaker, text)
		return Color(color.r + 35, color.g + 35, color.b + 35)
	end,
	prefix = {"/frey", "/frenchy"}
})

nut.chat.register("afr", {
    onCanSay =  function(speaker, text)
		return speaker:getChar():hasFlags("D")
	end,
	onChatAdd = function(speaker, text)
		if (LocalPlayer():getChar():hasFlags("D")) then
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName()..' says in Afrikaans "'..text..'"')

		else
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName().." says something in Afrikaans.")

		end
	end,
	onCanHear = nut.config.get("chatRange", 280),
	onGetColor = function(speaker, text)
		return Color(102, 153, 204)
	end,
	prefix = {"/afr", "/afrikaans"}
})

nut.chat.register("afrw", {
    onCanSay =  function(speaker, text)
		return speaker:getChar():hasFlags("D")
	end,
	onChatAdd = function(speaker, text)
		if (LocalPlayer():getChar():hasFlags("D")) then
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName()..' whispers in Afrikaans, "'..text..'"')

		else
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName().." whispers something in Afrikaans.")

		end
	end,
	onCanHear = nut.config.get("chatRange", 280) * .25,
	onGetColor = function(speaker, text)	
	local color = nut.chat.classes.ic.onGetColor(speaker, text)
		return Color(color.r - 35, color.g - 35, color.b - 35)
	end,
	prefix = {"/afrw", "/afrikaansw"}
})

nut.chat.register("afry", {
    onCanSay =  function(speaker, text)
		return speaker:getChar():hasFlags("D")
	end,
	onChatAdd = function(speaker, text)
		if (LocalPlayer():getChar():hasFlags("D")) then
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName()..' yells in Afrikaans, "'..text..'"')

		else
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName().." yells something in Afrikaans.")

		end
	end,
	onCanHear = nut.config.get("chatRange", 280) * 2,
	onGetColor = function(speaker, text)	
	local color = nut.chat.classes.ic.onGetColor(speaker, text)
		return Color(color.r + 35, color.g + 35, color.b + 35)
	end,
	prefix = {"/afry", "/afrikaansy"}
})

nut.chat.register("kor", {
    onCanSay =  function(speaker, text)
		return speaker:getChar():hasFlags("K")
	end,
	onChatAdd = function(speaker, text)
		if (LocalPlayer():getChar():hasFlags("K")) then
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName()..' says in Korean "'..text..'"')

		else
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName().." says something in Korean.")

		end
	end,
	onCanHear = nut.config.get("chatRange", 280),
	onGetColor = function(speaker, text)
		return Color(102, 153, 204)
	end,
	prefix = {"/kor", "/korean"}
})

nut.chat.register("korw", {
    onCanSay =  function(speaker, text)
		return speaker:getChar():hasFlags("K")
	end,
	onChatAdd = function(speaker, text)
		if (LocalPlayer():getChar():hasFlags("K")) then
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName()..' whispers in Korean, "'..text..'"')

		else
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName().." whispers something in Korean.")

		end
	end,
	onCanHear = nut.config.get("chatRange", 280) * .25,
	onGetColor = function(speaker, text)	
	local color = nut.chat.classes.ic.onGetColor(speaker, text)
		return Color(color.r - 35, color.g - 35, color.b - 35)
	end,
	prefix = {"/korw", "/koreanw"}
})

nut.chat.register("kory", {
    onCanSay =  function(speaker, text)
		return speaker:getChar():hasFlags("K")
	end,
	onChatAdd = function(speaker, text)
		if (LocalPlayer():getChar():hasFlags("K")) then
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName()..' yells in Korean, "'..text..'"')

		else
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName().." yells something in Korean.")

		end
	end,
	onCanHear = nut.config.get("chatRange", 280) * 2,
	onGetColor = function(speaker, text)	
	local color = nut.chat.classes.ic.onGetColor(speaker, text)
		return Color(color.r + 35, color.g + 35, color.b + 35)
	end,
	prefix = {"/kory", "/koreany"}
})

nut.chat.register("fin", {
    onCanSay =  function(speaker, text)
		return speaker:getChar():hasFlags("N")
	end,
	onChatAdd = function(speaker, text)
		if (LocalPlayer():getChar():hasFlags("N")) then
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName()..' says in Finnish "'..text..'"')

		else
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName().." says something in Finnish.")

		end
	end,
	onCanHear = nut.config.get("chatRange", 280),
	onGetColor = function(speaker, text)
		return Color(102, 153, 204)
	end,
	prefix = {"/fin", "/finnish"}
})

nut.chat.register("finw", {
    onCanSay =  function(speaker, text)
		return speaker:getChar():hasFlags("N")
	end,
	onChatAdd = function(speaker, text)
		if (LocalPlayer():getChar():hasFlags("N")) then
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName()..' whispers in Finnish, "'..text..'"')

		else
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName().." whispers something in Finnish.")

		end
	end,
	onCanHear = nut.config.get("chatRange", 280) * .25,
	onGetColor = function(speaker, text)	
	local color = nut.chat.classes.ic.onGetColor(speaker, text)
		return Color(color.r - 35, color.g - 35, color.b - 35)
	end,
	prefix = {"/finw", "/finnishw"}
})

nut.chat.register("finy", {
    onCanSay =  function(speaker, text)
		return speaker:getChar():hasFlags("N")
	end,
	onChatAdd = function(speaker, text)
		if (LocalPlayer():getChar():hasFlags("N")) then
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName()..' yells in Finnish, "'..text..'"')

		else
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName().." yells something in Finnish.")

		end
	end,
	onCanHear = nut.config.get("chatRange", 280) * 2,
	onGetColor = function(speaker, text)	
	local color = nut.chat.classes.ic.onGetColor(speaker, text)
		return Color(color.r + 35, color.g + 35, color.b + 35)
	end,
	prefix = {"/finy", "/finnishy"}
})

nut.chat.register("pol", {
    onCanSay =  function(speaker, text)
		return speaker:getChar():hasFlags("O")
	end,
	onChatAdd = function(speaker, text)
		if (LocalPlayer():getChar():hasFlags("O")) then
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName()..' says in Polish "'..text..'"')

		else
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName().." says something in Polish.")

		end
	end,
	onCanHear = nut.config.get("chatRange", 280),
	onGetColor = function(speaker, text)
		return Color(102, 153, 204)
	end,
	prefix = {"/pol", "/polish"}
})

nut.chat.register("polw", {
    onCanSay =  function(speaker, text)
		return speaker:getChar():hasFlags("O")
	end,
	onChatAdd = function(speaker, text)
		if (LocalPlayer():getChar():hasFlags("O")) then
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName()..' whispers in Polish, "'..text..'"')

		else
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName().." whispers something in Polish.")

		end
	end,
	onCanHear = nut.config.get("chatRange", 280) * .25,
	onGetColor = function(speaker, text)	
	local color = nut.chat.classes.ic.onGetColor(speaker, text)
		return Color(color.r - 35, color.g - 35, color.b - 35)
	end,
	prefix = {"/polw", "/polishw"}
})

nut.chat.register("poly", {
    onCanSay =  function(speaker, text)
		return speaker:getChar():hasFlags("O")
	end,
	onChatAdd = function(speaker, text)
		if (LocalPlayer():getChar():hasFlags("O")) then
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName()..' yells in Polish, "'..text..'"')

		else
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName().." yells something in Polish.")

		end
	end,
	onCanHear = nut.config.get("chatRange", 280) * 2,
	onGetColor = function(speaker, text)	
	local color = nut.chat.classes.ic.onGetColor(speaker, text)
		return Color(color.r + 35, color.g + 35, color.b + 35)
	end,
	prefix = {"/poly", "/polishy"}
})

nut.chat.register("pla", {
    onCanSay =  function(speaker, text)
		return speaker:getChar():hasFlags("M")
	end,
	onChatAdd = function(speaker, text)
		if (LocalPlayer():getChar():hasFlags("M")) then
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName()..' writes in the plastic written language, "'..text..'"')

		else
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName().." writes something in the plastic written language.")

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
		return speaker:getChar():hasFlags("M")
	end,
	onChatAdd = function(speaker, text)
		if (LocalPlayer():getChar():hasFlags("M")) then
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName()..' signs in plastic, "'..text..'"')

		else
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName().." is using Plastic sign language.")

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
		return speaker:getChar():hasFlags("H")
	end,
	onChatAdd = function(speaker, text)
		if (LocalPlayer():getChar():hasFlags("H")) then
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName()..' signs in english, "'..text..'"')

		else
		 chat.AddText(nut.config.get("chatColor"),speaker:getChar():getName().." is using American sign language.")

		end
	end,
	onCanHear = nut.config.get("chatRange", 280),
	onGetColor = function(speaker, text)
		return Color(102, 153, 204)
	end,
	prefix = {"/sign"}
})

nut.flag.add("J", "Japanese language.")
nut.flag.add("I", "Italian language.")
nut.flag.add("X", "Chinese language.")
nut.flag.add("R", "Russian language.")
nut.flag.add("G", "German language.")
nut.flag.add("S", "Spanish language.")
nut.flag.add("A", "Arabic Language.")
nut.flag.add("F", "French Language.")
nut.flag.add("M", "Plastic Written and Sign Language.")
nut.flag.add("D", "Afrikaans Language.")
nut.flag.add("K", "Korean Language.")
nut.flag.add("H", "American Sign Language.")
nut.flag.add("O", "Polish Language.")
nut.flag.add("N", "Finnish Language.")
