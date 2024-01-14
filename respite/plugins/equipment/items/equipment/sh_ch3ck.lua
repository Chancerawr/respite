ITEM.name = "CH-3CK"
ITEM.desc = "Makeshift rocket-launcher. While it seems simple in core design, the munitions are probably the expensive piece. Rumoured to be named after what you should do prior to firing lest you want to blow yourself up."
ITEM.model = "models/mechanics/solid_steel/box_beam_4.mdl"
ITEM.material = "models/props_pipes/destroyedpipes01a"
ITEM.class = "tfa_ch3ck"
ITEM.uniqueID = "tfa_ch3ck"
ITEM.slot = "primary"
ITEM.width = 4
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Misc"

ITEM.rarity = 10
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
}

ITEM.dmg = {
	["Explosion"] = 50,
}

ITEM.scaling = {
	["medical"] = 0.2,
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
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 20,
}