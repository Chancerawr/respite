ITEM.name = "Sabre"
ITEM.desc = "A curved sword."
ITEM.model = "models/models/danguyen/saber.mdl"
ITEM.class = "respite_sabre"
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
	["sharp"] = true,
}

ITEM.dmg = {
	["Slash"] = 20,
}

ITEM.scaling = {
	["stm"] = 0.25,
	["str"] = 0.25,
}

ITEM.salvage = {
	["j_scrap_metals"] = 4
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Blade"] = 1,
	["Handle"] = 1
}

ITEM.iconCam = {
	pos = Vector(5, 200, 0),
	ang = Angle(0, 270, 0),
	fov = 12,
}