ITEM.name = "CR-3S7"
ITEM.desc = "A makeshift break action single shot shotgun with a long barrel and stock built from various scrap parts. Appears to be based off the much more compact CR-3ST."
ITEM.model = "models/weapons/tfa_w_g2_contender.mdl"
ITEM.material = "models/props_wasteland/quarryobjects01"
ITEM.class = "tfa_cr3s7"
ITEM.uniqueID = "tfa_cr3s7"
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
	["Shotgun"] = 10,
}

ITEM.scaling = {
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
	pos = Vector(-200, -10, 2.5),
	ang = Angle(0, 0, 0),
	fov = 12
}