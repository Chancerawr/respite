ITEM.name = "Car Door"
ITEM.uniqueID = "j_car_door"
ITEM.model = "models/props_vehicles/carparts_door01a.mdl"
ITEM.desc = "A large metal door that was once attached to a car."
ITEM.flag = "j"
ITEM.width = 3
ITEM.height = 3
ITEM.buffCategory = "Shield"

ITEM.salvItem = {
	["j_scrap_metals"] = 5
}

ITEM.attribBoosts = {
	["end"] = 6,
	["stm"] = -10,
}

ITEM.iconCam = {
	pos = Vector(0, 200, 0),
	ang = Angle(0, 270, 0),
	fov = 15,
}