ITEM.name = "Canoe Paddle"
ITEM.desc = "A wooden paddle used to move a canoe."
ITEM.model = "models/warz/melee/canoepaddle.mdl"
ITEM.class = "respite_paddle"
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
	["j_scrap_wood"] = 5
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Bludgeon"] = 1,
	["Handle"] = 1
}

ITEM.iconCam = {
	pos = Vector(-200, 0, -6.5),
	ang = Angle(0, -0, 90),
	fov = 12,
}