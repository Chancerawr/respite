ITEM.name = "Bottled Purple Mist"
ITEM.desc = "A bottle filled with a purple gas, inhaling it makes you feel happy and lighter than air for a few hours.\nHeavy users may see strange visions."
ITEM.uniqueID = "bottled_purple"
ITEM.model = "models/props_junk/glassbottle01a.mdl"
ITEM.material = "models/items/boxsniperrounds"
ITEM.duration = 6200
ITEM.price = 200
ITEM.color = Color(155, 50, 200)

ITEM.sound = "hl1/ambience/steamburst1.wav"
ITEM.soundPitch = 50

ITEM.stomach = false

ITEM.attrib = {
	["fortitude"] = 5,
	["perception"] = -5
}

ITEM.extraFunc = function(item, client)
	client:ScreenFade(1, Color(155, 50, 200, 255), 10, 0)
end

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 5,
}