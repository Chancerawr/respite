ITEM.name = "WH-ACK"
ITEM.desc = "A lightweight marksman rifle. It features an integrated silencer alongside a burst-fire capability. This variant does not have a long range scope."
ITEM.model = "models/weapons/tfa_w_svd_dragunov.mdl"
ITEM.material = "models/props_canal/metalwall005b"
ITEM.class = "wh_ack"
ITEM.uniqueID = "tfa_whack"
ITEM.slot = "primary"
ITEM.width = 4
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Rifles"

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
	pos = Vector(-200, 15, 2),
	ang = Angle(0, -0, 6),
	fov = 20,
}