ITEM.name = "Scavenger Gatling Gun"
ITEM.desc = "Heavy-duty makeshift gatling gun. May take a few moments to begin firing."
ITEM.model = "models/weapons/w_physics.mdl"
ITEM.material = "models/props_canal/canal_bridge_railing_01b"
ITEM.class = "tfa_wasteland_gatling"
ITEM.uniqueID = "tfa_wasteland_gatling"
ITEM.slot = "primary"
ITEM.width = 4
ITEM.height = 2
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
	["Rifle"] = 12,
}

ITEM.scaling = {
	["str"] = 0.2,
	["perception"] = 0.2,
}

ITEM.salvage = {
	["parts_gun"] = 5
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Barrel"] = 1,
}

ITEM.iconCam = {
	pos = Vector(11.5, 200, 0),
	ang = Angle(0, 270, 0),
	fov = 9.5,
}