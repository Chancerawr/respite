ITEM.name = "TR-ND1"
ITEM.desc = " "
ITEM.model = "models/weapons/tfa_w_winchester_1873.mdl"
ITEM.material = "models/props_canal/metalwall005b"
ITEM.class = "tr_nd1"
ITEM.uniqueID = "tr_nd1"
ITEM.slot = "primary"
ITEM.width = 4
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Tekhtonic"

ITEM.rarity = 10
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
}

ITEM.dmg = {
	["Rifle"] = 18,
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
	pos = Vector(-200, 12.5, 2),
	ang = Angle(0, -0, 5),
	fov = 15,
}