ITEM.name = "Plastic Arm"
ITEM.desc = "The arm of a plastic, it's covered in cracks and small pieces are missing here and there."
ITEM.model = "models/dismemberment/gibs/arms.mdl"
ITEM.material = "phoenix_storms/mrref2"
ITEM.class = "hl2_m_mannequinarm"
ITEM.uniqueID = "hl2_m_plastic_arm"
ITEM.slot = "melee"
ITEM.width = 3
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Melee"

ITEM.rarity = 10
ITEM.lootTags = {
	["weapon"] = true,
	["melee"] = true,
	["blunt"] = true,
}

ITEM.dmg = {
	["Blunt"] = 8,
}

ITEM.scaling = {
	["str"] = 0.1,
}

ITEM.salvage = {
	["j_scrap_plastics"] = 3
}

ITEM.iconCam = {
	pos = Vector(-200, -8, 2),
	ang = Angle(0, -0, 0),
	fov = 8,
}
