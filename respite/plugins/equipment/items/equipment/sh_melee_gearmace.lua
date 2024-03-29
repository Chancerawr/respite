ITEM.name = "Gear Mace"
ITEM.desc = "A makeshift weapon made out of a gear and car parts."
ITEM.model = "models/props_vehicles/carparts_muffler01a.mdl"
ITEM.class = "respite_gearmace"
ITEM.uniqueID = "hl2_m_gearmace"
ITEM.slot = "melee"
ITEM.width = 3
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Melee"

ITEM.rarity = 10
ITEM.lootTags = {
	["weapon"] = true,
	["melee"] = true,
	["makeshift"] = true,
	["blunt"] = true,
}

ITEM.dmg = {
	["Blunt"] = 24,
}

ITEM.scaling = {
	["str"] = 0.25,
}

ITEM.salvage = {
	["j_scrap_metals"] = 6
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Bludgeon"] = 1,
	["Handle"] = 1
}

ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 90),
	fov = 21,
}