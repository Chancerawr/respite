ITEM.name = "AK-74"
ITEM.desc = "A Russian designed and produced carbine, based off of the AKM rifle. Chambered in the intermediate 5.45x39 cartridge, the recoil is more than controllable, and it's relatively flat ballistic trajectory turns it into a nigh laser-beam when used at optimal ranges. (0-400m)."
ITEM.model = "models/weapons/tfa_w_tct_ak47.mdl"
ITEM.class = "tfa_ak74"
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
	["Rifle"] = 14,
}

ITEM.scaling = {
	["accuracy"] = 0.2,
	["perception"] = 0.2,
}

ITEM.salvage = {
	["parts_gun"] = 3
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Barrel"] = 1,
}

ITEM.iconCam = {
	pos = Vector(3, 200, -1),
	ang = Angle(0, 270, 10),
	fov = 14,
}
