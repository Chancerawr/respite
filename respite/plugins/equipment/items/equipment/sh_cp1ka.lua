ITEM.name = "CP-1KA"
ITEM.desc = "A high capacity low calibre pistol made out of various pieces of scrap."
ITEM.model = "models/weapons/tfa_w_dmgf_co1911.mdl"
ITEM.material = "models/props_canal/canal_bridge_railing_01b"
ITEM.class = "tfa_cp1ka"
ITEM.uniqueID = "tfa_cp1ka"
ITEM.slot = "sidearm"
ITEM.width = 2
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Pistols"

ITEM.rarity = 10
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
}

ITEM.dmg = {
	["9x19mm"] = 5,
}

ITEM.scaling = {
	["accuracy"] = 0.2,
	["perception"] = 0.2,
}

ITEM.salvage = {
	["parts_gun"] = 1
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Barrel"] = 1,
}

ITEM.iconCam = {
	pos = Vector(0, 200, -2.5),
	ang = Angle(0, 270, 5),
	fov = 4.5,
}