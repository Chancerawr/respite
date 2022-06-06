ITEM.name = "Keyboard"
ITEM.desc = "A typewriter-style device which uses an arrangement of buttons or keys to act as a mechanical lever or electronic switch."
ITEM.model = "models/props/cs_office/computer_keyboard.mdl"
ITEM.class = "hl2_m_keyboard"
ITEM.uniqueID = "hl2_m_keyboard"
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
	["Blunt"] = 6,
}

ITEM.scaling = {
	["str"] = 0.2,
}

ITEM.salvage = {
	["j_scrap_elecs"] = 2,
	["j_scrap_screws"] = 2,
	["j_scrap_plastics"] = 3
}

ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 180),
	fov = 11,
}