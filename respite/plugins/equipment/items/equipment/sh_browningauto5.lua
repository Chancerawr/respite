ITEM.name = "Browning Auto 5"
ITEM.desc = "An American produced, recoil operated semi-automatic shotgun, hailing from the closing days of the 'Wild West'."
ITEM.class = "tfa_browningauto5"
ITEM.slot = "primary"
ITEM.model = "models/weapons/tfa_w_browning_auto.mdl"
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
	pos = Vector(-200, 15, 2),
	ang = Angle(0, -0, 8.5),
	fov = 14.5,
}