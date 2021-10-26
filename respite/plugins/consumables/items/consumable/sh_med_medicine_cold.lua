ITEM.name = "Cold Medication"
ITEM.desc = "Medication for the common cold."
ITEM.uniqueID = "medicine_cold"
ITEM.model = "models/props_lab/box01a.mdl"
ITEM.category = "Medical"
ITEM.color = Color(232, 0, 0)

ITEM.price = 20

ITEM.stomach = false

ITEM.cures = {
	["dis_cold"] = true,
}

ITEM.iconCam = {
	pos = Vector(89, 75, 54.5),
	ang = Angle(25, 220, 0),
	fov = 5,
}