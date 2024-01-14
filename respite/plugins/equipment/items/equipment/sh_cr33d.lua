ITEM.name = "CR-33D"
ITEM.desc = "A fully automatic assault rifle made out of various scrap parts. This variant has an extended barrel and a full stock."
ITEM.model = "models/weapons/tfa_w_dmg_vikhr.mdl"
ITEM.class = "tfa_cr33d"
ITEM.uniqueID = "tfa_cr33d"
ITEM.slot = "primary"
ITEM.width = 4
ITEM.height = 1
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
	pos = Vector(11, 200, -2),
	ang = Angle(0, 270, 10),
	fov = 10,
}