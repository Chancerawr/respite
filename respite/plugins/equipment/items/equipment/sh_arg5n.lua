ITEM.name = "AR-G5N"
ITEM.desc = "A semi-automatic sniper rifle with a stock, greatly extended barrel and a magnified scope. The reworked internals allow it to fire a much larger caliber at the cost of the magazine size. 'Altruit Industries' is engraved on it's stock."
ITEM.model = "models/weapons/w_fg42.mdl"
ITEM.material = "models/props_combine/metal_combinebridge001"
ITEM.class = "tfa_arg5n"
ITEM.uniqueID = "tfa_arg5n"
ITEM.slot = "primary"
ITEM.width = 5
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
	["Sniper"] = 15,
}

ITEM.scaling = {
	["accuracy"] = 0.2,
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
	pos = Vector(9.5, 200, 3.5),
	ang = Angle(0, 270, 5),
	fov = 11,
}