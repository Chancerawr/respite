ITEM.name = "Tomahawk"
ITEM.desc = "A sharp tool made out of metal and wood, used for chopping."
ITEM.model = "models/models/namje/wep/w_tomahawk_thrown.mdl"
ITEM.class = "respite_tomahawk"
ITEM.uniqueID = "respite_tomahawk"
ITEM.slot = "melee"
ITEM.width = 2
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Melee"

ITEM.IdleAnim = "idle_melee"
ITEM.WalkAnim = "walk_melee"
ITEM.RunAnim = "run_melee"
ITEM.AttackAnim = "seq_meleeattack01"

--for turn based combat
ITEM.attackRange = 80

ITEM.rarity = 1
ITEM.lootTags = {
	["weapon"] = true,
	["melee"] = true,
	["factory"] = true,
	["sharp"] = true,
}

ITEM.dmg = {
	["Slash"] = 20,
}

ITEM.scaling = {
	["stm"] = 0.2,
	["str"] = 0.2,
}

ITEM.salvage = {
	["j_scrap_metals"] = 2,
	["j_scrap_wood"] = 2
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Blade"] = 1,
	["Handle"] = 1
}