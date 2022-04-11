ITEM.name = "Makeshift Colt 1911"
ITEM.desc = "A semi-automatic handgun made out of scrap parts."
ITEM.model = "models/weapons/tfa_w_dmgf_co1911.mdl"
ITEM.material = "models/props_pipes/destroyedpipes01a"
ITEM.class = "tfa_colt1911_makeshift"
ITEM.uniqueID = "tfa_colt1911_makeshift"
ITEM.slot = "sidearm"
ITEM.width = 2
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
	["Pistol"] = 6,
}

ITEM.scaling = {
	["accuracy"] = 0.2,
	["perception"] = 0.2,
}

ITEM.iconCam = {
	pos = Vector(0, 200, -2.5),
	ang = Angle(0, 270, 5),
	fov = 4.5,
}