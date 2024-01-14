ITEM.name = "Light Fixture"
ITEM.desc = "A long cylinder that once illuminated areas."
ITEM.model = "models/props_silo/wall_light_off.mdl"
ITEM.class = "respite_lightfixture"
ITEM.uniqueID = "j_wall_light"
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
	["blunt"] = true,
}

ITEM.dmg = {
	["Blunt"] = 10,
}

ITEM.scaling = {
	["str"] = 0.2,
}

ITEM.salvage = {
	["j_scrap_elecs"] = 2,
	["j_scrap_glass"] = 4
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Bludgeon"] = 1,
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 9.5,
}
