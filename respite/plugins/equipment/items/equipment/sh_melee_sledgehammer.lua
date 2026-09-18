ITEM.name = "Makeshift Sledgehammer"
ITEM.desc = "A large hammer usually used to distribute force over a wide area."
ITEM.model = "models/models/danguyen/w_me_sledge.mdl"
ITEM.material = "models/gibs/woodgibs/woodgibs02"
ITEM.class = "respite_makeshift_sledgehammer"
ITEM.uniqueID = "hl2_m_sledgehammer"
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

ITEM.rarity = 7
ITEM.lootTags = {
	["weapon"] = true,
	["melee"] = true,
	["blunt"] = true,
}

ITEM.dmg = {
	["Blunt"] = 24,
}

ITEM.scaling = {
	["str"] = 0.3,
}

ITEM.salvage = {
	["j_scrap_concrete"] = 2,
	["j_scrap_wood"] = 4
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Bludgeon"] = 1,
	["Handle"] = 1
}

ITEM.iconCam = {
	pos = Vector(0, 200, 3),
	ang = Angle(0, 270, 90),
	fov = 12,
}