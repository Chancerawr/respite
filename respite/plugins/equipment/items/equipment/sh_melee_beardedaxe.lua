ITEM.name = "Bearded Axe"
ITEM.desc = "A sharp tool made out of metal and wood, used for chopping."
ITEM.model = "models/models/namje/wep/bw_wpn_ax_norse.mdl"
ITEM.class = "respite_beardedaxe"
ITEM.uniqueID = "respite_beardedaxe"
ITEM.slot = "melee"
ITEM.width = 4
ITEM.height = 1
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
	["factory"] = true,
	["sharp"] = true,
}

ITEM.dmg = {
	["Slash"] = 25,
}

ITEM.scaling = {
	["stm"] = 0.2,
	["str"] = 0.2,
}

ITEM.salvage = {
	["j_scrap_metals"] = 2,
	["j_scrap_wood"] = 3
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Blade"] = 1,
	["Handle"] = 1
}