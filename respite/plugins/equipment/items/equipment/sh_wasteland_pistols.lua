ITEM.name = "Scavenger Pistol (Silenced)"
ITEM.desc = "A poorly made pistol with a poorly made silencer, may jam frequently."
ITEM.model = "models/weapons/w_pistol.mdl"
ITEM.material = "models/props_wasteland/quarryobjects01"
ITEM.class = "tfa_wasteland_pistol_s"
ITEM.uniqueID = "tfa_wasteland_pistol_s"
ITEM.slot = "sidearm"
ITEM.width = 2
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
	["Pistol"] = 5,
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

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Barrel"] = 1,
}

ITEM.iconCam = {
	pos = Vector(-0.5, 200, -2.2),
	ang = Angle(0, 270, -2.5),
	fov = 4.25,
}
