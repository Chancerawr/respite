ITEM.name = "Steering Wheel"
ITEM.desc = "A steering wheel that has been removed from whatever vehicle it came from."
ITEM.model = "models/gantry_crane/crane_wheel.mdl"
ITEM.class = "hl2_m_steeringwheel"
ITEM.uniqueID = "hl2_m_steeringwheel"
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
	["Blunt"] = 6,
}

ITEM.scaling = {
	["str"] = 0.2,
}

ITEM.salvage = {
	["j_scrap_metals"] = 2
}

ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 0),
	fov = 5,
}