ITEM.name = "Bowie Knife"
ITEM.desc = "A rather large tool used to cut things."
ITEM.model = "models/models/danguyen/commandoknife.mdl"
ITEM.class = "respite_knife_bowie"
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
	["factory"] = true,
	["sharp"] = true,
}

ITEM.dmg = {
	["Slash"] = 10,
	["Pierce"] = 5,
}

ITEM.scaling = {
	["stm"] = 0.2,
}

ITEM.actions = {
	"weapon_slash",
	"weapon_stab",
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
	pos = Vector(0, 200, 6),
	ang = Angle(0, 270, 90),
	fov = 4,
}