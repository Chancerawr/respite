ITEM.name = "CH-ALK"
ITEM.desc = "Looks like an I-beam that someone decided to use as a base for their highschool science fair project. Awkward to hold, but doesn't recoil like your typical conventional rifle."
ITEM.model = "models/weapons/tfa_w_usas_12.mdl"
ITEM.material = "models/props_pipes/destroyedpipes01a"
ITEM.class = "tfa_chalk"
ITEM.uniqueID = "tfa_chalk"
ITEM.slot = "primary"
ITEM.width = 4
ITEM.height = 2
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Misc"

ITEM.rarity = 10
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
}

ITEM.dmg = {
	["Electric"] = 15,
}

ITEM.scaling = {
	["medical"] = 0.2,
	["perception"] = 0.2,
}

ITEM.salvage = {
	["parts_gun"] = 2
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Barrel"] = 1,
}

ITEM.iconCam = {
	pos = Vector(-200, 9, 3),
	ang = Angle(0, -0, 0),
	fov = 12,
}