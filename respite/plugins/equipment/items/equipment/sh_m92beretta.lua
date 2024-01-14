ITEM.name = "M92 Beretta"
ITEM.desc = "An Italian designed, American produced semi-automatic handgun. Not particularly compatible with those of small hands due to the trigger's length of pull, but debated heavily as one of the finest combat handguns of it's time."
ITEM.model = "models/weapons/tfa_w_beretta_m92.mdl"
ITEM.class = "tfa_m92beretta"
ITEM.slot = "sidearm"
ITEM.width = 2
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
	["Pistol"] = 8,
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
	pos = Vector(-200, -6, 1.5),
	ang = Angle(0, -0, 0),
	fov = 4,
}