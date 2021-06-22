ITEM.name = "Bottled Pink Haze"
ITEM.desc = "A gaseous substance that disorients the user and distorts their senses severely. This can be very painful for the afflicted's entire body. Those who inhale this substance may have their senses 'swapped' for a few hours before returning to normal."
ITEM.uniqueID = "haze_bottled_pink"
ITEM.model = "models/props_junk/glassbottle01a.mdl"
ITEM.material = "models/props_combine/tprings_globe"
ITEM.duration = 6000
ITEM.price = 200
ITEM.color = Color(255, 108, 180)
ITEM.sound = "hl1/ambience/steamburst1.wav"

ITEM.stomach = false

ITEM.attrib = {
	["fortitude"] = -5,
	["str"] = -5,
	["stm"] = -5,
	["end"] = -5,
	["accuracy"] = -5,
	["perception"] = -5
}

ITEM.extraFunc = function(item, client)
	client:ScreenFade(1, Color(255, 108, 180, 255), 10, 0)
end

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 5,
}