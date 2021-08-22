local PLUGIN = PLUGIN

PLUGIN.CHATCOLOR_REACT = Color(50, 140, 200)
PLUGIN.CHATCOLOR_REACT2 = Color(180, 70, 180)

PLUGIN.CHATCOLOR_MELEE = Color(160, 95, 95)
PLUGIN.CHATCOLOR_RANGED = Color(100, 110, 150)
PLUGIN.CHATCOLOR_GRAZE = Color(150, 150, 75)
PLUGIN.CHATCOLOR_RESIST = Color(140, 125, 125)
PLUGIN.CHATCOLOR_SPECIAL = Color(80, 150, 150)

PLUGIN.CHATCOLOR_RED = Color(160, 60, 60)
PLUGIN.CHATCOLOR_GREEN = Color(60, 160, 60)

PLUGIN.COMBAT_FONT = "nutChatFontCombat"

--chat for colors and formatting.
nut.chat.register("attack", {
	format = "%s %s",
	color = PLUGIN.CHATCOLOR_SPECIAL,
	filter = "actions",
	font = COMBAT_FONT,
	onCanHear = nut.config.get("chatRange", 280) * 4,
	deadCanChat = true
})

nut.chat.register("statcheck", {
	format = "%s %s.",
	color = PLUGIN.CHATCOLOR_REACT,
	filter = "actions",
	font = COMBAT_FONT,
	onCanHear = nut.config.get("chatRange", 280) * 4,
	deadCanChat = true
})

if(CLIENT) then
	surface.CreateFont("nutChatFontCombat", {
		font = "Helvetica",
		size = math.max(ScreenScale(7), 26),
		extended = true,
		weight = 100
	})
end