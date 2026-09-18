ITEM.name = "Switchblade"
ITEM.desc = "A pocketknife with a sliding blade contained in the handle which is extended automatically by a spring."
ITEM.model = "models/models/namje/wep/bw_wpn_dgr_switchblade.mdl"
ITEM.class = "respite_switchblade"
ITEM.uniqueID = "respite_switchblade"
ITEM.slot = "melee"
ITEM.width = 1
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

ITEM.rarity = 8
ITEM.lootTags = {
	["weapon"] = true,
	["melee"] = true,
	["makeshift"] = true,
	["sharp"] = true,
}

ITEM.dmg = {
	["Slash"] = 10,
	["Pierce"] = 1,
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