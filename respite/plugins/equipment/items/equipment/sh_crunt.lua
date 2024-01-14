ITEM.name = "CR-UNT"
ITEM.desc = "A makeshift triple barrel bolt action shotgun looking to be built by retrofitting and installing new and more complex parts to the more common CR series rifle. Designed to help deal alot of damage to large creatures in one hit."
ITEM.model = "models/weapons/tfa_w_winchester_1873.mdl"
ITEM.material = "models/props_wasteland/quarryobjects01"
ITEM.class = "tfa_crunt"
ITEM.uniqueID = "tfa_crunt"
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
	pos = Vector(-200, 12, 3),
	ang = Angle(0, -0, 5),
	fov = 14.5,
}