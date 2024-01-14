ITEM.name = "Stick"
ITEM.desc = "A stick broken off from the branch of a tree."
ITEM.model = "models/props/cs_office/snowman_arm.mdl"
ITEM.class = "respite_stick"
ITEM.uniqueID = "hl2_m_stick"
ITEM.slot = "melee"
ITEM.width = 1
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Melee"

ITEM.rarity = 10
ITEM.lootTags = {
	["weapon"] = true,
	["melee"] = true,
	["sharp"] = true,
	["blunt"] = true,
}

ITEM.dmg = {
	["Blunt"] = 1,
	["Slash"] = 3,
}

ITEM.scaling = {
	["stm"] = 0.1,
	["str"] = 0.1,
}

ITEM.salvage = {
	["j_scrap_wood"] = 1
}

ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 90),
	fov = 3.5,
}