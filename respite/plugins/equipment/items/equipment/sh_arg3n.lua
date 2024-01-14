ITEM.name = "AR-G3N"
ITEM.desc = "A burst fire rifle with a stock, extended barrel and a holographic sight. The bursts are somewhat hard to control but offer great firepower to the user. 'Altruit Industries' is engraved on it's stock."
ITEM.model = "models/weapons/w_fg42.mdl"
ITEM.material = "models/props_wasteland/tugboat01"
ITEM.class = "tfa_arg3n"
ITEM.uniqueID = "tfa_arg3n"
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