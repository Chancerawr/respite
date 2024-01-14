ITEM.name = "Sledgehammer"
ITEM.desc = "A large hammer usually used to distribute force over a wide area."
ITEM.model = "models/models/danguyen/w_me_sledge.mdl"
ITEM.class = "respite_sledgehammer"
ITEM.uniqueID = "respite_sledgehammer"
ITEM.slot = "melee"
ITEM.width = 4
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
	["Blunt"] = 28,
}

ITEM.scaling = {
	["str"] = 0.4,
}

ITEM.salvage = {
	["j_scrap_concrete"] = 4,
	["j_scrap_wood"] = 2
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Bludgeon"] = 1,
	["Handle"] = 1
}

ITEM.iconCam = {
	pos = Vector(0, 200, 3),
	ang = Angle(0, 270, 90),
	fov = 12,
}