ITEM.name = "Scavenger Shotgun"
ITEM.desc = "A handmade magazine-fed shotgun, clearly inspired by the Saiga 12. Powerful at close range, but barely effective anywhere else."
ITEM.model = "models/weapons/w_rif_galil.mdl"
ITEM.material = "models/props_wasteland/quarryobjects01"
ITEM.class = "tfa_wasteland_shotgun"
ITEM.uniqueID = "tfa_wasteland_shotgun"
ITEM.slot = "primary"
ITEM.width = 3
ITEM.height = 2
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Scavenger"

ITEM.rarity = 10
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
}

ITEM.dmg = {
	["Shotgun"] = 20,
}

ITEM.scaling = {
	["str"] = 0.2,
	["perception"] = 0.2,
}

ITEM.iconCam = {
	pos = Vector(-2, 200, 5),
	ang = Angle(0, 270, 0),
	fov = 12.75,
}
