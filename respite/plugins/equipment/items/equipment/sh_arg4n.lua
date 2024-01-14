ITEM.name = "AR-G4N"
ITEM.desc = "A semi-automatic rifle with a stock, extended barrel and a magnified scope. The firing speed isn't that great but it's even more accurate than it's previous version. 'Altruit Industries' is engraved on it's stock."
ITEM.model = "models/weapons/w_fg42.mdl"
ITEM.material = "models/props_c17/metalladder001"
ITEM.class = "tfa_arg4n"
ITEM.uniqueID = "tfa_arg4n"
ITEM.slot = "primary"
ITEM.width = 4
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
	["Rifle"] = 10,
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