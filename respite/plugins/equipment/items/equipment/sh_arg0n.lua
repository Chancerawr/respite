ITEM.name = "AR-G0N"
ITEM.desc = "A small semi-automatic rifle with no stock and a short barrel. Firing it is uncomfortable but it makes up for it with it's suprising accuracy. 'Altruit Industries' is engraved on it's grip."
ITEM.model = "models/weapons/w_fg42.mdl"
ITEM.material = "models/props_wasteland/tugboat02"
ITEM.class = "tfa_arg0n"
ITEM.uniqueID = "tfa_arg0n"
ITEM.slot = "primary"
ITEM.width = 3
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Altruit"

ITEM.rarity = 10
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
}

ITEM.dmg = {
	["Rifle"] = 14,
}

ITEM.scaling = {
	["accuracy"] = 0.2,
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
	pos = Vector(9.5, 200, 3.5),
	ang = Angle(0, 270, 5),
	fov = 11,
}