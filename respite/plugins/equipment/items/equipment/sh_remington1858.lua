ITEM.name = "Remington 1858"
ITEM.desc = "A relic of a black powder revolver from the American Civil War era."
ITEM.model = "models/weapons/tfa_w_remington_1858.mdl"
ITEM.class = "tfa_remington1858"
ITEM.slot = "sidearm"
ITEM.width = 2
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Pistols"

ITEM.rarity = 10
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
}

ITEM.dmg = {
	["Magnum"] = 9,
}

ITEM.scaling = {
	["accuracy"] = 0.2,
	["perception"] = 0.2,
}

ITEM.salvage = {
	["parts_gun"] = 1
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Barrel"] = 1,
}

ITEM.iconCam = {
	pos = Vector(-200, -9.5, 2),
	ang = Angle(0, -0, 0),
	fov = 5,
}