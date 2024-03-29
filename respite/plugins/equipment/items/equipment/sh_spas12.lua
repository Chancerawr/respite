ITEM.name = "SPAS 12"
ITEM.desc = "An Italian produced dual-mode shotgun introduced in the mid-eighties. Said weapon is incredibly heavy for it's purpose, and has seen limited adoption."
ITEM.model = "models/weapons/tfa_w_spas_12.mdl"
ITEM.class = "tfa_spas12"
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
	pos = Vector(-200, 12, 2.25),
	ang = Angle(0, -0, 5),
	fov = 12,
}