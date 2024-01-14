ITEM.name = "Butterfly Knife"
ITEM.desc = "A sharp tool used to cut things with style."
ITEM.model = "models/warz/melee/butterflyknife.mdl"
ITEM.class = "respite_knifeb"
ITEM.slot = "melee"
ITEM.width = 1
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Melee"

ITEM.rarity = 10
ITEM.lootTags = {
	["weapon"] = true,
	["melee"] = true,
	["factory"] = true,
	["sharp"] = true,
}

ITEM.dmg = {
	["Slash"] = 10,
	["Pierce"] = 12,
}

ITEM.scaling = {
	["stm"] = 0.2,
}

ITEM.salvage = {
	["j_scrap_metals"] = 2
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Blade"] = 1,
	["Handle"] = 1
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 2.1500000953674),
	ang = Angle(0, -0, 90),
	fov = 4,
}