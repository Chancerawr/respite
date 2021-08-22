PLUGIN.name = "Links"
PLUGIN.author = ""
PLUGIN.desc = "Commands that can used to link forums and content through the config."

nut.config.add("linkForums", "", "Link for /forums", nil, {
	category = "Links"
})

nut.config.add("linkContent", "", "Link for /content", nil, {
	category = "Links"
})

nut.command.add("forums", {
	onRun = function(client, arguments)
		local link = nut.config.get("linkForums", "")
		
		if(link != "") then
			client:SendLua([[gui.OpenURL("]]..link..[[")]])
		else
			client:notify("No forums link set in config.")
		end
	end
})

nut.command.add("content", {
	onRun = function(client, arguments)
		local link = nut.config.get("linkContent", "")
		
		if(link != "") then
			client:SendLua([[gui.OpenURL("]]..link..[[")]])
		else
			client:notify("No content link set in config.")
		end
	end
})
