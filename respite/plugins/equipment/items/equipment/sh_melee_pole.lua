ITEM.name = "Metal Pole"
ITEM.desc = "A long metallic pole, it is very heavy."
ITEM.model = "models/props_c17/signpole001.mdl"
ITEM.class = "hl2_m_pole"
ITEM.uniqueID = "hl2_m_pole"
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
	["Blunt"] = 18,
}

ITEM.scaling = {
	["str"] = 0.25,
}

ITEM.salvage = {
	["j_scrap_metals"] = 5
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 54),
	ang = Angle(0, -0, 90),
	fov = 32,
}
