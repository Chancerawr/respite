ITEM.name = "FN FAL"
ITEM.desc = "A Belgian made, and multi-nationally produced battle rifle hailing from the early days of NATO. This lethally accurate and astonishingly tough rifle has been lovingly called the, 'Right arm of the free world.'"
ITEM.model = "models/weapons/tfa_w_fn_fal.mdl"
ITEM.class = "tfa_fal"
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
	["Rifle"] = 14,
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
	pos = Vector(-200, 12, 2.5),
	ang = Angle(0, -0, 8),
	fov = 13,
}