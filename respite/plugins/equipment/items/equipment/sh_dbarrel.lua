ITEM.name = "Double Barrel Shotgun"
ITEM.desc = "An unmarked and unnamed double-barreled shotgun of doubious quality. Packs one hell of a punch."
ITEM.model = "models/weapons/tfa_w_double_barrel_shotgun.mdl"
ITEM.class = "tfa_dbarrel"
ITEM.slot = "primary"
ITEM.width = 4
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Shotguns"

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

ITEM.salvage = {
	["parts_gun"] = 3
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Barrel"] = 2,
}

ITEM.iconCam = {
	pos = Vector(-200, 12, 2),
	ang = Angle(0, -0, 7),
	fov = 11,
}