ITEM.name = "STEN"
ITEM.desc = "A World War II era British sub-machine gun, intended for paratroopers and rear-echelon soldiers."
ITEM.model = "models/weapons/tfa_w_sten.mdl"
ITEM.class = "tfa_sten"
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
	["Pistol"] = 10,
}

ITEM.scaling = {
	["accuracy"] = 0.2,
	["perception"] = 0.2,
}

ITEM.iconCam = {
	pos = Vector(200, 9, 3),
	ang = Angle(180, -0, 180),
	fov = 10,
}