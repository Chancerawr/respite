ITEM.name = "Scavenger AR"
ITEM.desc = "A somewhat powerful scrap rifle."
ITEM.model = "models/weapons/w_rif_ak47.mdl"
ITEM.material = "models/props_wasteland/tugboat01"
ITEM.class = "tfa_wasteland_ar"
ITEM.uniqueID = "tfa_wasteland_ar"
ITEM.slot = "primary"
ITEM.width = 4
ITEM.height = 1
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
	["Rifle"] = 15,
}

ITEM.scaling = {
	["accuracy"] = 0.2,
	["perception"] = 0.2,
}

ITEM.iconCam = {
	pos = Vector(-0.5, 200, 4),
	ang = Angle(0, 270, 0),
	fov = 14.5,
}