ITEM.name = "Cleaver"
ITEM.desc = "A large tool used to chop meat."
ITEM.model = "models/models/danguyen/cleaver.mdl"
ITEM.class = "respite_cleaver"
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

ITEM.rarity = 10
ITEM.lootTags = {
	["weapon"] = true,
	["melee"] = true,
	["factory"] = true,
	["sharp"] = true,
}

ITEM.dmg = {
	["Slash"] = 14,
}

ITEM.scaling = {
	["stm"] = 0.2,
}

ITEM.actions = {
	"weapon_slash",
	"weapon_stab",
}

ITEM.salvage = {
	["j_scrap_metals"] = 2
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Blade"] = 1,
	["Handle"] = 5,
}

ITEM.iconCam = {
	pos = Vector(2, 200, 0),
	ang = Angle(0, 270, 0),
	entAng = Angle(0, 0, 0),
	fov = 5.5,
}