ITEM.name = "FN P90"
ITEM.desc = "A Belgian produced Personal Defense Weapon, intended to be the first in an intended line for a new standardized cartridge for NATO forces."
ITEM.model = "models/weapons/tfa_w_fn_p90.mdl"
ITEM.class = "tfa_smgp90"
ITEM.slot = "sidearm"
ITEM.width = 3
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Submachine Guns"

ITEM.rarity = 10
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
}

ITEM.dmg = {
	["Pistol"] = 10,
}

ITEM.scaling = {
	["accuracy"] = 0.2,
	["perception"] = 0.2,
}

ITEM.salvage = {
	["parts_gun"] = 2
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Barrel"] = 1,
}

ITEM.iconCam = {
	pos = Vector(-200, 2, 2.25),
	ang = Angle(0, -0, 6),
	fov = 7.6,
}