ITEM.name = "M29 Satan"
ITEM.desc = "A Smith and Wesson revolver, chambered in .44 Magnum. Made famous by Clint Eastwood's Dirty Harry film series. Limp-wristing this firearm may result in serious injury."
ITEM.model = "models/weapons/tfa_w_m29_satan.mdl"
ITEM.class = "tfa_m29satan"
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
	["Magnum"] = 10,
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
	pos = Vector(-200, -8, 2),
	ang = Angle(0, -0, 0),
	fov = 4.5,
}