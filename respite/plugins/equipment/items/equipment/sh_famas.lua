ITEM.name = "FAMAS"
ITEM.desc = "A French designed and produced bullpup, boasting tight tolerances and relatively rugged reliability. Features a standard thirty round magazine. This particular unit sports an undocumented prototype furniture system and carry rail assembly not featured on the majority of Mil-spec weapons."
ITEM.model = "models/weapons/tfa_w_tct_famas.mdl"
ITEM.class = "tfa_famas"
ITEM.slot = "primary"
ITEM.width = 4
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Rifles"

ITEM.rarity = 10
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
}

ITEM.dmg = {
	["Rifle"] = 13,
}

ITEM.scaling = {
	["accuracy"] = 0.2,
	["perception"] = 0.2,
}

ITEM.salvage = {
	["parts_gun"] = 3
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Barrel"] = 1,
}

ITEM.iconCam = {
	pos = Vector(6, 200, -1.5),
	ang = Angle(0, 270, 0),
	fov = 9,
}