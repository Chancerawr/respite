ITEM.name = "MP9"
ITEM.desc = "A Swiss made machine pistol, intended for the usage of Swiss military and police units. This particular model is equipped with a micro red dot sight."
ITEM.model = "models/weapons/tfa_w_brugger_thomet_mp9.mdl"
ITEM.class = "tfa_mp9"
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
	pos = Vector(-200, 4, 0),
	ang = Angle(0, -0, 4),
	fov = 13,
}