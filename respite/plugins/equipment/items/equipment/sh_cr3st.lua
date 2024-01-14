ITEM.name = "CR-3ST"
ITEM.desc = "A compact makeshift break action single shot shotgun built from various scrap parts. Designed to give someone a compact package capable of delivering a fair kick in a stand-off situation."
ITEM.model = "models/weapons/tfa_w_tcom_deagle.mdl"
ITEM.material = "models/props_c17/metalladder001"
ITEM.class = "tfa_cr3st"
ITEM.uniqueID = "tfa_cr3st"
ITEM.slot = "sidearm"
ITEM.width = 2
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
	["Shotgun"] = 10,
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
	pos = Vector(-1, 200, -2.5),
	ang = Angle(0, 270, 5),
	fov = 4.5,
}