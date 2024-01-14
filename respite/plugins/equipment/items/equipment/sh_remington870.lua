ITEM.name = "Remington 870"
ITEM.desc = "An incredibly popular pump-action sporting shotgun, favored in the hands of duck hunters and door-kickers alike."
ITEM.model = "models/weapons/tfa_w_remington_870_tact.mdl"
ITEM.class = "tfa_remington870"
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
	pos = Vector(-200, 14, 1.5),
	ang = Angle(0, -0, 3),
	fov = 16,
}