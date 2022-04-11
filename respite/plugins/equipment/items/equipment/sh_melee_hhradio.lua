ITEM.name = "Hand-held Radio"
ITEM.desc = "A busted hand-held radio. You can still hit things with it I guess."
ITEM.model = "models/props/cs_office/radio.mdl"
ITEM.class = "hl2_m_hhradio"
ITEM.uniqueID = "hl2_m_hhradio"
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
	["Blunt"] = 4,
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
	pos = Vector(-200, 0, 5.5),
	ang = Angle(0, -0, 0),
	fov = 7,
}
