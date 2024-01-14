ITEM.name = "Sickle"
ITEM.desc = "A single-handed agricultural tool designed with variously curved blades and typically used for harvesting, or reaping."
ITEM.model = "models/models/danguyen/w_gms_sickle.mdl"
ITEM.class = "respite_sickle"
ITEM.slot = "melee"
ITEM.width = 2
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Melee"

ITEM.rarity = 10
ITEM.lootTags = {
	["weapon"] = true,
	["melee"] = true,
	["sharp"] = true,
}

ITEM.dmg = {
	["Slash"] = 12,
	["Pierce"] = 2,
}

ITEM.scaling = {
	["stm"] = 0.2,
}

ITEM.salvage = {
	["j_scrap_metals"] = 3
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Blade"] = 1,
	["Handle"] = 1
}

ITEM.iconCam = {
	pos = Vector(0, 3.5, 200),
	ang = Angle(90, 0, 90),
	fov = 7,
}