ITEM.name = "Scavenger Bomb Launcher"
ITEM.desc = "A bulky launcher that shoots deadly bombs. Can be used to take down destroyable buildings or easily take down people."
ITEM.model = "models/weapons/w_rocket_launcher.mdl"
ITEM.material = "models/props_wasteland/tugboat02"
ITEM.class = "tfa_wasteland_bomb_launcher"
ITEM.uniqueID = "tfa_wasteland_bomb_launcher"
ITEM.slot = "primary"
ITEM.width = 4
ITEM.height = 2
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Scavenger"

ITEM.rarity = 10
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
}

ITEM.dmg = {
	["Explosion"] = 40,
}

ITEM.scaling = {
	["medical"] = 0.2,
	["perception"] = 0.2,
}

ITEM.salvage = {
	["parts_gun"] = 4
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Barrel"] = 1,
}

ITEM.iconCam = {
	pos = Vector(18, 200, 1.5),
	ang = Angle(0, 270, 0),
	fov = 13.5,
}