ITEM.name = "Cold Medication"
ITEM.desc = "Medication for the common cold."
ITEM.uniqueID = "medicine_cold"
ITEM.model = "models/props_lab/box01a.mdl"
ITEM.color = Color(0, 128, 128)

ITEM.price = 20

ITEM.cures = {
	["dis_cold"] = true,
}

ITEM.iconCam = {
	pos = Vector(89, 75, 54.5),
	ang = Angle(25, 220, 0),
	fov = 5,
}