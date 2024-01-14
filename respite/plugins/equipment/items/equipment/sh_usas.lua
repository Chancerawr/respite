ITEM.name = "USAS"
ITEM.desc = "A South-Korean produced, magazine fed automatic shotgun. Featuring a fire-rate of an average Kalash, it can still clear a room."
ITEM.model = "models/weapons/tfa_w_usas_12.mdl"
ITEM.class = "tfa_usas"
ITEM.slot = "primary"
ITEM.width = 4
ITEM.height = 2
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
	pos = Vector(-200, 9, 3),
	ang = Angle(0, -0, 0),
	fov = 12,
}