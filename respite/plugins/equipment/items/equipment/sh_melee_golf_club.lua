ITEM.name = "Golf Club"
ITEM.desc = "A metal stick used to hit balls."
ITEM.model = "models/warz/melee/golfclub.mdl"
ITEM.class = "respitie_golfclub"
ITEM.slot = "melee"
ITEM.width = 3
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Melee"

ITEM.rarity = 10
ITEM.lootTags = {
	["weapon"] = true,
	["melee"] = true,
	["blunt"] = true,
}

ITEM.dmg = {
	["Blunt"] = 20,
}

ITEM.scaling = {
	["str"] = 0.2,
}

ITEM.salvage = {
	["j_scrap_metals"] = 4
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Bludgeon"] = 1,
	["Handle"] = 1
}

ITEM.iconCam = {
	pos = Vector(-200, 1, 0),
	ang = Angle(0, -0, 90),
	fov = 11,
}