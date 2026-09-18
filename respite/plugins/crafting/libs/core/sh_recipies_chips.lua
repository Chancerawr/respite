--COOKING
local PLUGIN = PLUGIN
//
RECIPE = {}
RECIPE.uid = "nut_chip_pouch"
RECIPE.name = "Chip Pouch"
RECIPE.category = "Chips"
RECIPE.model = "models/props_junk/garbage_bag001a.mdl"

RECIPE.items = {
	["j_scrap_cloth"] = 10,
	["cube_chip_enhanced"] = 1
}
RECIPE.result = {
	["cube_chip_pouch"] = 1
}
RECIPES:Register(RECIPE)
//
RECIPE = {}
RECIPE.uid = "nut_chip_memory"
RECIPE.name = "Intrinsic Symbol"
RECIPE.category = "Chips"
RECIPE.model = "models/gibs/metal_gib4.mdl"

RECIPE.items = {
	["cube_chip"] = 1,
	["j_scrap_memory"] = 15
}
RECIPE.result = {
	["cube_chip_memory"] = 1
}
RECIPES:Register(RECIPE)
//
RECIPE = {}
RECIPE.uid = "nut_chip_blight"
RECIPE.name = "Mind Sigil"
RECIPE.category = "Chips"
RECIPE.model = "models/gibs/metal_gib4.mdl"

RECIPE.items = {
	["cube_chip"] = 1,
	["blight"] = 10
}
RECIPE.result = {
	["cube_chip_blight"] = 1
}
RECIPES:Register(RECIPE)
//
RECIPE = {}
RECIPE.uid = "nut_chip_shard"
RECIPE.name = "Flesh Icon"
RECIPE.category = "Chips"
RECIPE.model = "models/gibs/metal_gib4.mdl"

RECIPE.items = {
	["cube_chip"] = 1,
	["shard_dust"] = 10
}
RECIPE.result = {
	["cube_chip_shard"] = 1
}
RECIPES:Register(RECIPE)
//
RECIPE = {}
RECIPE.uid = "nut_chip_enhanced"
RECIPE.name = "Distortion Key"
RECIPE.category = "Chips"
RECIPE.model = "models/gibs/metal_gib4.mdl"

RECIPE.items = {
	["cube_chip"] = 1,
	["distortion"] = 10
}
RECIPE.result = {
	["cube_chip_enhanced"] = 1
}
RECIPES:Register(RECIPE)
//
RECIPE = {}
RECIPE.uid = "nut_chip_ichor"
RECIPE.name = "Soul Mark"
RECIPE.category = "Chips"
RECIPE.model = "models/gibs/metal_gib4.mdl"

RECIPE.items = {
	["cube_chip"] = 1,
	["ichor"] = 10
}
RECIPE.result = {
	["cube_chip_ichor"] = 1
}
RECIPES:Register(RECIPE)
//
RECIPE = {}
RECIPE.uid = "nut_chip_energy"
RECIPE.name = "Voltaic Crest"
RECIPE.category = "Chips"
RECIPE.model = "models/gibs/metal_gib4.mdl"

RECIPE.items = {
	["cube_chip"] = 1,
	["j_scrap_energy"] = 5
}
RECIPE.result = {
	["cube_chip_energy"] = 1
}
RECIPES:Register(RECIPE)
//
RECIPE = {}
RECIPE.uid = "nut_chip_venom"
RECIPE.name = "Toxic Curse"
RECIPE.category = "Chips"
RECIPE.model = "models/gibs/metal_gib4.mdl"

RECIPE.items = {
	["cube_chip"] = 1,
	["drug_venom"] = 10
}
RECIPE.result = {
	["cube_chip_venom"] = 1
}
RECIPES:Register(RECIPE)
//
RECIPE = {}
RECIPE.uid = "nut_chip_rot"
RECIPE.name = "Regalia of Decay"
RECIPE.category = "Chips"
RECIPE.model = "models/gibs/metal_gib4.mdl"

RECIPE.items = {
	["cube_chip"] = 1,
	["j_scrap_rot"] = 5
}
RECIPE.result = {
	["cube_chip_rot"] = 1
}
RECIPES:Register(RECIPE)
//
RECIPE = {}
RECIPE.uid = "nut_chip_cold"
RECIPE.name = "Frosted Signet"
RECIPE.category = "Chips"
RECIPE.model = "models/gibs/metal_gib4.mdl"

RECIPE.items = {
	["cube_chip"] = 1,
	["food_soda_cold"] = 3
}
RECIPE.result = {
	["cube_chip_cold"] = 1
}
RECIPES:Register(RECIPE)
//