ITEM.name = "CH-3M0"
ITEM.desc = "Makeshift grenade launcher made out of various scrap parts. Munitions are loaded into an internal cylindrical magazine."
ITEM.ammoString = "Explosive Grenades"
ITEM.uniqueID = "tfa_ch3m0"
ITEM.model = "models/weapons/tfa_w_striker_12g.mdl"
ITEM.material = "models/props_canal/canal_bridge_railing_01b"
ITEM.class = "tfa_ch3m0"
ITEM.width = 4
ITEM.height = 2
ITEM.price = 0
ITEM.flag = "v"
ITEM.slot = "primary"
ITEM.category = "Weapons - Misc"

ITEM.rarity = 10
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
}

ITEM.dmg = {
	["Explosion"] = 40,
}

ITEM.scaling = {
	["medical"] = 0.2,
	["perception"] = 0.2,
}

ITEM.iconCam = {
	pos = Vector(-200, 6.5, 1),
	ang = Angle(0, -0, 5),
	fov = 11,
}