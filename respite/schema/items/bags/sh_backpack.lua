local INVENTORY_TYPE_ID = "grid"

ITEM.name = "Backpack"
ITEM.desc = "A convenient backpack that allows you to carry more things."
ITEM.model = "models/warz/largebackpack.mdl"
ITEM.width = 2
ITEM.height = 2
ITEM.invWidth = 3
ITEM.invHeight = 3
ITEM.category = "Storage"
ITEM.flag = "v"
ITEM.uniqueID = "pack"

ITEM.isBag = true

ITEM.iconCam = {
	pos = Vector(0, 200, 11),
	ang = Angle(0, 270, 0),
	fov = 7,
}

--this is used to make checking for other backpacks in the inventory a little less more efficient
ITEM.otherBags = {
	pack = true,
	pack_alice = true,
	pack_enhanced = true,
	stor_suitcase = true,
	stor_briefcase = true
}