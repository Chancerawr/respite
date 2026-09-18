ITEM.name = "Lantern"
ITEM.desc = "A portable lighting device used to illuminate broad areas."
ITEM.model = "models/weapons/cof/w_lantern.mdl"
ITEM.class = "coflantern"
ITEM.uniqueID = "coflantern"
ITEM.slot = "misc"
ITEM.width = 1
ITEM.height = 2
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Tools"

--for turn based combat
ITEM.attackRange = 80

ITEM.rarity = 5
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
	["light"] = true,
}

ITEM.dmg = {
	["Blunt"] = 8,
}

ITEM.scaling = {
	["str"] = 0.1,
}

ITEM.salvage = {
	["parts_gun"] = 2
}

ITEM.upgradeSlots = { 
	["Dream"] = 2,
}

ITEM.iconCam = {
	pos = Vector(0, 200, 9),
	ang = Angle(0, 270, 0),
	fov = 5.5,
}