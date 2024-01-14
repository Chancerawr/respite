ITEM.name = "Cigarettes"
ITEM.uniqueID = "j_cigs"
ITEM.model = "models/props_lab/box01a.mdl"
ITEM.material = "models/props/cs_office/file_cabinet3"
ITEM.desc = "A small box filled with cigarettes."

ITEM.width = 1
ITEM.height = 1
ITEM.slot = "Accessory"

ITEM.salvage = {
	["j_scrap_cloth"] = 1
}

ITEM.attrib = {
	["end"] = -1,
	["fortitude"] = 3,
}

--this is a consumable so that it can be an ingredient for crafting
ITEM.loot = {
	["Consumable"] = 0.1,
}

ITEM.upgradeSlots = { 
	["Dream"] = 1,
}

ITEM.craft = {
	hp = -10,
	mp = 5,

	buffTbl = {
		attrib = {
			["str"] = -2,
			["end"] = 3,
		},
		
		res = {
			["Poison"] = -5,
			["Fire"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(89.43, 74.9, 54.5),
	ang = Angle(25, 220, 0),
	fov = 5,
}