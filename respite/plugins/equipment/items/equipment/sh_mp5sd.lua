ITEM.name = "MP5SD"
ITEM.desc = "An integrally suppressed variant of the ever popular MP5 sub-machine gun, featuring a telescoping stock, and comfy hand guard."
ITEM.model = "models/weapons/tfa_w_hk_mp5sd.mdl"
ITEM.class = "tfa_mp5sd"
ITEM.slot = "sidearm"
ITEM.width = 3
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Submachine Guns"

ITEM.rarity = 10
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
}

ITEM.dmg = {
	["Pistol"] = 9,
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
	["Barrel"] = 1,
}

ITEM.iconCam = {
	pos = Vector(-200, 10, 1.5),
	ang = Angle(0, -0, -2),
	fov = 11,
}