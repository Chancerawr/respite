ITEM.name = "Bottled Purple Mist"
ITEM.model = "models/props_junk/glassbottle01a.mdl"
ITEM.material = "models/items/boxsniperrounds"
ITEM.desc = "A bottle filled with a purple gas, inhaling it makes you feel happy and lighter than air for a few hours.\nHeavy users may see strange visions."
ITEM.duration = 6200
ITEM.uniqueID = "bottled_purple"
ITEM.price = 200
ITEM.color = Color(155, 50, 200)

ITEM.attribBoosts = {
	["fortitude"] = 10,
	["perception"] = -5
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 5,
}

ITEM:hook("_use", function(item)
	item.player:EmitSound("hl1/ambience/steamburst1.wav", 75, 50)
	item.player:ScreenFade(1, Color(155, 50, 200, 255), 10, 0)
end)