ITEM.name = "Scavenger LMG"
ITEM.desc = "A beefy LMG made out of scrap. A crude cooling tank is attached that helps prevent overheating."
ITEM.model = "models/weapons/w_mach_m249para.mdl"
ITEM.material = "models/props_wasteland/quarryobjects01"
ITEM.class = "tfa_wasteland_lmg"
ITEM.uniqueID = "tfa_wasteland_lmg"
ITEM.slot = "primary"
ITEM.width = 4
ITEM.height = 2
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Scavenger"

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

ITEM.salvage = {
	["parts_gun"] = 5
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Barrel"] = 1,
}

ITEM.iconCam = {
	pos = Vector(2, 200, 6.5),
	ang = Angle(0, 270, 0),
	fov = 11,
}