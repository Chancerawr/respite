ITEM.name = "Barrett M98B"
ITEM.desc = "A long range, precision sniper rifle built from the ground up by Barrett Firearms."
ITEM.model = "models/weapons/tfa_w_barrett_m98b.mdl"
ITEM.class = "tfa_m98b"
ITEM.slot = "primary"
ITEM.width = 5
ITEM.height = 2
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Snipers"

ITEM.rarity = 10
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
}

ITEM.dmg = {
	["Sniper"] = 15,
}

ITEM.scaling = {
	["accuracy"] = 0.2,
	["perception"] = 0.2,
}

ITEM.iconCam = {
	pos = Vector(-200, 17.5, 4),
	ang = Angle(0, -0, 4),
	fov = 15,
}