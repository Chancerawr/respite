ITEM.name = "WP-1MP"
ITEM.desc = "A break-action pistol that holds and fires two bullets at a time. It's a very light weight firearm, resulting in much higher recoil."
ITEM.model = "models/weapons/tfa_w_g2_contender.mdl"
ITEM.material = "models/props_pipes/destroyedpipes01a"
ITEM.class = "tfa_wp1mp"
ITEM.uniqueID = "tfa_wp1mp"
ITEM.slot = "sidearm"
ITEM.width = 2
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Pistols"

ITEM.rarity = 10
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
}

ITEM.dmg = {
	["Pistol"] = 8,
}

ITEM.scaling = {
	["accuracy"] = 0.2,
	["perception"] = 0.2,
}

ITEM.salvage = {
	["parts_gun"] = 1
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Barrel"] = 1,
}

ITEM.iconCam = {
	pos = Vector(-200, 11.5, 2.8),
	ang = Angle(0, -0, 0),
	fov = 9,
}