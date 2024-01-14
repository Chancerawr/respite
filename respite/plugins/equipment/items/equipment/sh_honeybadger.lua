ITEM.name = "AAC Honey Badger"
ITEM.desc = "An automatic PDW based off of the AR-15."
ITEM.model = "models/weapons/tfa_w_aac_honeybadger.mdl"
ITEM.class = "tfa_honeybadger"
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
	["Rifle"] = 20,
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
	pos = Vector(-200, 9, 2),
	ang = Angle(0, -0, 0),
	fov = 10.5,
}