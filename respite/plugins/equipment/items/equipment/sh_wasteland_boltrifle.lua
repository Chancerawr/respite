ITEM.name = "Scavenger Pipe-Rifle"
ITEM.desc = "A crude, quick bolt-action rifle."
ITEM.model = "models/weapons/w_snip_scout.mdl"
ITEM.material = "models/props_wasteland/metal_tram001a"
ITEM.class = "tfa_wasteland_boltrifle"
ITEM.uniqueID = "tfa_wasteland_boltrifle"
ITEM.slot = "primary"
ITEM.width = 4
ITEM.height = 1
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
	["Rifle"] = 17,
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
	pos = Vector(0, 200, 6),
	ang = Angle(0, 270, 0),
	fov = 13.25,
}
