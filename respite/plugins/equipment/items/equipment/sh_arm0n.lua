ITEM.name = "AR-M0N"
ITEM.desc = "A semi-automatic bullpup revolver made out of scrap parts. It uses removable 6-round cylindrical magazines. 'Altruit Industries' is engraved on it's stock. This variant has a extended barrel and a scope."
ITEM.model = "models/weapons/tfa_w_pancor_jackhammer.mdl"
ITEM.material = "models/props_canal/canal_bridge_railing_01b"
ITEM.class = "tfa_arm0n"
ITEM.uniqueID = "tfa_arm0n"
ITEM.slot = "primary"
ITEM.width = 4
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Rifles"

ITEM.rarity = 10
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
}

ITEM.dmg = {
	["Pistol"] = 10,
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
	pos = Vector(-200, 5.5, 3),
	ang = Angle(0, -0, 2),
	fov = 9.5,
}