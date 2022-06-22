ITEM.name = "Monster Claw"
ITEM.desc = "A medium sized claw torn from some kind of monster."
ITEM.model = "models/gibs/antlion_gib_small_1.mdl"
ITEM.class = "hl2_m_monsterclaw"
ITEM.uniqueID = "j_monster_claw"
ITEM.slot = "melee"
ITEM.width = 1
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Melee"

ITEM.rarity = 10
ITEM.lootTags = {
	["weapon"] = true,
	["melee"] = true,
	["sharp"] = true,
}

ITEM.dmg = {
	["Slash"] = 14,
	["Pierce"] = 2,
}

ITEM.scaling = {
	["stm"] = 0.2,
}

ITEM.salvage = {
	["j_scrap_bone"] = 2
}

--consumable for the sake of crafting
ITEM.loot = {
	["Consumable"] = 0.01,
}

ITEM.craft = {
	buffTbl = {
		attrib = {
			["str"] = 3,
			["stm"] = 1,
			["fortitude"] = -1,
			["perception"] = -1,
		},
		
		amp = {
			["Bleed"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-0.5, 0, 200),
	ang = Angle(90, 0, 90),
	fov = 3,
}