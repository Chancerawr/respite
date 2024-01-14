ITEM.name = "S&W Model 627"
ITEM.desc = "A competition variant of the popular Model 27, featuring hand-machined parts and improved tolerances. This revolver is sure to hit whatever it's pointed at, and most inaccuracy can be attributed to the shooter, and not the firearm."
ITEM.model = "models/weapons/tfa_w_sw_model_627.mdl"
ITEM.class = "tfa_model627"
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
	["Magnum"] = 10,
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
	pos = Vector(-200, -7, 2.5),
	ang = Angle(0, -0, 0),
	fov = 4.5,
}