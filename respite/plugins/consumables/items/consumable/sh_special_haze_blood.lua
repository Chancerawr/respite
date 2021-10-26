ITEM.name = "Bottled Blood Haze"
ITEM.desc = "A thick red gas, it attracts nearby Abominations to the area, but is not quite enough to distract them."
ITEM.uniqueID = "haze_bottled_blood"
ITEM.model = "models/props_junk/glassbottle01a.mdl"
ITEM.material = "models/props_c17/furniturefabric002a"
ITEM.duration = 6000
ITEM.price = 200
ITEM.color = Color(255, 60, 60)
ITEM.sound = "hl1/ambience/steamburst1.wav"

ITEM.noEnhance = true

ITEM.attrib = {
	["fortitude"] = -5,
	["end"] = 4,
	["str"] = 4
}

ITEM.extraFunc = function(item, client)
	client:ScreenFade(1, Color(255, 50, 50, 255), 10, 0)
end

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 5,
}