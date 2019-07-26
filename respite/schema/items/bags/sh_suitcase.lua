ITEM.name = "Suitcase"
ITEM.desc = "A small brown suitcase for extra storage."
ITEM.model = "models/props_c17/suitcase_passenger_physics.mdl"
ITEM.width = 2
ITEM.height = 2
ITEM.invWidth = 4
ITEM.invHeight = 2
ITEM.price = 50
ITEM.category = "Storage"
ITEM.flag = "v"
ITEM.uniqueID = "stor_suitcase"

ITEM.isBag = true

ITEM.iconCam = {
	pos = Vector(0, 200, -9),
	ang = Angle(0, 270, 0),
	fov = 8,
}

--this is used to make checking for other backpacks in the inventory a little less more efficient
ITEM.otherBags = {
	pack = true,
	pack_alice = true,
	pack_enhanced = true,
	stor_suitcase = true,
	stor_briefcase = true
}