ITEM.name = "Benelli M3"
ITEM.desc = "An Italian produced dual mode shotgun, able to be fired in semi-automatic, or pump action fire modes. Used by door-kickers across the world."
ITEM.model = "models/weapons/tfa_w_benelli_m3.mdl"
ITEM.class = "tfa_m3"
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