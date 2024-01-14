ITEM.name = "M14"
ITEM.desc = "An American designed and produced battle rifle, descended from the wildly successful M1 series of rifles. Featuring selective fire and a twenty round detachable magazine. This model boasts a polymer stock, and rail assembly, making it more front heavy than normal."
ITEM.model = "models/weapons/tfa_w_snip_m14sp.mdl"
ITEM.class = "tfa_m14sp"
ITEM.slot = "primary"
ITEM.width = 5
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
	["Rifle"] = 15,
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
	pos = Vector(2, 200, 0.5),
	ang = Angle(0, 270, 10),
	fov = 14.5,
}