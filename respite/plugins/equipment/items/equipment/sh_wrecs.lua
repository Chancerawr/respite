ITEM.name = "WR-ECS"
ITEM.desc = "A semi-automatic rifle made out of various scrap parts. This particular firearm features a double magazine and trigger system. Each firing mechanism operates a seperate magazine.\nThis variant is silenced."
ITEM.model = "models/weapons/tfa_w_fn_fal.mdl"
ITEM.material = "models/props_wasteland/tugboat02"
ITEM.class = "tfa_wrecs"
ITEM.uniqueID = "tfa_wrecs"
ITEM.slot = "sidearm"
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
	["Rifle"] = 14,
}

ITEM.scaling = {
	["accuracy"] = 0.2,
	["perception"] = 0.2,
}

ITEM.iconCam = {
	pos = Vector(-200, 12, 2.5),
	ang = Angle(0, -0, 8),
	fov = 13,
}