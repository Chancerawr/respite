local playerMeta = FindMetaTable("Player")

local PLUGIN = PLUGIN
PLUGIN.name = "Bodies"
PLUGIN.author = " "
PLUGIN.desc = "A system for handling body parts and injuries."

--chattype for the health printouts
nut.chat.register("health", {
	onChatAdd = function(speaker, text)
		chat.AddText(Color(200,75,75), text)
	end,
	filter = "actions",
	font = "nutChatFontHealth",
	onCanHear = 1,
	deadCanChat = true
})

if(CLIENT) then
	--health font
	surface.CreateFont("nutChatFontHealth", {
		font = "Segoe UI",
		size = 30,
		extended = true,
		weight = 500,
		italic = true
	})
end