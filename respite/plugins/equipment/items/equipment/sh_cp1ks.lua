ITEM.name = "CP-1KS"
ITEM.desc = "A fully automatic sub-machinegun made out of various scrap parts. Even with the thick forward grip on this gun, you can feel the barrel heating up after firing for extended periods of time."
ITEM.model = "models/weapons/tfa_w_hk_mp5.mdl"
ITEM.material = "models/props_canal/canal_bridge_railing_01b"
ITEM.class = "tfa_cp1ks"
ITEM.uniqueID = "tfa_cp1ks"
ITEM.slot = "sidearm"
ITEM.width = 3
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Submachine Guns"

ITEM.rarity = 10
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
}

ITEM.dmg = {
	["Pistol"] = 6,
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
	pos = Vector(-200, 6, 2),
	ang = Angle(0, -0, -5),
	fov = 11,
}