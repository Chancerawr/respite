local INVENTORY_TYPE_ID = "grid"

ITEM.name = "Brief Case"
ITEM.desc = "A small case that does not carry much."
ITEM.model = "models/props_c17/briefcase001a.mdl"
ITEM.width = 2
ITEM.height = 2
ITEM.invWidth = 3
ITEM.invHeight = 2
ITEM.category = "Storage"
ITEM.flag = "v"
ITEM.uniqueID = "stor_briefcase"

ITEM.isBag = true

ITEM.iconCam = {
	pos = Vector(0, 200, 0),
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