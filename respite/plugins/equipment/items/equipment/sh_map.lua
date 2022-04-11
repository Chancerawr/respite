ITEM.name = "Map"
ITEM.desc = "An old paper map."
ITEM.uniqueID = "j_map"
ITEM.model = "models/props_c17/paper01.mdl"
ITEM.material = "models/props_canal/canalmap_sheet"

ITEM.width = 1
ITEM.height = 1
ITEM.slot = "Accessory"

ITEM.salvage = {
	["misc_paper"] = 1
}

ITEM.attrib = {
	["perception"] = 2,
	["medical"] = 2
}

ITEM.iconCam = {
	pos = Vector(0, -3.5, 200),
	ang = Angle(90, 0, 0),
	fov = 7,
}