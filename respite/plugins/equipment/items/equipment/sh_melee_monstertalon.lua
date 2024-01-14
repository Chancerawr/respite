ITEM.name = "Monster Talon"
ITEM.prefix = "Talon"
ITEM.desc = "A huge sharp talon torn from some kind of monster."
ITEM.model = "models/gibs/antlion_gib_medium_3.mdl"
ITEM.class = "respite_monster_talon"
ITEM.uniqueID = "hl2_m_monstertalon"
ITEM.slot = "melee"
ITEM.width = 1
ITEM.height = 2
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
	["Slash"] = 16,
	["Pierce"] = 4,
}

ITEM.scaling = {
	["stm"] = 0.2,
	["str"] = 0.2,
}

ITEM.salvage = {
	["j_scrap_bone"] = 4
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Blade"] = 1,
}

--consumable for the sake of crafting
ITEM.loot = {
	["Consumable"] = 0.01,
}

ITEM.craft = {
	buffTbl = {
		attrib = {
			["str"] = 2,
			["stm"] = 0.5,
			["fortitude"] = -0.5,
			["perception"] = -0.5,
		},
		
		amp = {
			["Bleed"] = 2.5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 90),
	fov = 5.5,
}