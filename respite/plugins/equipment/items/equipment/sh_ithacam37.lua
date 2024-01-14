ITEM.name = "Ithaca M37"
ITEM.desc = "An American pump action shotgun that loads and ejects from the bottom port of the firearm, making it popular for civilian shooters, as well as military operatives."
ITEM.model = "models/weapons/tfa_w_ithaca_m37.mdl"
ITEM.class = "tfa_ithacam37"
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
	["Barrel"] = 1,
}

ITEM.iconCam = {
	pos = Vector(-200, 11, 1.5),
	ang = Angle(0, -0, 8),
	fov = 13,
}