ITEM.name = "Bottled Blood Haze"
ITEM.model = "models/props_junk/glassbottle01a.mdl"
ITEM.material = "models/props_c17/furniturefabric002a"
ITEM.desc = "A thick red gas, it attracts nearby Abominations to the area, but is not quite enough to distract them."
ITEM.duration = 6000
ITEM.uniqueID = "haze_bottled_blood"
ITEM.price = 200
ITEM.color = Color(255, 108, 108)

ITEM.attribBoosts = {
	["fortitude"] = -10,
	["end"] = 7,
	["str"] = 7
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 5,
}

ITEM:hook("_use", function(item)
	item.player:EmitSound("hl1/ambience/steamburst1.wav")
	item.player:ScreenFade(1, Color(255, 50, 50, 255), 10, 0)
end)