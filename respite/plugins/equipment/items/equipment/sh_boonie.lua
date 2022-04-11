ITEM.name = "Leather Boonie"
ITEM.uniqueID = "j_boonie"
ITEM.model = "models/warz/leatherboonie.mdl"
ITEM.desc = "A form of wide-brim hat commonly used by military forces. Its design is similar to a bucket hat but with a stiffer brim."

ITEM.width = 1
ITEM.height = 1
ITEM.slot = "Helmet"

ITEM.armor = 2

ITEM.rarity = 10
ITEM.lootTags = {
	["armor"] = true,
	["helmet"] = true,
}

ITEM.salvage = {
	["j_scrap_cloth"] = 3
}

ITEM.attrib = {
	["perception"] = -1,
	["accuracy"] = 2,
	["luck"] = 1,
	["fortitude"] = 1,
}

ITEM.iconCam = {
	pos = Vector(1.5, 200, 5),
	ang = Angle(0, 270, 0),
	fov = 5.25,
}