local PLUGIN = PLUGIN
PLUGIN.name = "Personal /it"
PLUGIN.author = "Chancer"
PLUGIN.desc = ""

nut.chat.register("pit", {
	onChatAdd = function(speaker, text)
		chat.AddText(Color(200, 150, 0), "**"..text)
	end,
	filter = "actions",
	font = "nutChatFontItalics",
	deadCanChat = true
})

nut.chat.register("pitb", {
	onChatAdd = function(speaker, text)
		chat.AddText(Color(50, 50, 50), "**"..text)
	end,
	filter = "actions",
	font = "nutChatFontItalics",
	deadCanChat = true
})

nut.command.add("pit", {
	adminOnly = true,
	syntax = "<string target> <string event>",
	onRun = function(client, arguments)		
		local message = table.concat(arguments, " ", 2)
		local target = nut.command.findPlayer(client, arguments[1])

		if (IsValid(target)) then
			nut.chat.send(client, "pit", message, false, {client, target})
		end		
	end
})

--this one just uses a different color
nut.command.add("pitb", {
	adminOnly = true,
	syntax = "<string target> <string event>",
	onRun = function(client, arguments)		
		local message = table.concat(arguments, " ", 2)
		local target = nut.command.findPlayer(client, arguments[1])

		if (IsValid(target)) then
			nut.chat.send(client, "pitb", message, false, {client, target})
		end		
	end
})