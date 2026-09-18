ITEM.name = "Machete"
ITEM.desc = "A sharp tool made out of metal, used for slicing."
ITEM.model = "models/warz/melee/machete.mdl"
ITEM.class = "respite_machete"
ITEM.uniqueID = "hl2_m_machate"
ITEM.slot = "melee"
ITEM.width = 3
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

ITEM.rarity = 7
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
	["j_scrap_metals"] = 4
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Blade"] = 1,
	["Handle"] = 1
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 8),
	ang = Angle(0, -0, 90),
	fov = 8,
}