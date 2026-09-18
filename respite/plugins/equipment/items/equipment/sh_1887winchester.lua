ITEM.name = "Winchester 1887"
ITEM.desc = "A lever action shotgun hailing from the days of the old West."
ITEM.class = "tfa_1887winchester"
ITEM.slot = "primary"
ITEM.model = "models/weapons/tfa_w_winchester_1887.mdl"
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
	Sound("1887winch.Single"),
}

ITEM.rarity = 1
ITEM.lootTags = {
	["weapon"] = true,
	["ranged"] = true,
	["firearm"] = true,
	["factory"] = true,
}

ITEM.dmg = {
	["Shotgun"] = 20,
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
	pos = Vector(-483.66012573242, 16, 2.5),
	ang = Angle(0, 0, 4),
	fov = 5,
}