ITEM.name = "Scavenger SMG"
ITEM.desc = "A rapid-fire scrap submachine gun."
ITEM.model = "models/weapons/w_smg_ump45.mdl"
ITEM.material = "models/props_pipes/pipemetal001a"
ITEM.class = "tfa_wasteland_smg"
ITEM.uniqueID = "tfa_wasteland_smg"
ITEM.slot = "sidearm"
ITEM.width = 3
ITEM.height = 1
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
	["Pistol"] = 8,
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
	pos = Vector(-2.25, 200, 4.5),
	ang = Angle(0, 270, 0),
	fov = 10.75,
}