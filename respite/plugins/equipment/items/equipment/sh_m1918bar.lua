ITEM.name = "M1918 BAR"
ITEM.desc = "A heavy, slow firing, magazine fed, squad support weapon from World War II. The weapon is heavy, the ammo is heavy, and the recoil is heavy. Not for the faint of heart, or scrawny of arm."
ITEM.model = "models/weapons/tfa_w_m1918_bar.mdl"
ITEM.class = "tfa_m1918bar"
ITEM.slot = "primary"
ITEM.width = 4
ITEM.height = 1
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
	pos = Vector(-200, 13, 4),
	ang = Angle(0, -0, 6),
	fov = 11.5,
}