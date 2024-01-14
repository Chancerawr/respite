ITEM.name = "CH-4RM"
ITEM.desc = "Makeshift power single ultra-cam compound crossbow featuring an automatic draw system. It's a wonder how most of the wooden arrows survive being fired from this thing."
ITEM.model = "models/weapons/w_crossbow.mdl"
ITEM.class = "tfa_ch4rm"
ITEM.uniqueID = "tfa_ch4rm"
ITEM.slot = "primary"
ITEM.width = 3
ITEM.height = 2
ITEM.price = 100
ITEM.flag = "v"
ITEM.category = "Weapons - Misc"

ITEM.rarity = 10
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
}

ITEM.dmg = {
	["Pierce"] = 15,
}

ITEM.scaling = {
	["accuracy"] = 0.2,
	["perception"] = 0.2,
}

ITEM.salvage = {
	["parts_gun"] = 2
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
}

ITEM.iconCam = {
	pos = Vector(7, 3, 200),
	ang = Angle(90, 0, 90),
	fov = 15,
}
