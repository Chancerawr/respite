ITEM.name = "KRISS Vector"
ITEM.desc = "A light submachine gun."
ITEM.model = "models/weapons/tfa_w_kriss_vector.mdl"
ITEM.class = "tfa_vector"
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

ITEM.iconCam = {
	pos = Vector(-200, 5, 1.5),
	ang = Angle(0, -0, 24),
	fov = 10.5,
}