ITEM.name = "CR-2KA"
ITEM.desc = "A makeshift bolt action rifle assembled from various scraps. It'd be a simple design, however a few nods from a serious designer are left in its construction.\nThis particular variant has a full length barrel."
ITEM.model = "models/weapons/tfa_w_winchester_1873.mdl"
ITEM.material = "models/props_wasteland/quarryobjects01"
ITEM.class = "tfa_cr2ka"
ITEM.uniqueID = "tfa_cr2ka"
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
ITEM.lootTags = {
	"weapon",
	"ranged",
	"firearm",
}

ITEM.dmg = {
	["Rifle"] = 14,
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
	pos = Vector(-200, 12.5, 2),
	ang = Angle(0, -0, 5),
	fov = 15,
}