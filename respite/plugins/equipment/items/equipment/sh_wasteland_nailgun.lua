ITEM.name = "Scavenger Nailgun"
ITEM.desc = "A modified nailgun that can be used as a silent, very painful weapon."
ITEM.model = "models/warz/melee/nailgun.mdl"
ITEM.material = "models/props_pipes/pipeset_metal02"
ITEM.class = "tfa_wasteland_nailgun"
ITEM.uniqueID = "tfa_wasteland_nailgun"
ITEM.slot = "sidearm"
ITEM.width = 2
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Scavenger"

ITEM.rarity = 10
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
}

ITEM.dmg = {
	["Pierce"] = 5,
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
	pos = Vector(0, 200, -2.5),
	ang = Angle(0, 270, 0),
	fov = 10,
}