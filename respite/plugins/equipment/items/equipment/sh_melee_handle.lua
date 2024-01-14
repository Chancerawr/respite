ITEM.name = "Door Handle"
ITEM.desc = "Metal handle pulled off of a door."
ITEM.model = "models/props/de_train/de_train_doorhandle_01.mdl"
ITEM.class = "respite_doorhandle"
ITEM.uniqueID = "hl2_m_handle"
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
	["blunt"] = true,
}

ITEM.dmg = {
	["Blunt"] = 2,
}

ITEM.scaling = {
	["str"] = 0.2,
}

ITEM.salvage = {
	["j_scrap_metals"] = 1
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Handle"] = 1
}

ITEM.iconCam = {
	pos = Vector(1.25, 2.25, 200),
	ang = Angle(90, 0, 0),
	fov = 2.5,
}