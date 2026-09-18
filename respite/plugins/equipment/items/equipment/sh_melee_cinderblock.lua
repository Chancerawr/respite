ITEM.name = "Cinder Block"
ITEM.desc = "A heavy block of concrete."
ITEM.uniqueID = "j_cinder_block"
ITEM.model = "models/props_junk/cinderblock01a.mdl"
ITEM.class = "respite_cinderblock"
ITEM.slot = "melee"
ITEM.width = 1
ITEM.height = 2
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Melee"

ITEM.IdleAnim = "idle_melee"
ITEM.WalkAnim = "walk_melee"
ITEM.RunAnim = "run_melee"
ITEM.AttackAnim = "seq_meleeattack01"

--for turn based combat
ITEM.attackRange = 80

ITEM.salvage = {
	["j_scrap_concrete"] = 2
}

ITEM.rarity = 10
ITEM.lootTags = {
	["weapon"] = true,
	["melee"] = true,
	["makeshift"] = true,
	["blunt"] = true,
}

ITEM.dmg = {
	["Blunt"] = 10,
}

ITEM.scaling = {
	["stm"] = 0.25,
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Bludgeon"] = 1,
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 4,
}