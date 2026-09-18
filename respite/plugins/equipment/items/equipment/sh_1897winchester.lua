ITEM.name = "Winchester 1897"
ITEM.desc = "A short barreled variant of the popular Winchester 1897 pump-action shotgun, better known to a wider audience as the 'Trench Gun'."
ITEM.model = "models/weapons/tfa_w_winchester_1897_trench.mdl"
ITEM.class = "tfa_1897winchester"
ITEM.slot = "primary"
ITEM.width = 3
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Shotguns"

--for CEnts
ITEM.firearm = true

ITEM.attackRange = 500

ITEM.IdleAnim = "idle_shotgun"
ITEM.WalkAnim = "walk_shotgun"
ITEM.RunAnim = "run_shotgun"

ITEM.AttackSounds = {
	Sound("Trench_97.Single"),
}

ITEM.rarity = 1
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
	["factory"] = true,
}

ITEM.dmg = {
	["Shotgun"] = 19,
}

ITEM.scaling = {
	["str"] = 0.2,
	["perception"] = 0.2,
}

ITEM.salvage = {
	["parts_gun"] = 3
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Barrel"] = 1,
	["Shotgun"] = 10,
}

ITEM.iconCam = {
	pos = Vector(-200, 10.5, 2),
	ang = Angle(0, -0, 4.7),
	fov = 8,
}
