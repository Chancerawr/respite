ITEM.name = "CH-UNK"
ITEM.desc = "Makeshift meat-launcher that superheats meat before hurling it at a target. You have a strange feeling this was the result of people taking meat puns a bit too far."
ITEM.model = "models/mechanics/solid_steel/box_beam_4.mdl"
ITEM.material = "models/props_canal/canal_bridge_railing_01a"
ITEM.class = "tfa_chunk"
ITEM.uniqueID = "tfa_chunk"
ITEM.slot = "primary"
ITEM.width = 3
ITEM.height = 1
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
	["Blunt"] = 10,
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
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 20,
}