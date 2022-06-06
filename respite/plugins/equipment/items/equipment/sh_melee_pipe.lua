ITEM.name = "Metal Pipe"
ITEM.desc = "An old metallic pipe."
ITEM.model = "models/props_canal/mattpipe.mdl"
ITEM.class = "hl2_m_pipe"
ITEM.uniqueID = "hl2_m_pipe"
ITEM.slot = "melee"
ITEM.width = 2
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
	["Blunt"] = 10,
}

ITEM.scaling = {
	["str"] = 0.2,
}

ITEM.salvage = {
	["j_scrap_metals"] = 3
}

ITEM.iconCam = {
	pos = Vector(0, 200, -2.5),
	ang = Angle(0, 270, 90),
	fov = 10,
}