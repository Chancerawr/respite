ITEM.name = "P08 Luger"
ITEM.desc = "An incredibly high quality, and highly popular gun, designed by H&K in the early sixties."
ITEM.model = "models/weapons/tfa_w_luger_p08.mdl"
ITEM.class = "tfa_luger"
ITEM.slot = "sidearm"
ITEM.width = 1
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
	["Pistol"] = 7,
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
	pos = Vector(-200, -6, 1),
	ang = Angle(0, -0, 0),
	fov = 4.5,
}