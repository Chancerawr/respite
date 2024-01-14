ITEM.name = "PKM"
ITEM.desc = "A Russian made general purpose machine gun. Like most GPMG weapons, it's recoil is substantial if not fired from the prone position, or by someone with scrawny arms."
ITEM.model = "models/weapons/tfa_w_mach_russ_pkm.mdl"
ITEM.class = "tfa_pkm"
ITEM.slot = "primary"
ITEM.width = 4
ITEM.height = 2
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Machine Guns"

ITEM.rarity = 10
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
}

ITEM.dmg = {
	["Rifle"] = 14,
}

ITEM.scaling = {
	["accuracy"] = 0.2,
	["perception"] = 0.2,
}

ITEM.salvage = {
	["parts_gun"] = 5
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Barrel"] = 1,
}

ITEM.iconCam = {
	pos = Vector(3, 200, 0),
	ang = Angle(0, 270, 9),
	fov = 13,
}