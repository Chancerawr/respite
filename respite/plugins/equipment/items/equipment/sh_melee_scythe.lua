ITEM.name = "Scythe"
ITEM.desc = "An agricultural hand-tool for mowing grass or harvesting crops."
ITEM.model = "models/models/namje/wep/sickle.mdl"
ITEM.class = "respite_scythe"
ITEM.uniqueID = "respite_scythe"
ITEM.slot = "melee"
ITEM.width = 3
ITEM.height = 2
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Melee"

ITEM.IdleAnim = "idle_melee2"
ITEM.WalkAnim = "walk_melee2"
ITEM.RunAnim = "run_melee2"
ITEM.AttackAnim = "seq_meleeattack01"

--for turn based combat
ITEM.attackRange = 80

ITEM.rarity = 1
ITEM.lootTags = {
	["weapon"] = true,
	["melee"] = true,
	["sharp"] = true,
}

ITEM.dmg = {
	["Slash"] = 24,
}

ITEM.scaling = {
	["stm"] = 0.2,
	["str"] = 0.2,
}

ITEM.salvage = {
	["j_scrap_metals"] = 4,
	["j_scrap_wood"] = 4
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Blade"] = 1,
	["Handle"] = 1
}