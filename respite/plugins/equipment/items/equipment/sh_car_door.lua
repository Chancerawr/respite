ITEM.name = "Car Door"
ITEM.uniqueID = "j_car_door"
ITEM.model = "models/props_vehicles/carparts_door01a.mdl"
ITEM.desc = "A large metal door that was once attached to a car."

ITEM.width = 3
ITEM.height = 3
ITEM.slot = "Shield"

ITEM.armor = 50

ITEM.rarity = 10
ITEM.lootTags = {
	["armor"] = true,
	["shield"] = true,
}

ITEM.dmg = {
	["Blunt"] = 4,
}

ITEM.scaling = {
	["end"] = 0.2,
}

ITEM.salvage = {
	["j_scrap_metals"] = 5
}

ITEM.attrib = {
	["end"] = 4,
	["stm"] = -3,
}

ITEM.upgradeSlots = { 
	["Dream"] = 1,
}

ITEM.iconCam = {
	pos = Vector(0, 200, 0),
	ang = Angle(0, 270, 0),
	fov = 15,
}