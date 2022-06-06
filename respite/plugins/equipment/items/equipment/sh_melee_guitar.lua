ITEM.name = "Guitar"
ITEM.desc = "A popular musical instrument that makes sound by the playing of its (typically) six strings with the sound being projected either acoustically or through electrical amplification (for an acoustic guitar or an electric guitar, respectively). It is typically played by strumming or plucking the strings with the right hand while fretting the strings with the left hand."
ITEM.model = "models/props_phx/misc/fender.mdl"
ITEM.class = "hl2_m_guitar"
ITEM.uniqueID = "j_guitar"
ITEM.slot = "melee"
ITEM.width = 4
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
	["Blunt"] = 12,
}

ITEM.scaling = {
	["str"] = 0.2,
}

ITEM.salvage = {
	["j_scrap_elecs"] = 2,
	["j_scrap_wood"] = 4
}

ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 90),
	fov = 17,
}