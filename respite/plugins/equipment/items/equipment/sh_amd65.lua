ITEM.name = "AMD 65"
ITEM.desc = "A Hungarian produced paratrooper carbine based heavily upon the AKM platform of rifles. Features a folding stock, and lighter furniture."
ITEM.model = "models/weapons/tfa_w_amd_65.mdl"
ITEM.class = "tfa_amd65"
ITEM.slot = "primary"
ITEM.width = 3
ITEM.height = 2
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Rifles"

ITEM.rarity = 10
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
}

ITEM.dmg = {
	["Rifle"] = 14,
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
	pos = Vector(-200, 11, 2),
	ang = Angle(0, -0, 0),
	fov = 13,
}