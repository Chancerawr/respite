ITEM.name = "Makeshift Sword"
ITEM.desc = "A sharpened piece of scrap metal."
ITEM.model = "models/props_debris/wood_chunk03e.mdl"
ITEM.material = "models/props_pipes/pipesystem01a_skin2"
ITEM.class = "respite_makeshift_sword"
ITEM.uniqueID = "hl2_m_makeshift_sword"
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
	["makeshift"] = true,
	["sharp"] = true,
}

ITEM.dmg = {
	["Slash"] = 17,
}

ITEM.scaling = {
	["stm"] = 0.2,
	["str"] = 0.2,
}

ITEM.salvage = {
	["j_scrap_metals"] = 5
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Blade"] = 1,
	["Handle"] = 1
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 90),
	fov = 19,
}