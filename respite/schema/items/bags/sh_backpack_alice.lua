local INVENTORY_TYPE_ID = "grid"

ITEM.name = "ALICE Pack"
ITEM.desc = "A reliable military backpack."
ITEM.width = 2
ITEM.height = 2
ITEM.invWidth = 3
ITEM.invHeight = 4
ITEM.category = "Storage"
ITEM.flag = "v"
ITEM.model = "models/warz/alicebackpack.mdl"
ITEM.uniqueID = "pack_alice"

ITEM.isBag = true

ITEM.iconCam = {
	pos = Vector(5, 200, 15),
	ang = Angle(0, 270, 0),
	fov = 8.5,
}

--this is used to make checking for other backpacks in the inventory a little less more efficient
ITEM.otherBags = {
	pack = true,
	pack_alice = true,
	pack_enhanced = true,
	stor_suitcase = true,
	stor_briefcase = true
}