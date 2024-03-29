ITEM.name = "S&W Model 500"
ITEM.desc = "An absolutely massive revolver of American design. Unarmored targets on the business-end of this revolver will most certainly be vaporized. Animals or monsters larger than a moose may require a follow-up shot."
ITEM.model = "models/weapons/tfa_w_sw_model_500.mdl"
ITEM.class = "tfa_model500"
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
	pos = Vector(-200, -9, 2),
	ang = Angle(0, -0, 0),
	fov = 5,
}