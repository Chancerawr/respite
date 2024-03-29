ITEM.name = "CP-R07"
ITEM.desc = "Classy professional looking scrap pistol. Boasts decent controllability for damage although lacking in magazine size. This one has an experimental recoil management system installed."
ITEM.model = "models/weapons/tfa_w_hk45c.mdl"
ITEM.material = "models/props_wasteland/quarryobjects01"
ITEM.class = "tfa_cpr07"
ITEM.uniqueID = "tfa_cpr07"
ITEM.slot = "sidearm"
ITEM.width = 1
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Pistols"

ITEM.rarity = 10
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
}

ITEM.dmg = {
	["Pistol"] = 7,
}

ITEM.scaling = {
	["accuracy"] = 0.2,
	["perception"] = 0.2,
}

ITEM.salvage = {
	["parts_gun"] = 1
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Barrel"] = 1,
}

ITEM.iconCam = {
	pos = Vector(-200, -5, 1.75),
	ang = Angle(0, -0, 0),
	fov = 4,
}