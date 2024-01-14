ITEM.name = "HK SL8"
ITEM.desc = "A German made, civilian sporting rifle, based off of the G36 series of rifles. Featuring an uncommon single stack magazine, and thumbhole stock."
ITEM.model = "models/weapons/tfa_w_hk_sl8.mdl"
ITEM.class = "tfa_sl8"
ITEM.slot = "primary"
ITEM.width = 4
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
	pos = Vector(-200, 11, 2.5),
	ang = Angle(0, -0, 4),
	fov = 14,
}