ITEM.name = "CR-ISS"
ITEM.desc = "A modified CR-OSS with internals reworked, streamlined, and made less finicky to allow installation for a specially made three round magazine."
ITEM.model = "models/weapons/tfa_w_snip_m24_6.mdl"
ITEM.material = "models/props_wasteland/quarryobjects01"
ITEM.class = "tfa_criss"
ITEM.uniqueID = "tfa_criss"
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
	pos = Vector(-6, 200, 0),
	ang = Angle(0, 270, 0),
	fov = 15,
}
