ITEM.name = "M16A4 ACOG"
ITEM.desc = "The latest iteration of the M16 family of rifles, intended for usage by the United States Marine Corps. Featuring a rifle length barrel and gas system, this rifle's already dependable accuracy is supplemented by a Trijicon ACOG magnified sight."
ITEM.model = "models/weapons/tfa_w_dmg_m16ag.mdl"
ITEM.class = "tfa_m16a4_acog"
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
	["Rifle"] = 12,
}

ITEM.scaling = {
	["accuracy"] = 0.2,
	["perception"] = 0.2,
}

ITEM.iconCam = {
	pos = Vector(0, 200, -1),
	ang = Angle(0, 270, 0),
	fov = 10.5,
}