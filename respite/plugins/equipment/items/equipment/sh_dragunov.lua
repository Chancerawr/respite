ITEM.name = "SVD Dragunov"
ITEM.desc = "A ruggedly dependable and averagely accurate designated marksman's rifle, developed in the late fifties as a replacement for the SVT-40's role as a marksman's rifle."
ITEM.model = "models/weapons/tfa_w_svd_dragunov.mdl"
ITEM.class = "tfa_dragunov"
ITEM.slot = "primary"
ITEM.width = 5
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Snipers"

ITEM.rarity = 10
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
}

ITEM.dmg = {
	["Sniper"] = 15,
}

ITEM.scaling = {
	["accuracy"] = 0.2,
	["perception"] = 0.2,
}

ITEM.salvage = {
	["parts_gun"] = 4
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Barrel"] = 1,
}

ITEM.iconCam = {
	pos = Vector(-200, 15.5, 4),
	ang = Angle(0, -0, 6),
	fov = 13.5,
}