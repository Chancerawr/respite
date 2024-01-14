ITEM.name = "Branch"
ITEM.desc = "A wooden branch pulled off a tree."
ITEM.model = "models/props/cs_office/Snowman_arm.mdl"
ITEM.class = "respite_branch"
ITEM.uniqueID = "hl2_m_branch"
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
	["sharp"] = true,
	["blunt"] = true,
}

ITEM.dmg = {
	["Blunt"] = 6,
	["Slash"] = 2,
}

ITEM.scaling = {
	["stm"] = 0.2,
	["str"] = 0.2,
}

ITEM.salvage = {
	["j_scrap_wood"] = 2
}

ITEM.iconCam = {
	pos = Vector(128.44482421875, 107.6841506958, 78.216918945313),
	ang = Angle(25, 220, 0),
	fov = 4,
}