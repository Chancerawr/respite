ITEM.name = "CR-3T3"
ITEM.desc = "A pump action rifle that fires custom caseless custom concrete slug rounds. More than a strange design, and while it's not entirely apparent how it might work it makes for a fair rifle with cheap albeit heavy ammo."
ITEM.model = "models/weapons/tfa_w_mossberg_590.mdl"
ITEM.material = "models/props_canal/canal_bridge_railing_01b"
ITEM.class = "tfa_cr3t3"
ITEM.uniqueID = "tfa_cr3t3"
ITEM.slot = "primary"
ITEM.width = 4
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Shotguns"

ITEM.rarity = 10
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
}

ITEM.dmg = {
	["Blunt"] = 20,
}

ITEM.scaling = {
	["str"] = 0.2,
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
	pos = Vector(-200, 10, 1),
	ang = Angle(0, -0, 7),
	fov = 13.5,
}