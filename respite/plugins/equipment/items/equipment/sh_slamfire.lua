ITEM.name = "Slamfire Shotgun"
ITEM.desc = "A makeshift shotgun made out of two pipes."
ITEM.model = "models/props_lab/pipesystem01b.mdl"
ITEM.class = "tfa_slamfire"
ITEM.uniqueID = "makeshift_slamfire"
ITEM.slot = "primary"
ITEM.width = 3
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Shotguns"

ITEM.rarity = 10
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
}

ITEM.dmg = {
	["Shotgun"] = 15,
}

ITEM.scaling = {
	["str"] = 0.2,
	["perception"] = 0.2,
}

ITEM.iconCam = {
	pos = Vector(0, 200, 0),
	ang = Angle(0, 270, 90),
	fov = 14,
}