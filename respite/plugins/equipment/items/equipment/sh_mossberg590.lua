ITEM.name = "Mossberg 590"
ITEM.desc = "A variant of the popular 500 series of shotguns, featuring easier access to the magazine tube for more efficient maintenance."
ITEM.model = "models/weapons/tfa_w_mossberg_590.mdl"
ITEM.class = "tfa_mossberg590"
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
	pos = Vector(-200, 10, 1),
	ang = Angle(0, -0, 7),
	fov = 13.5,
}