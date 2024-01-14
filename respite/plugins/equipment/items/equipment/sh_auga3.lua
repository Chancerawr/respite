ITEM.name = "Steyr AUG A3"
ITEM.desc = "A bullpup assault rifle of Austrian design, featuring an average degree of accuracy for a modern assault rifle."
ITEM.model = "models/weapons/tfa_w_auga3.mdl"
ITEM.class = "tfa_auga3"
ITEM.slot = "primary"
ITEM.width = 3
ITEM.height = 1
ITEM.price = 0
ITEM.category = "Weapons - Rifles"

ITEM.rarity = 10
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
}

ITEM.dmg = {
	["Rifle"] = 15,
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
	pos = Vector(-200, 6, 1.5),
	ang = Angle(0, -0, 11),
	fov = 9.5,
}