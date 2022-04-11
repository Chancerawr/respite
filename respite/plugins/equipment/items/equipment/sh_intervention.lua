ITEM.name = "Intervention"
ITEM.desc = "A long range, precision rifle. Made extensively popular by video games and movies."
ITEM.model = "models/weapons/tfa_w_snip_int.mdl"
ITEM.class = "tfa_intervention"
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
	["Sniper"] = 20,
}

ITEM.scaling = {
	["accuracy"] = 0.2,
	["perception"] = 0.2,
}

ITEM.iconCam = {
	pos = Vector(-7, 200, -1),
	ang = Angle(0, 270, 0),
	fov = 14.5,
}