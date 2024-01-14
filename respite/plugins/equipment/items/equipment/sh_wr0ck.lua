ITEM.name = "WR-0CK"
ITEM.desc = "A pump-action shotgun made out of various scrap parts. A heavy body paired with a slightly longer bore barrel makes firing this weapon easier on the arms. However the lack of a stock may make firing it an issue for amateur shooters."
ITEM.model = "models/weapons/tfa_w_remington_870_tact.mdl"
ITEM.material = "models/props_wasteland/quarryobjects01"
ITEM.class = "tfa_wr0ck"
ITEM.uniqueID = "tfa_wr0ck"
ITEM.slot = "sidearm"
ITEM.width = 4
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Shotguns"

ITEM.rarity = 10
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
}

ITEM.dmg = {
	["Shotgun"] = 20,
}

ITEM.scaling = {
	["accuracy"] = 0.2,
	["perception"] = 0.2,
}

ITEM.salvage = {
	["parts_gun"] = 3
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Barrel"] = 1,
}

ITEM.iconCam = {
	pos = Vector(-200, 14, 1.5),
	ang = Angle(0, -0, 3),
	fov = 16,
}