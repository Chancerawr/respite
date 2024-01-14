ITEM.name = "CH-AFE"
ITEM.desc = "A janky flamethrower that looks like a set of pipes tubes and steel cannisters connected and reinforced with bits of scrap.\nRequires both the weapon mounted tank and an external tank connected by a thick boost hose to run."
ITEM.model = "models/weapons/w_rocket_launcher.mdl"
ITEM.material = "models/props_pipes/destroyedpipes01a"
ITEM.class = "tfa_chafe"
ITEM.uniqueID = "tfa_chafe"
ITEM.slot = "primary"
ITEM.width = 4
ITEM.height = 2
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Misc"

ITEM.rarity = 10
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
}

ITEM.dmg = {
	["Fire"] = 10,
}

ITEM.scaling = {
	["medical"] = 0.2,
	["perception"] = 0.2,
}

ITEM.salvage = {
	["parts_gun"] = 2
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Barrel"] = 1,
}

ITEM.iconCam = {
	pos = Vector(18, 200, 2),
	ang = Angle(0, 270, 0),
	fov = 15,
}