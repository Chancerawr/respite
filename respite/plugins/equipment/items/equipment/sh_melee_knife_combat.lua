ITEM.name = "Combat Knife"
ITEM.desc = "A sharp tool used to cut things."
ITEM.model = "models/weapons/w_knife_t.mdl"
ITEM.class = "respite_cssknife"
ITEM.uniqueID = "respite_cssknife"
ITEM.slot = "melee"
ITEM.width = 2
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Melee"

ITEM.IdleAnim = "idle_knife"
ITEM.WalkAnim = "walk_knife"
ITEM.RunAnim = "run_knife"
ITEM.AttackAnim = "seq_meleeattack01"

--for turn based combat
ITEM.attackRange = 80

ITEM.rarity = 5
ITEM.lootTags = {
	["weapon"] = true,
	["melee"] = true,
	["makeshift"] = true,
	["sharp"] = true,
}

ITEM.dmg = {
	["Slash"] = 12,
	["Pierce"] = 2,
}

ITEM.scaling = {
	["stm"] = 0.2,
}

ITEM.salvage = {
	["j_scrap_metals"] = 2
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Blade"] = 1,
}