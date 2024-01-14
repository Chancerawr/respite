ITEM.name = "CR-4CK"
ITEM.desc = "Fully automatic shotgun variant of the CR-0CK. Features a high firerate, then an experimental two shell burst mode with an even higher firerate. No, we're not joking."
ITEM.model = "models/weapons/tfa_w_fg42.mdl"
ITEM.material = "models/props_wasteland/metal_tram001a"
ITEM.class = "tfa_cr4ck"
ITEM.uniqueID = "tfa_cr4ck"
ITEM.slot = "primary"
ITEM.width = 3
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
	["Shotgun"] = 12,
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
	pos = Vector(-200, 9, 2.5),
	ang = Angle(0, -0, 5),
	fov = 10,
}